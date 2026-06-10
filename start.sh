#!/bin/sh

set -e

echo "Criando usuário MQTT..."

mosquitto_passwd -b -c \
  /mosquitto/config/passwd \
  "$MQTT_USERNAME" \
  "$MQTT_PASSWORD"

chmod 600 /mosquitto/config/passwd

echo "Iniciando Mosquitto..."

mosquitto -c /mosquitto/config/mosquitto.conf &

echo "Iniciando Flask..."

exec gunicorn \
  --bind 0.0.0.0:${PORT} \
  app:app