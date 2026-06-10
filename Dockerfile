FROM eclipse-mosquitto:2

RUN apk add --no-cache \
    python3 \
    py3-pip

COPY requirements.txt .
RUN pip3 install --break-system-packages -r requirements.txt

COPY mosquitto.conf /mosquitto/config/mosquitto.conf
COPY app.py /app.py
COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]