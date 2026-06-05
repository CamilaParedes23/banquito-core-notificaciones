package com.banquito.platform.notification.domain.enums;

import lombok.Getter;

@Getter
public enum TipoCanalEnum {
    EMAIL("EMAIL"), SMS("SMS"), PUSH("PUSH"), WEBHOOK("WEBHOOK");
    private final String value;
    TipoCanalEnum(String value) { this.value = value; }
}
