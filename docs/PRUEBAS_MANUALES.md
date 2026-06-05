# Pruebas manuales

1. Levantar `identity-access-service`.
2. Ejecutar `mvn spring-boot:run` en `notification-service`.
3. Obtener token en `http://localhost:8081/api/v1/auth/login`.
4. Consultar plantillas en `GET http://localhost:8087/api/v1/notifications/templates`.
5. Crear solicitud con `POST http://localhost:8087/api/v1/notifications/requests`.
6. Consultar intentos de entrega con `GET /api/v1/notifications/requests/{uuid}/attempts`.
