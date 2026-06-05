package com.banquito.platform.notification.api.dto.api;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record TemplateRequest(
        @NotBlank String code,
        @NotBlank String eventType,
        @NotBlank String channelType,
        String subjectTemplate,
        @NotBlank String bodyTemplate,
        String language
) { }
