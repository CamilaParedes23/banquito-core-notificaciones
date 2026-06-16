package com.banquito.platform.notification.api.controller;

import com.banquito.platform.notification.api.dto.api.NotificationResponse;
import com.banquito.platform.notification.api.dto.internal.InternalNotificationRequest;
import com.banquito.platform.notification.application.service.NotificationService;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/internal/v1/notifications")
public class InternalNotificationController {

    private final NotificationService notificationService;

    public InternalNotificationController(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    @PostMapping("/requests")
    public NotificationResponse request(@Valid @RequestBody InternalNotificationRequest request) {
        return notificationService.solicitarNotificacionInterna(request);
    }
}
