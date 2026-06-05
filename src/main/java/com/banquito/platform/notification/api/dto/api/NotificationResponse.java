package com.banquito.platform.notification.api.dto.api;

import java.time.LocalDateTime;
import java.util.Map;

public record NotificationResponse(
        String notificationUuid,
        String correlationId,
        String eventType,
        String originService,
        String priority,
        String channelType,
        String recipient,
        String recipientName,
        String templateCode,
        String renderedSubject,
        String renderedBody,
        String status,
        String evidenceDocumentUuid,
        LocalDateTime requestedAt,
        LocalDateTime lastAttemptAt,
        LocalDateTime sentAt
) { }
