#!/bin/sh

set -e

mkdir -p /mosquitto/config

mosquitto_passwd -b -c \
  /mosquitto/config/passwd \
  "$MQTT_USERNAME" \
  "$MQTT_PASSWORD"

chown mosquitto:mosquitto /mosquitto/config/passwd
chmod 600 /mosquitto/config/passwd

echo "Arquivo passwd:"
ls -l /mosquitto/config/passwd

exec mosquitto -c /mosquitto/config/mosquitto.conf