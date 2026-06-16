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
- `NotificationInternalService/SendTemplatedNotification` — contrato gRPC interno activo en `9097`, protegido por metadata `x-internal-service-key`
- `POST /internal/v1/notifications/requests` — compatibilidad REST temporal, sin consumo desde Account

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

## Seguridad y autorización agregada

Los endpoints de notificación quedan restringidos a `ADMIN_SEGURIDAD` o clientes técnicos con scope `notification.send`. Los clientes finales no pueden disparar notificaciones arbitrarias ni consultar solicitudes de terceros directamente.



## Integración interna y Mailpit

El Core no usa RabbitMQ en esta fase. `core-account-service` despacha eventos persistidos en su outbox mediante gRPC interno.

`notification-service`:

1. Deduplica por evento origen, tipo de evento y destinatario.
2. Resuelve el correo explícito o la preferencia del actor.
3. Renderiza la plantilla.
4. Registra solicitud e intento.
5. Envía mediante SMTP.
6. En local, Mailpit recibe y muestra el correo en `http://localhost:8025`.

Si un envío SMTP falla, la solicitud queda `FALLIDA`; un nuevo despacho del mismo evento reintenta la misma solicitud sin crear duplicados.
