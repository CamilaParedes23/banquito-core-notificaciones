# Changelog técnico - notification-service

## Cloud-ready review

- Se parametrizó `application.yml` y `application-docker.yml`.
- Se agregó Dockerfile multi-stage.
- Se agregó `.env.example`, `.gitignore` y `.dockerignore`.
- Se integró `spring-boot-starter-mail`.
- Se agregó envío por SMTP real mediante `JavaMailSender`.
- Se mantiene modo `SIMULATED` para laboratorio.
- Se agregaron plantillas para credenciales temporales, recuperación de contraseña, transferencias, retiros, bloqueos, pagos masivos y eventos de seguridad.
- Se mantiene JWT compatible con `identity-access-service`.
- Se conserva OpenAPI/Swagger y Actuator.
- Se deja preparado para RabbitMQ y gRPC interno.

## Pendientes

- Conectar eventos RabbitMQ reales.
- Integrar con `document-service` para evidencias.
- Activar SMTP real con credenciales del proveedor final.
- Integrar recuperación/cambio de contraseña desde `identity-access-service`.
