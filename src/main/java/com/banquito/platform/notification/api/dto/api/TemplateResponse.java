package com.banquito.platform.notification.api.dto.api;

public record TemplateResponse(String code, String eventType, String channelType, String subjectTemplate, String bodyTemplate, String language, String status) { }
