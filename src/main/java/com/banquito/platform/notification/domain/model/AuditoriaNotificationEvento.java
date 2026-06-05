package com.banquito.platform.notification.domain.model;

import com.banquito.platform.notification.domain.enums.ResultadoAuditoriaNotificationEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.Objects;

@Getter
@Setter
@Entity
@Table(name = "AUDITORIA_NOTIFICATION_EVENTO")
public class AuditoriaNotificationEvento {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Long id;
    @Column(name = "UUID_CORRELACION", length = 36)
    private String uuidCorrelacion;
    @Column(name = "MODULO", length = 60, nullable = false)
    private String modulo;
    @Column(name = "ACCION", length = 80, nullable = false)
    private String accion;
    @Column(name = "ENTIDAD", length = 80, nullable = false)
    private String entidad;
    @Column(name = "ENTIDAD_ID", length = 80)
    private String entidadId;
    @Enumerated(EnumType.STRING)
    @Column(name = "RESULTADO", length = 15, nullable = false)
    private ResultadoAuditoriaNotificationEnum resultado;
    @Column(name = "DETALLE_JSON", columnDefinition = "json")
    private String detalleJson;
    @Column(name = "FECHA_EVENTO", nullable = false)
    private LocalDateTime fechaEvento;
    public AuditoriaNotificationEvento() {}
    public AuditoriaNotificationEvento(Long id) { this.id = id; }
    public static AuditoriaNotificationEvento crear(String correlacion, String accion, String entidad, String entidadId, ResultadoAuditoriaNotificationEnum resultado, String detalle){
        AuditoriaNotificationEvento e = new AuditoriaNotificationEvento(); e.uuidCorrelacion=correlacion; e.modulo="NOTIFICATION"; e.accion=accion; e.entidad=entidad; e.entidadId=entidadId; e.resultado=resultado; e.detalleJson=detalle; e.fechaEvento=LocalDateTime.now(); return e;
    }
    @PrePersist public void prePersist(){ if(fechaEvento==null) fechaEvento=LocalDateTime.now(); if(resultado==null) resultado=ResultadoAuditoriaNotificationEnum.OK; }
    @Override public boolean equals(Object o){ if(this==o)return true; if(!(o instanceof AuditoriaNotificationEvento that))return false; if(id==null||that.id==null)return false; return Objects.equals(id,that.id); }
    @Override public int hashCode(){ return Objects.hashCode(id); }
    @Override public String toString(){ return "AuditoriaNotificationEvento{"+"id="+id+", accion='"+accion+'\''+", resultado="+resultado+'}'; }
}
