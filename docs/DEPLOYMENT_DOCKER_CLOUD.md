# notification-service - Docker / Cloud

## Variables mínimas

- `SERVER_PORT=8087`
- `NOTIFICATION_DB_URL`
- `NOTIFICATION_DB_USERNAME`
- `NOTIFICATION_DB_PASSWORD`
- `JWT_ISSUER`
- `JWT_SECRET`
- `NOTIFICATION_DELIVERY_MODE=SIMULATED|SMTP`
- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_USERNAME`
- `SMTP_PASSWORD`
- `SMTP_FROM`
- `SMTP_AUTH`
- `SMTP_STARTTLS_ENABLE`

## Modos de envío

### SIMULATED
No envía correo real. Registra la solicitud y el intento con `SIMULATED_OK`.

### SMTP
Envía correo mediante `JavaMailSender` y las propiedades `spring.mail.*`.

Para laboratorio puede apuntar a Mailpit (`mailpit:1025`). Para nube debe apuntar a un proveedor SMTP transaccional o servidor SMTP institucional.

## Docker

```bash
docker build -t banquito/notification-service:latest .
```

```bash
docker run --env-file .env -p 8087:8087 banquito/notification-service:latest
```
