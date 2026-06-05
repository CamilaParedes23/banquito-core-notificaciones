package com.banquito.platform.notification.domain.repository;

import com.banquito.platform.notification.domain.model.NotificationDeliveryAttempt;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface NotificationDeliveryAttemptRepository extends JpaRepository<NotificationDeliveryAttempt, Long> {
    List<NotificationDeliveryAttempt> findByNotificationRequestIdOrderByIntentoNumeroAsc(Long notificationRequestId);
    long countByNotificationRequestId(Long notificationRequestId);
}
