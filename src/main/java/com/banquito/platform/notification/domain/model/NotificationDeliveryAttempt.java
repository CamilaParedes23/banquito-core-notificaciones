package com.banquito.platform.notification.domain.model;

import com.banquito.platform.notification.domain.enums.EstadoIntentoEntregaEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.Objects;

@Getter
@Setter
@Entity
@Table(name = "NOTIFICATION_DELIVERY_ATTEMPT")
public class NotificationDeliveryAttempt {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false)
    private Long id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "NOTIFICATION_REQUEST_ID", nullable = false)
    private NotificationRequest notificationRequest;
    @Column(name = "INTENTO_NUMERO", nullable = false)
    private Integer intentoNumero;
    @Column(name = "PROVEEDOR", length = 80, nullable = false)
    private String proveedor;
    @Enumerated(EnumType.STRING)
    @Column(name = "ESTADO", length = 20, nullable = false)
    private EstadoIntentoEntregaEnum estado;
    @Column(name = "CODIGO_RESPUESTA", length = 80)
    private String codigoRespuesta;
    @Column(name = "MENSAJE_RESPUESTA", length = 1000)
    private String mensajeRespuesta;
    @Column(name = "FECHA_INTENTO", nullable = false)
    private LocalDateTime fechaIntento;
    public NotificationDeliveryAttempt() {}
    public NotificationDeliveryAttempt(Long id) { this.id = id; }
    public static NotificationDeliveryAttempt crear(NotificationRequest request, Integer numero, EstadoIntentoEntregaEnum estado, String codigo, String mensaje){
        NotificationDeliveryAttempt a = new NotificationDeliveryAttempt(); a.notificationRequest=request; a.intentoNumero=numero; a.proveedor="SMTP"; a.estado=estado; a.codigoRespuesta=codigo; a.mensajeRespuesta=mensaje; a.fechaIntento=LocalDateTime.now(); return a;
    }
    @PrePersist public void prePersist(){ if(proveedor==null) proveedor="SMTP"; if(fechaIntento==null) fechaIntento=LocalDateTime.now(); }
    @Override public boolean equals(Object o){ if(this==o)return true; if(!(o instanceof NotificationDeliveryAttempt that))return false; if(id==null||that.id==null)return false; return Objects.equals(id,that.id); }
    @Override public int hashCode(){ return Objects.hashCode(id); }
    @Override public String toString(){ return "NotificationDeliveryAttempt{"+"id="+id+", intentoNumero="+intentoNumero+", estado="+estado+'}'; }
}
