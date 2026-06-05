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
@Table(name = "NOTIFICATION_TEMPLATE")
public class NotificationTemplate {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Long id;
    @Column(name = "CODIGO", length = 80, nullable = false)
    private String codigo;
    @Column(name = "TIPO_EVENTO", length = 80, nullable = false)
    private String tipoEvento;
    @Enumerated(EnumType.STRING)
    @Column(name = "TIPO_CANAL", length = 20, nullable = false)
    private TipoCanalEnum tipoCanal;
    @Column(name = "ASUNTO_TEMPLATE", length = 250)
    private String asuntoTemplate;
    @Column(name = "CUERPO_TEMPLATE", nullable = false, columnDefinition = "text")
    private String cuerpoTemplate;
    @Column(name = "IDIOMA", length = 10, nullable = false)
    private String idioma;
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
    public NotificationTemplate() {}
    public NotificationTemplate(Long id) { this.id = id; }
    public static NotificationTemplate crear(String codigo, String tipoEvento, TipoCanalEnum canal, String asunto, String cuerpo, String idioma){
        NotificationTemplate t = new NotificationTemplate(); t.codigo=codigo; t.tipoEvento=tipoEvento; t.tipoCanal=canal; t.asuntoTemplate=asunto; t.cuerpoTemplate=cuerpo; t.idioma=idioma==null?"es-EC":idioma; t.estado=EstadoBasicoEnum.ACTIVO; return t;
    }
    public void actualizar(String asunto, String cuerpo, EstadoBasicoEnum estado){ if(asunto!=null) this.asuntoTemplate=asunto; if(cuerpo!=null) this.cuerpoTemplate=cuerpo; if(estado!=null) this.estado=estado; }
    @PrePersist public void prePersist(){ var now=LocalDateTime.now(); if(fechaCreacion==null) fechaCreacion=now; if(fechaActualizacion==null) fechaActualizacion=now; if(estado==null) estado=EstadoBasicoEnum.ACTIVO; if(idioma==null) idioma="es-EC"; if(version==null) version=0; }
    @PreUpdate public void preUpdate(){ fechaActualizacion=LocalDateTime.now(); }
    @Override public boolean equals(Object o){ if(this==o)return true; if(!(o instanceof NotificationTemplate that))return false; if(id==null||that.id==null)return false; return Objects.equals(id,that.id);} 
    @Override public int hashCode(){ return Objects.hashCode(id);} 
    @Override public String toString(){ return "NotificationTemplate{"+"id="+id+", codigo='"+codigo+'\''+", tipoEvento='"+tipoEvento+'\''+", canal="+tipoCanal+'}'; }
}
