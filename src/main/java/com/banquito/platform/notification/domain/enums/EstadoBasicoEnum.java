package com.banquito.platform.notification.domain.enums;

import lombok.Getter;

@Getter
public enum EstadoBasicoEnum {
    ACTIVO("ACTIVO"), INACTIVO("INACTIVO");
    private final String value;
    EstadoBasicoEnum(String value) { this.value = value; }
}
