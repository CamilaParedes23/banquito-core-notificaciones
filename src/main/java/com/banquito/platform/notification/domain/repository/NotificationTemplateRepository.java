package com.banquito.platform.notification.domain.repository;

import com.banquito.platform.notification.domain.enums.EstadoBasicoEnum;
import com.banquito.platform.notification.domain.enums.TipoCanalEnum;
import com.banquito.platform.notification.domain.model.NotificationTemplate;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface NotificationTemplateRepository extends JpaRepository<NotificationTemplate, Long> {
    Optional<NotificationTemplate> findByCodigo(String codigo);
    Optional<NotificationTemplate> findFirstByTipoEventoAndTipoCanalAndEstadoOrderByIdAsc(String tipoEvento, TipoCanalEnum tipoCanal, EstadoBasicoEnum estado);
    boolean existsByCodigo(String codigo);
    List<NotificationTemplate> findByEstadoOrderByCodigoAsc(EstadoBasicoEnum estado);
    List<NotificationTemplate> findByTipoEventoAndEstadoOrderByCodigoAsc(String tipoEvento, EstadoBasicoEnum estado);
}
