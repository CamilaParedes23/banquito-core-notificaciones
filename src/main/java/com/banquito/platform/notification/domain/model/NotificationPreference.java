package com.banquito.platform.notification.domain.model;

import com.banquito.platform.notification.domain.enums.TipoActorEnum;
import com.banquito.platform.notification.domain.enums.TipoCanalEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.Objects;

@Getter
@Setter
@Entity
@Table(name = "NOTIFICATION_PREFERENCE")
public class NotificationPreference {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Long id;
    @Column(name = "UUID_ACTOR", length = 36, nullable = false)
    private String uuidActor;
    @Enumerated(EnumType.STRING)
    @Column(name = "TIPO_ACTOR", length = 20, nullable = false)
    private TipoActorEnum tipoActor;
    @Column(name = "TIPO_EVENTO", length = 80, nullable = false)
    private String tipoEvento;
    @Enumerated(EnumType.STRING)
    @Column(name = "TIPO_CANAL", length = 20, nullable = false)
    private TipoCanalEnum tipoCanal;
    @Column(name = "HABILITADO", nullable = false)
    private Boolean habilitado;
    @Column(name = "DESTINO", length = 180)
    private String destino;
    @Column(name = "FECHA_CREACION", nullable = false)
    private LocalDateTime fechaCreacion;
    @Column(name = "FECHA_ACTUALIZACION", nullable = false)
    private LocalDateTime fechaActualizacion;
    @Version
    @Column(name = "VERSION", nullable = false)
    private Integer version;
    public NotificationPreference() {}
    public NotificationPreference(Long id) { this.id = id; }
    @PrePersist public void prePersist(){ var now=LocalDateTime.now(); if(fechaCreacion==null) fechaCreacion=now; if(fechaActualizacion==null) fechaActualizacion=now; if(habilitado==null) habilitado=Boolean.TRUE; if(version==null) version=0; }
    @PreUpdate public void preUpdate(){ fechaActualizacion=LocalDateTime.now(); }
    @Override public boolean equals(Object o){ if(this==o)return true; if(!(o instanceof NotificationPreference that))return false; if(id==null||that.id==null)return false; return Objects.equals(id,that.id); }
    @Override public int hashCode(){ return Objects.hashCode(id); }
    @Override public String toString(){ return "NotificationPreference{"+"id="+id+", uuidActor='"+uuidActor+'\''+", tipoEvento='"+tipoEvento+'\''+'}'; }
}
