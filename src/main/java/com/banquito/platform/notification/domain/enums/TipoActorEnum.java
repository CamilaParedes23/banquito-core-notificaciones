package com.banquito.platform.notification.domain.enums;

import lombok.Getter;

@Getter
public enum TipoActorEnum {
    CLIENTE("CLIENTE"), EMPLEADO("EMPLEADO"), EMPRESA("EMPRESA"), SERVICIO("SERVICIO");
    private final String value;
    TipoActorEnum(String value) { this.value = value; }
}
