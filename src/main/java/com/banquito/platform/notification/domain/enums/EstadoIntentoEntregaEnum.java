package com.banquito.platform.notification.domain.enums;

import lombok.Getter;

@Getter
public enum EstadoIntentoEntregaEnum {
    ENVIADA("ENVIADA"), FALLIDA("FALLIDA"), TIMEOUT("TIMEOUT"), RECHAZADA("RECHAZADA");
    private final String value;
    EstadoIntentoEntregaEnum(String value) { this.value = value; }
}
