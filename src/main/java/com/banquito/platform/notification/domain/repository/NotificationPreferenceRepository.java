package com.banquito.platform.notification.domain.repository;

import com.banquito.platform.notification.domain.enums.TipoCanalEnum;
import com.banquito.platform.notification.domain.model.NotificationPreference;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface NotificationPreferenceRepository extends JpaRepository<NotificationPreference, Long> {
    Optional<NotificationPreference> findByUuidActorAndTipoEventoAndTipoCanal(
            String uuidActor,
            String tipoEvento,
            TipoCanalEnum tipoCanal
    );
}
