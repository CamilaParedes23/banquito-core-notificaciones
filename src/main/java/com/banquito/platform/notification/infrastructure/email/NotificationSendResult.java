package com.banquito.platform.notification.infrastructure.email;

public record NotificationSendResult(
        boolean success,
        String provider,
        String responseCode,
        String responseMessage
) {
    public static NotificationSendResult success(String provider, String code, String message) {
        return new NotificationSendResult(true, provider, code, message);
    }

    public static NotificationSendResult failure(String provider, String code, String message) {
        return new NotificationSendResult(false, provider, code, message);
    }
}
