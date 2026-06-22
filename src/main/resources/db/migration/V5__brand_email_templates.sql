
INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('ACCOUNT_CREDITED_EMAIL', 'ACCOUNT_CREDITED', 'EMAIL', 'Acreditación recibida', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Notificación de acreditación</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Acreditación recibida</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, registramos una acreditación en su cuenta Banco BanQuito.</p>
                                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin:0 0 24px 0;background-color:#eef5fb;border:1px solid #c9dcef;border-radius:10px;">
                                            <tr>
                                                <td style="padding:24px;text-align:center;">
                                                    <p style="margin:0 0 10px 0;font-size:13px;text-transform:uppercase;letter-spacing:1px;color:#1f4f82;">Monto acreditado</p>
                                                    <p style="margin:0;font-size:34px;font-weight:700;color:#245d99;">{{monto}}</p>
                                                </td>
                                            </tr>
                                        </table>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuenta}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('ACCOUNT_DEBITED_EMAIL', 'ACCOUNT_DEBITED', 'EMAIL', 'Débito realizado', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Notificación de débito</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Débito realizado</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, registramos un débito en su cuenta Banco BanQuito.</p>
                                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin:0 0 24px 0;background-color:#eef5fb;border:1px solid #c9dcef;border-radius:10px;">
                                            <tr>
                                                <td style="padding:24px;text-align:center;">
                                                    <p style="margin:0 0 10px 0;font-size:13px;text-transform:uppercase;letter-spacing:1px;color:#1f4f82;">Monto debitado</p>
                                                    <p style="margin:0;font-size:34px;font-weight:700;color:#245d99;">{{monto}}</p>
                                                </td>
                                            </tr>
                                        </table>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuenta}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('PASSWORD_CHANGED_EMAIL', 'PASSWORD_CHANGED', 'EMAIL', 'Cambio de clave realizado', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Seguridad de cuenta</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Cambio de clave realizado</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Se registró un cambio de clave para su usuario. Si usted no realizó esta acción, comuníquese inmediatamente con Banco BanQuito.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Usuario</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{usuario}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('PAYMENT_LINE_SUCCESS_EMAIL', 'PAYMENT_LINE_SUCCESS', 'EMAIL', 'Pago recibido exitosamente', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Notificación de acreditación</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Pago recibido exitosamente</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, recibió un pago masivo acreditado en su cuenta Banco BanQuito.</p>
                                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin:0 0 24px 0;background-color:#eef5fb;border:1px solid #c9dcef;border-radius:10px;">
                                            <tr>
                                                <td style="padding:24px;text-align:center;">
                                                    <p style="margin:0 0 10px 0;font-size:13px;text-transform:uppercase;letter-spacing:1px;color:#1f4f82;">Monto acreditado</p>
                                                    <p style="margin:0;font-size:34px;font-weight:700;color:#245d99;">{{monto}}</p>
                                                </td>
                                            </tr>
                                        </table>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Beneficiario</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{nombre}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta destino</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuentaDestino}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Concepto</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{concepto}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Empresa emisora</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{empresaEmisora}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Fecha de envío</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{fechaEnvio}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Comprobante</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{comprobante}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('EOD_COMPLETED_EMAIL', 'EOD_COMPLETED', 'EMAIL', 'Cierre diario exitoso', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Operación bancaria</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Cierre diario exitoso</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">El proceso de cierre diario finalizó correctamente.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Proceso EOD</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{eod}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('TEMPORARY_CREDENTIALS_EMAIL', 'TEMPORARY_CREDENTIALS', 'EMAIL', 'Credenciales temporales Banco BanQuito', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Acceso temporal</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Credenciales temporales</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, se generaron credenciales temporales para su acceso a Banco BanQuito.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Usuario</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{usuario}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Código temporal</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{codigoTemporal}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('PASSWORD_RESET_CODE_EMAIL', 'PASSWORD_RESET_CODE', 'EMAIL', 'Código de recuperación de contraseña', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Recuperación de acceso</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Código de recuperación</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, use el siguiente código para continuar con la recuperación de su contraseña.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Código temporal</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{codigoTemporal}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('PASSWORD_RESET_EMAIL', 'PASSWORD_RESET_REQUESTED', 'EMAIL', 'Recuperación de contraseña Banco BanQuito', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Recuperación de acceso</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Restablezca su contraseña</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, use el siguiente token de un solo uso para restablecer su contraseña.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Usuario</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{usuario}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Token</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{token}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Vigencia</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{vigenciaMinutos}} minutos</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('CUSTOMER_USER_ACTIVATION_EMAIL', 'CUSTOMER_USER_ACTIVATION_REQUESTED', 'EMAIL', 'Active su acceso digital Banco BanQuito', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Activación de acceso digital</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Active su acceso digital</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, Banco BanQuito ha creado su acceso digital. Complete la activación para ingresar de forma segura.</p>
                                        <table role="presentation" cellspacing="0" cellpadding="0" style="margin:20px 0 24px 0;">
                                            <tr>
                                                <td style="background-color:#f39200;border-radius:8px;text-align:center;">
                                                    <a href="{{activationUrl}}" style="display:inline-block;padding:13px 22px;color:#ffffff;text-decoration:none;font-size:15px;font-weight:700;">Activar acceso</a>
                                                </td>
                                            </tr>
                                        </table>
                                        <div style="margin:0 0 20px 0;padding:14px 16px;background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;font-size:13px;line-height:20px;color:#4f6276;">{{switchAccessMessage}}</div>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Usuario</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{usuario}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Token de activación</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{token}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Vigencia</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{vigenciaMinutos}} minutos</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Tipo de cliente</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{customerType}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('INTERNAL_USER_ACTIVATION_EMAIL', 'INTERNAL_USER_ONBOARDING_COMPLETED', 'EMAIL', 'Active su acceso interno Banco BanQuito', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Activación de acceso interno</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Active su acceso interno</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, se creó su acceso interno a Banco BanQuito. Use el token de un solo uso para definir su contraseña.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Usuario</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{usuario}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Token de activación</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{token}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Vigencia</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{vigenciaMinutos}} minutos</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('TRANSFER_SENT_EMAIL', 'TRANSFER_SENT', 'EMAIL', 'Transferencia enviada', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Transferencia enviada</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Transferencia enviada</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, su transferencia fue enviada correctamente.</p>
                                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin:0 0 24px 0;background-color:#eef5fb;border:1px solid #c9dcef;border-radius:10px;">
                                            <tr>
                                                <td style="padding:24px;text-align:center;">
                                                    <p style="margin:0 0 10px 0;font-size:13px;text-transform:uppercase;letter-spacing:1px;color:#1f4f82;">Monto enviado</p>
                                                    <p style="margin:0;font-size:34px;font-weight:700;color:#245d99;">{{monto}}</p>
                                                </td>
                                            </tr>
                                        </table>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta origen</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuentaOrigen}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta destino</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuentaDestino}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Comprobante</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{comprobante}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('TRANSFER_RECEIVED_EMAIL', 'TRANSFER_RECEIVED', 'EMAIL', 'Transferencia recibida', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Transferencia recibida</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Transferencia recibida</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, recibió una transferencia en su cuenta Banco BanQuito.</p>
                                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin:0 0 24px 0;background-color:#eef5fb;border:1px solid #c9dcef;border-radius:10px;">
                                            <tr>
                                                <td style="padding:24px;text-align:center;">
                                                    <p style="margin:0 0 10px 0;font-size:13px;text-transform:uppercase;letter-spacing:1px;color:#1f4f82;">Monto recibido</p>
                                                    <p style="margin:0;font-size:34px;font-weight:700;color:#245d99;">{{monto}}</p>
                                                </td>
                                            </tr>
                                        </table>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta destino</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuentaDestino}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Ordenante</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{ordenante}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Comprobante</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{comprobante}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('ACCOUNT_WITHDRAWAL_EMAIL', 'ACCOUNT_WITHDRAWAL', 'EMAIL', 'Retiro realizado', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Retiro de cuenta</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Retiro realizado</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, se registró un retiro en su cuenta Banco BanQuito.</p>
                                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin:0 0 24px 0;background-color:#eef5fb;border:1px solid #c9dcef;border-radius:10px;">
                                            <tr>
                                                <td style="padding:24px;text-align:center;">
                                                    <p style="margin:0 0 10px 0;font-size:13px;text-transform:uppercase;letter-spacing:1px;color:#1f4f82;">Monto retirado</p>
                                                    <p style="margin:0;font-size:34px;font-weight:700;color:#245d99;">{{monto}}</p>
                                                </td>
                                            </tr>
                                        </table>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuenta}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('ACCOUNT_BLOCKED_EMAIL', 'ACCOUNT_BLOCKED', 'EMAIL', 'Cuenta bloqueada', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Seguridad de cuenta</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Cuenta bloqueada</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, su cuenta fue bloqueada por seguridad o control operativo.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuenta}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Motivo</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{motivo}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('PAYMENT_BATCH_COMPLETED_EMAIL', 'PAYMENT_BATCH_COMPLETED', 'EMAIL', 'Lote de pagos masivos procesado', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Pagos masivos</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Lote procesado</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">El lote de pagos masivos finalizó su procesamiento.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Lote</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{lote}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Empresa</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{empresa}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Exitosos</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{exitosos}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Rechazados</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{rechazados}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('PAYMENT_BATCH_REJECTED_EMAIL', 'PAYMENT_BATCH_REJECTED', 'EMAIL', 'Lote de pagos masivos rechazado', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Pagos masivos</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Lote rechazado</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">El lote de pagos masivos fue rechazado durante la validación.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Lote</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{lote}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Empresa</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{empresa}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Motivo</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{motivo}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('EOD_FAILED_EMAIL', 'EOD_FAILED', 'EMAIL', 'Cierre diario con error', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Alerta operativa</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Cierre diario con error</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">El proceso de cierre diario finalizó con error y requiere revisión.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Proceso EOD</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{eod}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Motivo</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{motivo}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('LOGIN_SUSPICIOUS_EMAIL', 'LOGIN_SUSPICIOUS', 'EMAIL', 'Alerta de seguridad Banco BanQuito', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Alerta de seguridad</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Evento de seguridad detectado</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Detectamos un evento de seguridad asociado a su usuario.</p>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Usuario</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{usuario}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Detalle</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{detalle}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('ACCOUNT_OPENING_FUNDED_EMAIL', 'ACCOUNT_OPENING_FUNDED', 'EMAIL', 'Cuenta abierta con depósito inicial', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Apertura de cuenta</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Cuenta abierta correctamente</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, su cuenta fue abierta y recibió el depósito inicial registrado.</p>
                                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin:0 0 24px 0;background-color:#eef5fb;border:1px solid #c9dcef;border-radius:10px;">
                                            <tr>
                                                <td style="padding:24px;text-align:center;">
                                                    <p style="margin:0 0 10px 0;font-size:13px;text-transform:uppercase;letter-spacing:1px;color:#1f4f82;">Monto inicial</p>
                                                    <p style="margin:0;font-size:34px;font-weight:700;color:#245d99;">{{monto}}</p>
                                                </td>
                                            </tr>
                                        </table>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuenta}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Comprobante</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{comprobante}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('TELLER_DEPOSIT_COMPLETED_EMAIL', 'TELLER_DEPOSIT_COMPLETED', 'EMAIL', 'Depósito realizado en ventanilla', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Comprobante de ventanilla</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Depósito realizado</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, se registró un depósito en ventanilla.</p>
                                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin:0 0 24px 0;background-color:#eef5fb;border:1px solid #c9dcef;border-radius:10px;">
                                            <tr>
                                                <td style="padding:24px;text-align:center;">
                                                    <p style="margin:0 0 10px 0;font-size:13px;text-transform:uppercase;letter-spacing:1px;color:#1f4f82;">Monto depositado</p>
                                                    <p style="margin:0;font-size:34px;font-weight:700;color:#245d99;">{{monto}}</p>
                                                </td>
                                            </tr>
                                        </table>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuenta}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Comprobante</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{comprobante}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;


INSERT INTO NOTIFICATION_TEMPLATE (CODIGO, TIPO_EVENTO, TIPO_CANAL, ASUNTO_TEMPLATE, CUERPO_TEMPLATE, IDIOMA, ESTADO)
VALUES ('TELLER_WITHDRAWAL_COMPLETED_EMAIL', 'TELLER_WITHDRAWAL_COMPLETED', 'EMAIL', 'Retiro realizado en ventanilla', '<!DOCTYPE html>
<html lang="es">
<body style="margin:0;padding:0;background-color:#f4f7fa;font-family:Arial,Helvetica,sans-serif;color:#1f2937;">
<table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f4f7fa;padding:24px 12px;">
    <tr>
        <td align="center">
            <table role="presentation" width="600" cellspacing="0" cellpadding="0" style="width:600px;max-width:600px;background-color:#ffffff;border-collapse:collapse;border-radius:12px;overflow:hidden;box-shadow:0 10px 30px rgba(31,79,130,0.10);">
                <tr>
                    <td style="background-color:#1f4f82;padding:24px 32px;text-align:center;">
                        <table role="presentation" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:46px;height:46px;border-radius:50%;background-color:#f39200;color:#ffffff;font-size:18px;font-weight:700;text-align:center;vertical-align:middle;">BQ</td>
                                <td style="padding-left:12px;color:#ffffff;font-size:28px;font-weight:700;letter-spacing:0.5px;">Banco BanQuito</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:32px;">
                        <p style="margin:0 0 8px 0;font-size:14px;color:#5b6b7f;">Comprobante de ventanilla</p>
                        <h1 style="margin:0 0 14px 0;font-size:28px;line-height:36px;color:#111827;">Retiro realizado</h1>
                        <p style="margin:0 0 24px 0;font-size:15px;line-height:24px;color:#4f6276;">Hola {{nombre}}, se registró un retiro en ventanilla.</p>
                                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="margin:0 0 24px 0;background-color:#eef5fb;border:1px solid #c9dcef;border-radius:10px;">
                                            <tr>
                                                <td style="padding:24px;text-align:center;">
                                                    <p style="margin:0 0 10px 0;font-size:13px;text-transform:uppercase;letter-spacing:1px;color:#1f4f82;">Monto retirado</p>
                                                    <p style="margin:0;font-size:34px;font-weight:700;color:#245d99;">{{monto}}</p>
                                                </td>
                                            </tr>
                                        </table>
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Cuenta</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{cuenta}}</td>
                                            </tr>
                                            <tr>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#5b6b7f;width:42%;">Comprobante</td>
                                                <td style="padding:12px 0;border-bottom:1px solid #dbe5ef;font-size:14px;color:#111827;font-weight:600;">{{comprobante}}</td>
                                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding:0 32px 28px 32px;">
                        <table role="presentation" width="100%" cellspacing="0" cellpadding="0" style="background-color:#f7fafd;border:1px solid #dbe5ef;border-radius:10px;">
                            <tr>
                                <td style="padding:18px 20px;font-size:13px;line-height:20px;color:#4f6276;">Este correo fue generado automáticamente por Banco BanQuito. Por seguridad, no comparta claves, códigos ni tokens con terceros.</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>', 'es-EC', 'ACTIVO')
ON DUPLICATE KEY UPDATE
  TIPO_EVENTO = VALUES(TIPO_EVENTO),
  TIPO_CANAL = VALUES(TIPO_CANAL),
  ASUNTO_TEMPLATE = VALUES(ASUNTO_TEMPLATE),
  CUERPO_TEMPLATE = VALUES(CUERPO_TEMPLATE),
  IDIOMA = VALUES(IDIOMA),
  ESTADO = VALUES(ESTADO),
  FECHA_ACTUALIZACION = CURRENT_TIMESTAMP;
