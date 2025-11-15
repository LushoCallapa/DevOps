#!/bin/bash

if [ -z "$1" ]; then
  echo "uso $0 <nombre_del_servicio>"
  exit 1
fi

SERVICIO="$1"
LOG_FILE="service_status.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

ESTADO=$(systemctl is-active "$SERVICIO" 2>/dev/null)

if [ "$ESTADO" == "active" ]; then
  MENSAJE="$TIMESTAMP - El servicio '$SERVICIO' está Activo"
else
  MENSAJE="$TIMESTAMP - ALERTA: El servicio '$SERVICIO' está inactivo"
  echo "$MENSAJE" | mail -s "ALERTA: Servicio $SERVICIO inactivo" luiscallapa2004@gmail.com
fi

echo "$MENSAJE"
echo "$MENSAJE" >> "$LOG_FILE"
