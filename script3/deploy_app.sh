#!/bin/bash

#  Mini CI/CD – Deploy Script

# CONFIGURACIÓN
REPO_URL="https://github.com/rayner-villalba-coderoad-com/clash-of-clan"
APP_DIR="/var/www/clash-of-clan"
LOG_FILE="/home/luis/DevOps/script3/deploy.log"
SERVICE="nginx"
WEBHOOK_URL="TU_WEBHOOK_AQUI"

echo "===== Despliegue iniciado: $(date) =====" | tee -a "$LOG_FILE"

# 1) CLONAR O ACTUALIZAR EL REPO
if [ ! -d "$APP_DIR" ]; then
    echo "[INFO] El proyecto no existe. Clonando..." | tee -a "$LOG_FILE"
    git clone "$REPO_URL" "$APP_DIR" 2>&1 | tee -a "$LOG_FILE"

    if [ $? -ne 0 ]; then
        echo "[ERROR] Falló el git clone. Abortando." | tee -a "$LOG_FILE"
        exit 1
    fi
else
    echo "[INFO] Proyecto encontrado. Actualizando..." | tee -a "$LOG_FILE"
    cd "$APP_DIR"

    git pull origin main 2>&1 | tee -a "$LOG_FILE"
    if [ $? -ne 0 ]; then
        echo "[ERROR] Falló git pull. Abortando despliegue." | tee -a "$LOG_FILE"
        exit 1
    fi
fi

# 2) REINICIAR SERVICIO
echo "[INFO] Reiniciando servicio ($SERVICE)..." | tee -a "$LOG_FILE"
systemctl restart "$SERVICE" 2>&1 | tee -a "$LOG_FILE"

if [ $? -ne 0 ]; then
    echo "[ERROR] Falló el reinicio del servicio." | tee -a "$LOG_FILE"
    EXIT_MSG="❌ Falló el despliegue: error reiniciando el servicio."
else
    echo "[OK] Servicio reiniciado con éxito." | tee -a "$LOG_FILE"
    EXIT_MSG="✅ Despliegue exitoso en $(hostname)"
fi


echo "===== Despliegue finalizado: $(date) =====" | tee -a "$LOG_FILE"
echo ""
