package com.banquito.platform.notification.infrastructure.email;

import com.banquito.platform.notification.domain.model.NotificationRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class SmtpNotificationSender {
    private final JavaMailSender mailSender;
    private final NotificationDeliveryProperties properties;

    public NotificationSendResult send(NotificationRequest request) {
        if (!properties.isSmtpEnabled()) {
            return NotificationSendResult.success(properties.getProvider(), "SIMULATED_OK", "Envío simulado exitoso");
        }

        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(properties.getFrom());
            if (properties.getReplyTo() != null && !properties.getReplyTo().isBlank()) {
                message.setReplyTo(properties.getReplyTo());
            }
            message.setTo(request.getDestinatario());
            message.setSubject(request.getAsuntoRenderizado() == null ? "Notificación Banco BanQuito" : request.getAsuntoRenderizado());
            message.setText(request.getCuerpoRenderizado());
            mailSender.send(message);
            return NotificationSendResult.success(properties.getProvider(), "SMTP_ACCEPTED", "Correo enviado mediante servidor SMTP");
        } catch (MailException ex) {
            return NotificationSendResult.failure(properties.getProvider(), "SMTP_ERROR", safeMessage(ex));
        }
    }

    private String safeMessage(Exception ex) {
        String message = ex.getMessage();
        if (message == null || message.isBlank()) {
            return ex.getClass().getSimpleName();
        }
        return message.length() > 900 ? message.substring(0, 900) : message;
    }
}
