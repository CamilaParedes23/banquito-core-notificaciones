package com.banquito.platform.notification.grpc;

import com.banquito.platform.notification.api.dto.api.NotificationRequestDto;
import com.banquito.platform.notification.api.dto.api.NotificationResponse;
import com.banquito.platform.notification.api.dto.internal.InternalNotificationRequest;
import com.banquito.platform.notification.application.service.NotificationService;
import com.banquito.platform.notification.shared.exception.BusinessException;
import io.grpc.Status;
import io.grpc.stub.StreamObserver;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import tools.jackson.core.type.TypeReference;
import tools.jackson.databind.ObjectMapper;

import java.util.Map;

@Component
public class NotificationGrpcService extends NotificationInternalServiceGrpc.NotificationInternalServiceImplBase {

    private final NotificationService notificationService;
    private final ObjectMapper objectMapper;

    public NotificationGrpcService(NotificationService notificationService, ObjectMapper objectMapper) {
        this.notificationService = notificationService;
        this.objectMapper = objectMapper;
    }

    @Override
    public void sendTemplatedNotification(
            SendTemplatedNotificationRequest request,
            StreamObserver<NotificationReply> responseObserver) {
        try {
            validateRequired(request.getSourceEventUuid(), "NOTIFICATION_SOURCE_EVENT_REQUIRED", "El UUID del evento origen es obligatorio");
            validateRequired(request.getEventType(), "NOTIFICATION_EVENT_TYPE_REQUIRED", "El tipo de evento es obligatorio");
            validateRequired(request.getOriginService(), "NOTIFICATION_ORIGIN_REQUIRED", "El servicio origen es obligatorio");
            validateRequired(request.getChannelType(), "NOTIFICATION_CHANNEL_REQUIRED", "El canal es obligatorio");

            InternalNotificationRequest dto = new InternalNotificationRequest(
                    request.getSourceEventUuid(),
                    blankToNull(request.getCorrelationId()),
                    request.getEventType(),
                    request.getOriginService(),
                    blankToNull(request.getPriority()),
                    request.getChannelType(),
                    blankToNull(request.getActorUuid()),
                    blankToNull(request.getActorType()),
                    blankToNull(request.getRecipient()),
                    blankToNull(request.getRecipientName()),
                    blankToNull(request.getTemplateCode()),
                    blankToNull(request.getSubject()),
                    blankToNull(request.getBody()),
                    parseMap(request.getPayloadJson()),
                    blankToNull(request.getEvidenceDocumentUuid())
            );

            NotificationResponse response = notificationService.solicitarNotificacionInterna(dto);
            responseObserver.onNext(toReply(response, "Notificación procesada"));
            responseObserver.onCompleted();
        } catch (Exception exception) {
            responseObserver.onError(toStatus(exception));
        }
    }

    @Override
    public void getNotificationStatus(
            GetNotificationStatusRequest request,
            StreamObserver<NotificationStatusReply> responseObserver) {
        try {
            validateRequired(request.getNotificationUuid(), "NOTIFICATION_UUID_REQUIRED", "El UUID de la notificación es obligatorio");
            NotificationResponse response = notificationService.obtenerNotificacion(request.getNotificationUuid());
            int attempts = notificationService.listarIntentos(request.getNotificationUuid()).size();
            responseObserver.onNext(NotificationStatusReply.newBuilder()
                    .setNotificationUuid(nonNull(response.notificationUuid()))
                    .setStatus(nonNull(response.status()))
                    .setSentAt(response.sentAt() == null ? "" : response.sentAt().toString())
                    .setAttempts(attempts)
                    .build());
            responseObserver.onCompleted();
        } catch (Exception exception) {
            responseObserver.onError(toStatus(exception));
        }
    }

    @Override
    public void registerNotificationEvent(
            RegisterNotificationEventRequest request,
            StreamObserver<NotificationReply> responseObserver) {
        try {
            validateRequired(request.getEventType(), "NOTIFICATION_EVENT_TYPE_REQUIRED", "El tipo de evento es obligatorio");
            validateRequired(request.getOriginService(), "NOTIFICATION_ORIGIN_REQUIRED", "El servicio origen es obligatorio");
            validateRequired(request.getChannelType(), "NOTIFICATION_CHANNEL_REQUIRED", "El canal es obligatorio");
            validateRequired(request.getRecipient(), "NOTIFICATION_RECIPIENT_REQUIRED", "El destinatario es obligatorio");

            NotificationRequestDto dto = new NotificationRequestDto(
                    blankToNull(request.getCorrelationId()),
                    request.getEventType(),
                    request.getOriginService(),
                    blankToNull(request.getPriority()),
                    request.getChannelType(),
                    request.getRecipient(),
                    blankToNull(request.getRecipientName()),
                    null,
                    blankToNull(request.getSubject()),
                    blankToNull(request.getBody()),
                    Map.of(),
                    blankToNull(request.getEvidenceDocumentUuid())
            );
            NotificationResponse response = notificationService.solicitarNotificacion(dto);
            responseObserver.onNext(toReply(response, "Evento de notificación procesado"));
            responseObserver.onCompleted();
        } catch (Exception exception) {
            responseObserver.onError(toStatus(exception));
        }
    }

    private NotificationReply toReply(NotificationResponse response, String message) {
        return NotificationReply.newBuilder()
                .setNotificationUuid(nonNull(response.notificationUuid()))
                .setStatus(nonNull(response.status()))
                .setMessage(message)
                .build();
    }

    private Map<String, Object> parseMap(String json) throws Exception {
        if (json == null || json.isBlank()) {
            return Map.of();
        }
        return objectMapper.readValue(json, new TypeReference<Map<String, Object>>() { });
    }

    private RuntimeException toStatus(Exception exception) {
        if (exception instanceof BusinessException businessException) {
            return mapStatus(businessException.getStatus())
                    .withDescription(businessException.getCode() + "|" + businessException.getMessage())
                    .withCause(exception)
                    .asRuntimeException();
        }
        return Status.INTERNAL
                .withDescription("NOTIFICATION_GRPC_INTERNAL_ERROR|Error interno del servicio de notificaciones")
                .withCause(exception)
                .asRuntimeException();
    }

    private Status mapStatus(HttpStatus status) {
        if (status == HttpStatus.BAD_REQUEST || status == HttpStatus.UNPROCESSABLE_ENTITY) return Status.INVALID_ARGUMENT;
        if (status == HttpStatus.NOT_FOUND) return Status.NOT_FOUND;
        if (status == HttpStatus.CONFLICT) return Status.ALREADY_EXISTS;
        if (status == HttpStatus.UNAUTHORIZED) return Status.UNAUTHENTICATED;
        if (status == HttpStatus.FORBIDDEN) return Status.PERMISSION_DENIED;
        if (status == HttpStatus.SERVICE_UNAVAILABLE) return Status.UNAVAILABLE;
        return Status.INTERNAL;
    }

    private void validateRequired(String value, String code, String message) {
        if (value == null || value.isBlank()) {
            throw new BusinessException(code, message, HttpStatus.BAD_REQUEST);
        }
    }

    private String blankToNull(String value) {
        return value == null || value.isBlank() ? null : value;
    }

    private String nonNull(String value) {
        return value == null ? "" : value;
    }
}
