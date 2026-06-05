package com.banquito.platform.notification.domain.enums;

import lombok.Getter;

@Getter
public enum PrioridadNotificacionEnum {
    BAJA("BAJA"), NORMAL("NORMAL"), ALTA("ALTA"), CRITICA("CRITICA");
    private final String value;
    PrioridadNotificacionEnum(String value) { this.value = value; }
}
