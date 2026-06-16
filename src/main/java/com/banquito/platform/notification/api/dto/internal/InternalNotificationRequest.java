package com.banquito.platform.notification.api.dto.internal;

import jakarta.validation.constraints.NotBlank;

import java.util.Map;

public record InternalNotificationRequest(
        @NotBlank String sourceEventUuid,
        String correlationId,
        @NotBlank String eventType,
        @NotBlank String originService,
        String priority,
        @NotBlank String channelType,
        String actorUuid,
        String actorType,
        String recipient,
        String recipientName,
        String templateCode,
        String subject,
        String body,
        Map<String, Object> payload,
        String evidenceDocumentUuid
) {
}
