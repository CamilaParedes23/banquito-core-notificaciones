package com.banquito.platform.notification.api.dto.api;

import jakarta.validation.constraints.NotBlank;
import java.util.Map;

public record TestNotificationRequest(
        @NotBlank String recipient,
        String recipientName,
        String eventType,
        String templateCode,
        Map<String, Object> payload
) { }
