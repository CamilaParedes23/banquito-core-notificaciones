package com.banquito.platform.notification.domain.enums;

import lombok.Getter;

@Getter
public enum EstadoNotificacionEnum {
    PENDIENTE("PENDIENTE"), ENVIADA("ENVIADA"), FALLIDA("FALLIDA"), REINTENTO("REINTENTO"), CANCELADA("CANCELADA");
    private final String value;
    EstadoNotificacionEnum(String value) { this.value = value; }
}
