package com.banquito.platform.notification.api.dto.api;

import jakarta.validation.constraints.NotBlank;
import java.util.Map;

public record NotificationRequestDto(
        String correlationId,
        @NotBlank String eventType,
        @NotBlank String originService,
        String priority,
        @NotBlank String channelType,
        @NotBlank String recipient,
        String recipientName,
        String templateCode,
        String subject,
        String body,
        Map<String, Object> payload,
        String evidenceDocumentUuid
) { }
