package com.banquito.platform.notification.domain.model;

import com.banquito.platform.notification.domain.enums.EstadoNotificacionEnum;
import com.banquito.platform.notification.domain.enums.PrioridadNotificacionEnum;
import com.banquito.platform.notification.domain.enums.TipoCanalEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.Objects;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "NOTIFICATION_REQUEST")
public class NotificationRequest {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Long id;
    @Column(name = "UUID_NOTIFICACION", length = 36, nullable = false)
    private String uuidNotificacion;
    @Column(name = "UUID_CORRELACION", length = 36)
    private String uuidCorrelacion;
    @Column(name = "UUID_EVENTO_ORIGEN", length = 36)
    private String uuidEventoOrigen;
    @Column(name = "UUID_ACTOR_DESTINATARIO", length = 36)
    private String uuidActorDestinatario;
    @Column(name = "TIPO_EVENTO", length = 80, nullable = false)
    private String tipoEvento;
    @Column(name = "ORIGEN_SERVICIO", length = 80, nullable = false)
    private String origenServicio;
    @Enumerated(EnumType.STRING)
    @Column(name = "PRIORIDAD", length = 15, nullable = false)
    private PrioridadNotificacionEnum prioridad;
    @Enumerated(EnumType.STRING)
    @Column(name = "TIPO_CANAL", length = 20, nullable = false)
    private TipoCanalEnum tipoCanal;
    @Column(name = "DESTINATARIO", length = 180, nullable = false)
    private String destinatario;
    @Column(name = "DESTINATARIO_NOMBRE", length = 180)
    private String destinatarioNombre;
    @Column(name = "TEMPLATE_CODIGO", length = 80)
    private String templateCodigo;
    @Column(name = "ASUNTO_RENDERIZADO", length = 250)
    private String asuntoRenderizado;
    @Column(name = "CUERPO_RENDERIZADO", columnDefinition = "mediumtext")
    private String cuerpoRenderizado;
    @Column(name = "PAYLOAD_JSON", columnDefinition = "json")
    private String payloadJson;
    @Enumerated(EnumType.STRING)
    @Column(name = "ESTADO", length = 20, nullable = false)
    private EstadoNotificacionEnum estado;
    @Column(name = "UUID_DOCUMENTO_EVIDENCIA", length = 36)
    private String uuidDocumentoEvidencia;
    @Column(name = "FECHA_SOLICITUD", nullable = false)
    private LocalDateTime fechaSolicitud;
    @Column(name = "FECHA_ULTIMO_INTENTO")
    private LocalDateTime fechaUltimoIntento;
    @Column(name = "FECHA_ENVIO")
    private LocalDateTime fechaEnvio;
    @Version
    @Column(name = "VERSION", nullable = false)
    private Integer version;
    public NotificationRequest() {}
    public NotificationRequest(Long id) { this.id = id; }
    public static NotificationRequest crear(String correlacion, String tipoEvento, String origenServicio, PrioridadNotificacionEnum prioridad, TipoCanalEnum tipoCanal, String destinatario, String nombre, String templateCodigo, String asunto, String cuerpo, String payloadJson){
        NotificationRequest r = new NotificationRequest(); r.uuidNotificacion=UUID.randomUUID().toString(); r.uuidCorrelacion=correlacion; r.tipoEvento=tipoEvento; r.origenServicio=origenServicio; r.prioridad=prioridad==null?PrioridadNotificacionEnum.NORMAL:prioridad; r.tipoCanal=tipoCanal; r.destinatario=destinatario; r.destinatarioNombre=nombre; r.templateCodigo=templateCodigo; r.asuntoRenderizado=asunto; r.cuerpoRenderizado=cuerpo; r.payloadJson=payloadJson; r.estado=EstadoNotificacionEnum.PENDIENTE; r.fechaSolicitud=LocalDateTime.now(); return r;
    }
    public void marcarEnviada(){ this.estado=EstadoNotificacionEnum.ENVIADA; this.fechaUltimoIntento=LocalDateTime.now(); this.fechaEnvio=LocalDateTime.now(); }
    public void marcarFallida(){ this.estado=EstadoNotificacionEnum.FALLIDA; this.fechaUltimoIntento=LocalDateTime.now(); }
    @PrePersist public void prePersist(){ if(uuidNotificacion==null) uuidNotificacion=UUID.randomUUID().toString(); if(prioridad==null) prioridad=PrioridadNotificacionEnum.NORMAL; if(estado==null) estado=EstadoNotificacionEnum.PENDIENTE; if(fechaSolicitud==null) fechaSolicitud=LocalDateTime.now(); if(version==null) version=0; }
    @Override public boolean equals(Object o){ if(this==o)return true; if(!(o instanceof NotificationRequest that))return false; if(id==null||that.id==null)return false; return Objects.equals(id,that.id); }
    @Override public int hashCode(){ return Objects.hashCode(id); }
    @Override public String toString(){ return "NotificationRequest{"+"id="+id+", uuidNotificacion='"+uuidNotificacion+'\''+", estado="+estado+'}'; }
}
