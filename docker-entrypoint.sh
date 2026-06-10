#!/bin/sh

set -e

if [ -z "$MQTT_USERNAME" ] || [ -z "$MQTT_PASSWORD" ]; then
  echo "MQTT_USERNAME e MQTT_PASSWORD são obrigatórios."
  exit 1
fi

mkdir -p /mosquitto/config

mosquitto_passwd -b -c \
  /mosquitto/config/passwd \
  "$MQTT_USERNAME" \
  "$MQTT_PASSWORD"

exec mosquitto -c /mosquitto/config/mosquitto.conf