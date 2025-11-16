# DevOps
## ✔️ Entrega de práctica – Bash Scripting

He completado todos los niveles de la práctica, incluyendo todos los bonus:

### **Nivel 1 – check_service.sh**
- Recibe el nombre del servicio por parámetro.
- Verifica si está activo usando `systemctl is-active`.
- Guarda el estado en `service_status.log` con timestamp.
- **Bonus:** Envío de notificación por correo.
- **Bonus:** Se agrego timestamp a los logs.

### **Nivel 2 – cleanup_logs.sh**
- Busca archivos en `/var/log` con más de 7 días.
- Los comprime en `.tar.gz`.
- Los mueve a `/backup/logs/`.
- Elimina los archivos originales después de confirmar la compresión.
- Genera un log con las acciones realizadas.
- **Bonus:** Configurado en `cron` para ejecutarse a las **2:00 AM**.

### **Nivel 3 – deploy_app.sh**
- Clona o actualiza el repositorio de GitHub.
- Reinicia el servicio correspondiente (ej. nginx).
- Guarda el resultado en `deploy.log`.
- **Bonus:** Notificación al equipo via webhook (Slack/Discord).
- **Bonus:** Manejo de errores (si falla `git pull`, se aborta el despliegue).

### **Nivel 4 – monitor_system.sh**
- Mide uso de CPU, RAM y disco.
- Registra alertas en `alerts.log` si se superan los límites.
- Envía notificaciones por correo o webhook.
- **Bonus:** Salida con colores (verde = OK, rojo = alerta).
- **Bonus:** Histórico diario en `metrics_YYYYMMDD.log`.

---
