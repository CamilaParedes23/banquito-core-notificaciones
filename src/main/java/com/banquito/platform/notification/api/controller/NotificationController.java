package com.banquito.platform.notification.api.controller;

import com.banquito.platform.notification.api.dto.api.*;
import com.banquito.platform.notification.application.service.NotificationService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/v1/notifications")
@RequiredArgsConstructor
@PreAuthorize("hasRole('ADMIN_SEGURIDAD') or hasAuthority('SCOPE_notification.send')")
public class NotificationController {
    private final NotificationService notificationService;

    @GetMapping("/templates")
    public List<TemplateResponse> listTemplates(@RequestParam(required = false) String eventType) {
        return notificationService.listarTemplates(eventType);
    }

    @PostMapping("/templates")
    public TemplateResponse createTemplate(@Valid @RequestBody TemplateRequest request) {
        return notificationService.crearTemplate(request);
    }

    @PatchMapping("/templates/{templateCode}")
    public TemplateResponse updateTemplate(@PathVariable String templateCode, @RequestBody TemplateUpdateRequest request) {
        return notificationService.actualizarTemplate(templateCode, request);
    }

    @PostMapping("/requests")
    public NotificationResponse requestNotification(@Valid @RequestBody NotificationRequestDto request) {
        return notificationService.solicitarNotificacion(request);
    }

    @GetMapping("/requests/{notificationUuid}")
    public NotificationResponse getRequest(@PathVariable String notificationUuid) {
        return notificationService.obtenerNotificacion(notificationUuid);
    }

    @GetMapping("/{notificationUuid}")
    public NotificationResponse getNotificationAlias(@PathVariable String notificationUuid) {
        return notificationService.obtenerNotificacion(notificationUuid);
    }

    @GetMapping("/requests/{notificationUuid}/attempts")
    public List<DeliveryAttemptResponse> getAttempts(@PathVariable String notificationUuid) {
        return notificationService.listarIntentos(notificationUuid);
    }

    @PostMapping("/test")
    public NotificationResponse testNotification(@Valid @RequestBody TestNotificationRequest request) {
        return notificationService.probarNotificacion(request);
    }
}
