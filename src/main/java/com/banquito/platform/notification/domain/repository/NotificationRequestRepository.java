package com.banquito.platform.notification.domain.repository;

import com.banquito.platform.notification.domain.enums.EstadoNotificacionEnum;
import com.banquito.platform.notification.domain.model.NotificationRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface NotificationRequestRepository extends JpaRepository<NotificationRequest, Long> {
    Optional<NotificationRequest> findByUuidNotificacion(String uuidNotificacion);
    List<NotificationRequest> findByEstadoOrderByFechaSolicitudAsc(EstadoNotificacionEnum estado);
    List<NotificationRequest> findByUuidCorrelacionOrderByFechaSolicitudDesc(String uuidCorrelacion);
}
