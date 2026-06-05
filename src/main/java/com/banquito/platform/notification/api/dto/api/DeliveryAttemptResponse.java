package com.banquito.platform.notification.api.dto.api;

import java.time.LocalDateTime;

public record DeliveryAttemptResponse(Integer attemptNumber, String provider, String status, String responseCode, String responseMessage, LocalDateTime attemptedAt) { }
