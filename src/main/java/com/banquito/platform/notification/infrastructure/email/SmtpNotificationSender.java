package com.banquito.platform.notification.infrastructure.email;

import com.banquito.platform.notification.domain.model.NotificationRequest;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;

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
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(
                    message,
                    false,
                    StandardCharsets.UTF_8.name()
            );
            helper.setFrom(properties.getFrom());
            if (properties.getReplyTo() != null && !properties.getReplyTo().isBlank()) {
                helper.setReplyTo(properties.getReplyTo());
            }
            helper.setTo(request.getDestinatario());
            helper.setSubject(request.getAsuntoRenderizado() == null ? "Notificación Banco BanQuito" : request.getAsuntoRenderizado());
            String body = request.getCuerpoRenderizado() == null ? "" : request.getCuerpoRenderizado();
            helper.setText(body, isHtml(body));
            mailSender.send(message);
            return NotificationSendResult.success(properties.getProvider(), "SMTP_ACCEPTED", "Correo enviado mediante servidor SMTP");
        } catch (MailException | MessagingException ex) {
            return NotificationSendResult.failure(properties.getProvider(), "SMTP_ERROR", safeMessage(ex));
        }
    }

    private boolean isHtml(String body) {
        String normalized = body == null ? "" : body.stripLeading().toLowerCase();
        return normalized.startsWith("<!doctype html")
                || normalized.startsWith("<html")
                || normalized.contains("<body");
    }

    private String safeMessage(Exception ex) {
        String message = ex.getMessage();
        if (message == null || message.isBlank()) {
            return ex.getClass().getSimpleName();
        }
        return message.length() > 900 ? message.substring(0, 900) : message;
    }
}
