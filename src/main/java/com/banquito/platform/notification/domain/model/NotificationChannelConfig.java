package com.banquito.platform.notification.domain.model;

import com.banquito.platform.notification.domain.enums.EstadoBasicoEnum;
import com.banquito.platform.notification.domain.enums.TipoCanalEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.Objects;

@Getter
@Setter
@Entity
@Table(name = "NOTIFICATION_CHANNEL_CONFIG")
public class NotificationChannelConfig {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Integer id;
    @Column(name = "CODIGO", length = 40, nullable = false)
    private String codigo;
    @Enumerated(EnumType.STRING)
    @Column(name = "TIPO_CANAL", length = 20, nullable = false)
    private TipoCanalEnum tipoCanal;
    @Column(name = "NOMBRE", length = 100, nullable = false)
    private String nombre;
    @Column(name = "CONFIG_JSON", columnDefinition = "json")
    private String configJson;
    @Enumerated(EnumType.STRING)
    @Column(name = "ESTADO", length = 15, nullable = false)
    private EstadoBasicoEnum estado;
    @Column(name = "FECHA_CREACION", nullable = false)
    private LocalDateTime fechaCreacion;
    @Column(name = "FECHA_ACTUALIZACION", nullable = false)
    private LocalDateTime fechaActualizacion;
    @Version
    @Column(name = "VERSION", nullable = false)
    private Integer version;
    public NotificationChannelConfig() {}
    public NotificationChannelConfig(Integer id) { this.id = id; }
    @PrePersist public void prePersist(){ var now=LocalDateTime.now(); if(fechaCreacion==null) fechaCreacion=now; if(fechaActualizacion==null) fechaActualizacion=now; if(estado==null) estado=EstadoBasicoEnum.ACTIVO; if(version==null) version=0; }
    @PreUpdate public void preUpdate(){ fechaActualizacion=LocalDateTime.now(); }
    @Override public boolean equals(Object o){ if(this==o)return true; if(!(o instanceof NotificationChannelConfig that))return false; if(id==null||that.id==null)return false; return Objects.equals(id,that.id);} 
    @Override public int hashCode(){ return Objects.hashCode(id);} 
    @Override public String toString(){ return "NotificationChannelConfig{"+"id="+id+", codigo='"+codigo+'\''+", tipoCanal="+tipoCanal+", estado="+estado+'}'; }
}
