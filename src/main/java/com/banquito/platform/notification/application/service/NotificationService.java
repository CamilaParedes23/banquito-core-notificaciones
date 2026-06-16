package com.banquito.platform.notification.application.service;

import com.banquito.platform.notification.api.dto.api.*;
import com.banquito.platform.notification.api.dto.internal.InternalNotificationRequest;
import com.banquito.platform.notification.domain.enums.*;
import com.banquito.platform.notification.domain.model.*;
import com.banquito.platform.notification.domain.repository.*;
import com.banquito.platform.notification.shared.exception.BusinessException;
import com.banquito.platform.notification.shared.util.JsonUtil;
import com.banquito.platform.notification.infrastructure.email.NotificationSendResult;
import com.banquito.platform.notification.infrastructure.email.SmtpNotificationSender;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class NotificationService {
    private final NotificationTemplateRepository templateRepository;
    private final NotificationRequestRepository requestRepository;
    private final NotificationDeliveryAttemptRepository attemptRepository;
    private final NotificationChannelConfigRepository channelRepository;
    private final NotificationPreferenceRepository preferenceRepository;
    private final AuditoriaNotificationEventoRepository auditRepository;
    private final SmtpNotificationSender smtpNotificationSender;

    @Transactional(readOnly = true)
    public List<TemplateResponse> listarTemplates(String eventType) {
        List<NotificationTemplate> templates = eventType == null || eventType.isBlank()
                ? templateRepository.findByEstadoOrderByCodigoAsc(EstadoBasicoEnum.ACTIVO)
                : templateRepository.findByTipoEventoAndEstadoOrderByCodigoAsc(eventType, EstadoBasicoEnum.ACTIVO);
        return templates.stream().map(this::toTemplateResponse).toList();
    }

    @Transactional
    public TemplateResponse crearTemplate(TemplateRequest request) {
        if (templateRepository.existsByCodigo(request.code())) {
            throw new BusinessException("NOTIFICATION_TEMPLATE_DUPLICATED", "Ya existe una plantilla con el código indicado", HttpStatus.CONFLICT);
        }
        TipoCanalEnum canal = parseEnum(TipoCanalEnum.class, request.channelType(), "NOTIFICATION_CHANNEL_INVALID", "Tipo de canal inválido");
        NotificationTemplate template = NotificationTemplate.crear(request.code(), request.eventType(), canal, request.subjectTemplate(), request.bodyTemplate(), request.language());
        NotificationTemplate saved = templateRepository.save(template);
        registrarAuditoria(null, "CREATE_TEMPLATE", "NOTIFICATION_TEMPLATE", saved.getCodigo(), ResultadoAuditoriaNotificationEnum.OK, null);
        return toTemplateResponse(saved);
    }

    @Transactional
    public TemplateResponse actualizarTemplate(String templateCode, TemplateUpdateRequest request) {
        NotificationTemplate template = templateRepository.findByCodigo(templateCode)
                .orElseThrow(() -> new BusinessException("NOTIFICATION_TEMPLATE_NOT_FOUND", "Plantilla no encontrada", HttpStatus.NOT_FOUND));
        EstadoBasicoEnum estado = request.status() == null ? null : parseEnum(EstadoBasicoEnum.class, request.status(), "NOTIFICATION_TEMPLATE_STATUS_INVALID", "Estado de plantilla inválido");
        template.actualizar(request.subjectTemplate(), request.bodyTemplate(), estado);
        NotificationTemplate saved = templateRepository.save(template);
        registrarAuditoria(null, "UPDATE_TEMPLATE", "NOTIFICATION_TEMPLATE", saved.getCodigo(), ResultadoAuditoriaNotificationEnum.OK, null);
        return toTemplateResponse(saved);
    }

    @Transactional
    public NotificationResponse solicitarNotificacion(NotificationRequestDto dto) {
        TipoCanalEnum canal = parseEnum(TipoCanalEnum.class, dto.channelType(), "NOTIFICATION_CHANNEL_INVALID", "Tipo de canal inválido");
        PrioridadNotificacionEnum prioridad = dto.priority() == null || dto.priority().isBlank() ? PrioridadNotificacionEnum.NORMAL : parseEnum(PrioridadNotificacionEnum.class, dto.priority(), "NOTIFICATION_PRIORITY_INVALID", "Prioridad inválida");
        validarCanalActivo(canal);

        NotificationTemplate template = resolverTemplate(dto.templateCode(), dto.eventType(), canal);
        String subject = dto.subject() != null ? dto.subject() : render(template == null ? null : template.getAsuntoTemplate(), dto.payload());
        String body = dto.body() != null ? dto.body() : render(template == null ? null : template.getCuerpoTemplate(), dto.payload());
        if (body == null || body.isBlank()) throw new BusinessException("NOTIFICATION_BODY_REQUIRED", "El cuerpo de la notificación es obligatorio", HttpStatus.BAD_REQUEST);

        NotificationRequest request = NotificationRequest.crear(dto.correlationId(), dto.eventType(), dto.originService(), prioridad, canal,
                dto.recipient(), dto.recipientName(), template == null ? dto.templateCode() : template.getCodigo(), subject, body, JsonUtil.toJson(dto.payload()));
        request.setUuidDocumentoEvidencia(dto.evidenceDocumentUuid());
        NotificationRequest saved = requestRepository.save(request);
        procesarEnvio(saved);
        registrarAuditoria(saved.getUuidCorrelacion(), "REQUEST_NOTIFICATION", "NOTIFICATION_REQUEST", saved.getUuidNotificacion(), ResultadoAuditoriaNotificationEnum.OK, null);
        return toNotificationResponse(saved);
    }

    @Transactional
    public NotificationResponse solicitarNotificacionInterna(InternalNotificationRequest dto) {
        TipoCanalEnum canal = parseEnum(
                TipoCanalEnum.class,
                dto.channelType(),
                "NOTIFICATION_CHANNEL_INVALID",
                "Tipo de canal inválido"
        );
        PrioridadNotificacionEnum prioridad =
                dto.priority() == null || dto.priority().isBlank()
                        ? PrioridadNotificacionEnum.NORMAL
                        : parseEnum(
                                PrioridadNotificacionEnum.class,
                                dto.priority(),
                                "NOTIFICATION_PRIORITY_INVALID",
                                "Prioridad inválida"
                        );
        validarCanalActivo(canal);

        String recipient = resolverDestino(
                dto.actorUuid(),
                dto.eventType(),
                canal,
                dto.recipient()
        );

        var existing = requestRepository
                .findFirstByUuidEventoOrigenAndTipoEventoAndDestinatario(
                        dto.sourceEventUuid(),
                        dto.eventType(),
                        recipient
                );
        if (existing.isPresent()) {
            NotificationRequest request = existing.get();
            if (request.getEstado() != EstadoNotificacionEnum.ENVIADA) {
                procesarEnvio(request);
            }
            return toNotificationResponse(request);
        }

        NotificationTemplate template = resolverTemplate(dto.templateCode(), dto.eventType(), canal);
        String subject = dto.subject() != null
                ? dto.subject()
                : render(template == null ? null : template.getAsuntoTemplate(), dto.payload());
        String body = dto.body() != null
                ? dto.body()
                : render(template == null ? null : template.getCuerpoTemplate(), dto.payload());

        if (body == null || body.isBlank()) {
            throw new BusinessException(
                    "NOTIFICATION_BODY_REQUIRED",
                    "El cuerpo de la notificación es obligatorio",
                    HttpStatus.BAD_REQUEST
            );
        }

        NotificationRequest request = NotificationRequest.crear(
                dto.correlationId(),
                dto.eventType(),
                dto.originService(),
                prioridad,
                canal,
                recipient,
                dto.recipientName(),
                template == null ? dto.templateCode() : template.getCodigo(),
                subject,
                body,
                JsonUtil.toJson(dto.payload())
        );
        request.setUuidEventoOrigen(dto.sourceEventUuid());
        request.setUuidActorDestinatario(dto.actorUuid());
        request.setUuidDocumentoEvidencia(dto.evidenceDocumentUuid());

        NotificationRequest saved = requestRepository.saveAndFlush(request);
        procesarEnvio(saved);
        registrarAuditoria(
                saved.getUuidCorrelacion(),
                "REQUEST_INTERNAL_NOTIFICATION",
                "NOTIFICATION_REQUEST",
                saved.getUuidNotificacion(),
                ResultadoAuditoriaNotificationEnum.OK,
                null
        );
        return toNotificationResponse(saved);
    }

    @Transactional(readOnly = true)
    public NotificationResponse obtenerNotificacion(String notificationUuid) {
        return requestRepository.findByUuidNotificacion(notificationUuid).map(this::toNotificationResponse)
                .orElseThrow(() -> new BusinessException("NOTIFICATION_REQUEST_NOT_FOUND", "Solicitud de notificación no encontrada", HttpStatus.NOT_FOUND));
    }

    @Transactional(readOnly = true)
    public List<DeliveryAttemptResponse> listarIntentos(String notificationUuid) {
        NotificationRequest request = requestRepository.findByUuidNotificacion(notificationUuid)
                .orElseThrow(() -> new BusinessException("NOTIFICATION_REQUEST_NOT_FOUND", "Solicitud de notificación no encontrada", HttpStatus.NOT_FOUND));
        return attemptRepository.findByNotificationRequestIdOrderByIntentoNumeroAsc(request.getId()).stream().map(this::toAttemptResponse).toList();
    }

    @Transactional
    public NotificationResponse probarNotificacion(TestNotificationRequest request) {
        NotificationRequestDto dto = new NotificationRequestDto(
                "99999999-9999-9999-9999-999999999999",
                request.eventType() == null || request.eventType().isBlank() ? "NOTIFICATION_TEST" : request.eventType(),
                "NOTIFICATION_SERVICE",
                "NORMAL",
                "EMAIL",
                request.recipient(),
                request.recipientName(),
                request.templateCode(),
                "Prueba de notificación BanQuito",
                null,
                request.payload() == null ? Map.of("nombre", request.recipientName() == null ? "Usuario" : request.recipientName(), "monto", "0.00", "cuenta", "000") : request.payload(),
                null
        );
        return solicitarNotificacion(dto);
    }

    private void procesarEnvio(NotificationRequest request) {
        long numero = attemptRepository.countByNotificationRequestId(request.getId()) + 1;
        NotificationSendResult result = smtpNotificationSender.send(request);
        if (result.success()) {
            request.marcarEnviada();
            requestRepository.save(request);
            attemptRepository.save(NotificationDeliveryAttempt.crear(
                    request,
                    (int) numero,
                    EstadoIntentoEntregaEnum.ENVIADA,
                    result.responseCode(),
                    result.responseMessage()
            ));
        } else {
            request.marcarFallida();
            requestRepository.save(request);
            attemptRepository.save(NotificationDeliveryAttempt.crear(
                    request,
                    (int) numero,
                    EstadoIntentoEntregaEnum.FALLIDA,
                    result.responseCode(),
                    result.responseMessage()
            ));
            registrarAuditoria(request.getUuidCorrelacion(), "SEND_NOTIFICATION", "NOTIFICATION_REQUEST", request.getUuidNotificacion(), ResultadoAuditoriaNotificationEnum.ERROR, result.responseMessage());
        }
    }

    private String resolverDestino(String actorUuid,
                                   String eventType,
                                   TipoCanalEnum canal,
                                   String explicitRecipient) {
        if (explicitRecipient != null && !explicitRecipient.isBlank()) {
            return explicitRecipient.trim();
        }
        if (actorUuid == null || actorUuid.isBlank()) {
            throw new BusinessException(
                    "NOTIFICATION_RECIPIENT_REQUIRED",
                    "No existe destinatario ni actor para resolver la notificación",
                    HttpStatus.UNPROCESSABLE_ENTITY
            );
        }

        NotificationPreference preference = preferenceRepository
                .findByUuidActorAndTipoEventoAndTipoCanal(actorUuid.trim(), eventType, canal)
                .or(() -> preferenceRepository.findByUuidActorAndTipoEventoAndTipoCanal(
                        actorUuid.trim(),
                        "*",
                        canal
                ))
                .filter(item -> Boolean.TRUE.equals(item.getHabilitado()))
                .filter(item -> item.getDestino() != null && !item.getDestino().isBlank())
                .orElseThrow(() -> new BusinessException(
                        "NOTIFICATION_PREFERENCE_NOT_FOUND",
                        "No existe un destino de notificación habilitado para el actor",
                        HttpStatus.UNPROCESSABLE_ENTITY
                ));
        return preference.getDestino().trim();
    }

    private NotificationTemplate resolverTemplate(String templateCode, String eventType, TipoCanalEnum canal) {
        if (templateCode != null && !templateCode.isBlank()) {
            return templateRepository.findByCodigo(templateCode)
                    .orElseThrow(() -> new BusinessException("NOTIFICATION_TEMPLATE_NOT_FOUND", "Plantilla no encontrada", HttpStatus.NOT_FOUND));
        }
        return templateRepository.findFirstByTipoEventoAndTipoCanalAndEstadoOrderByIdAsc(eventType, canal, EstadoBasicoEnum.ACTIVO).orElse(null);
    }

    private void validarCanalActivo(TipoCanalEnum canal) {
        boolean existe = channelRepository.findByEstadoOrderByCodigoAsc(EstadoBasicoEnum.ACTIVO).stream().anyMatch(c -> c.getTipoCanal() == canal);
        if (!existe) throw new BusinessException("NOTIFICATION_CHANNEL_NOT_AVAILABLE", "No existe un canal activo para el tipo solicitado", HttpStatus.UNPROCESSABLE_ENTITY);
    }

    private String render(String template, Map<String, Object> payload) {
        if (template == null) return null;
        String result = template;
        if (payload != null) {
            for (Map.Entry<String, Object> entry : payload.entrySet()) {
                result = result.replace("{{" + entry.getKey() + "}}", entry.getValue() == null ? "" : String.valueOf(entry.getValue()));
            }
        }
        return result;
    }

    private TemplateResponse toTemplateResponse(NotificationTemplate t) {
        return new TemplateResponse(t.getCodigo(), t.getTipoEvento(), t.getTipoCanal().name(), t.getAsuntoTemplate(), t.getCuerpoTemplate(), t.getIdioma(), t.getEstado().name());
    }

    private NotificationResponse toNotificationResponse(NotificationRequest r) {
        return new NotificationResponse(r.getUuidNotificacion(), r.getUuidCorrelacion(), r.getTipoEvento(), r.getOrigenServicio(), r.getPrioridad().name(), r.getTipoCanal().name(), r.getDestinatario(), r.getDestinatarioNombre(), r.getTemplateCodigo(), r.getAsuntoRenderizado(), r.getCuerpoRenderizado(), r.getEstado().name(), r.getUuidDocumentoEvidencia(), r.getFechaSolicitud(), r.getFechaUltimoIntento(), r.getFechaEnvio());
    }

    private DeliveryAttemptResponse toAttemptResponse(NotificationDeliveryAttempt a) {
        return new DeliveryAttemptResponse(a.getIntentoNumero(), a.getProveedor(), a.getEstado().name(), a.getCodigoRespuesta(), a.getMensajeRespuesta(), a.getFechaIntento());
    }

    private void registrarAuditoria(String correlacion, String accion, String entidad, String entidadId, ResultadoAuditoriaNotificationEnum resultado, String detalle) {
        auditRepository.save(AuditoriaNotificationEvento.crear(correlacion, accion, entidad, entidadId, resultado, detalle));
    }

    private <E extends Enum<E>> E parseEnum(Class<E> type, String value, String code, String message) {
        try { return Enum.valueOf(type, value); }
        catch (Exception e) { throw new BusinessException(code, message, HttpStatus.BAD_REQUEST); }
    }
}
