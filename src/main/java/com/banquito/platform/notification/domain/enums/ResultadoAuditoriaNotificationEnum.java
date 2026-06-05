package com.banquito.platform.notification.domain.enums;

import lombok.Getter;

@Getter
public enum ResultadoAuditoriaNotificationEnum {
    OK("OK"), ERROR("ERROR"), DENEGADO("DENEGADO");
    private final String value;
    ResultadoAuditoriaNotificationEnum(String value) { this.value = value; }
}
