package com.banquito.platform.notification.domain.repository;

import com.banquito.platform.notification.domain.enums.EstadoBasicoEnum;
import com.banquito.platform.notification.domain.model.NotificationChannelConfig;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface NotificationChannelConfigRepository extends JpaRepository<NotificationChannelConfig, Integer> {
    Optional<NotificationChannelConfig> findByCodigo(String codigo);
    List<NotificationChannelConfig> findByEstadoOrderByCodigoAsc(EstadoBasicoEnum estado);
}
