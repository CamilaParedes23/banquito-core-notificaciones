package com.banquito.platform.notification.infrastructure.email;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "banquito.notification.delivery")
public class NotificationDeliveryProperties {
    /**
     * SIMULATED: registra intento exitoso sin enviar correo real.
     * SMTP: envía por JavaMailSender usando spring.mail.*.
     */
    private String mode = "SIMULATED";
    private String provider = "SMTP";
    private String from = "no-reply@banquito.com";
    private String replyTo;

    public String getMode() { return mode; }
    public void setMode(String mode) { this.mode = mode; }
    public String getProvider() { return provider; }
    public void setProvider(String provider) { this.provider = provider; }
    public String getFrom() { return from; }
    public void setFrom(String from) { this.from = from; }
    public String getReplyTo() { return replyTo; }
    public void setReplyTo(String replyTo) { this.replyTo = replyTo; }

    public boolean isSmtpEnabled() {
        return "SMTP".equalsIgnoreCase(mode);
    }
}
