# notification-service

Servicio transversal de notificaciones para Banco BanQuito V2.

Gestiona plantillas, solicitudes, renderizado de mensajes, intentos de entrega y trazabilidad de notificaciones para Core, Switch e Identity.

## Responsabilidades

- Notificaciones de créditos, débitos, retiros y transferencias.
- Notificaciones de pagos masivos desde Switch.
- Notificaciones de seguridad: cambio de clave, recuperación de contraseña, bloqueo de usuario/cuenta.
- Notificaciones operativas: EOD completado/fallido.
- Registro de intentos de entrega.

## Modos de entrega

- `SIMULATED`: no envía correo real; registra intento exitoso.
- `SMTP`: envía correo mediante servidor SMTP usando `spring.mail.*`.

## Endpoints principales

- `GET /api/v1/notifications/templates`
- `POST /api/v1/notifications/templates`
- `PATCH /api/v1/notifications/templates/{templateCode}`
- `POST /api/v1/notifications/requests`
- `GET /api/v1/notifications/requests/{notificationUuid}`
- `GET /api/v1/notifications/requests/{notificationUuid}/attempts`
- `POST /api/v1/notifications/test`

## Ejecución local

```powershell
mvn clean package
mvn spring-boot:run
```

## Swagger

- `http://localhost:8087/swagger-ui.html`
- `http://localhost:8087/api-docs`

## Docker

Ver `docs/DEPLOYMENT_DOCKER_CLOUD.md`.
