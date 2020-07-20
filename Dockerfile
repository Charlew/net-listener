FROM python:3.8.4-alpine3.12

COPY crontab.txt /
COPY entry.sh /
COPY net-listener.py /root/

ENV PYTHONUNBUFFERED=1 \
IP_DEVICE="" \
TZ=Europe/Warsaw

RUN apk add tzdata && \
    echo $TZ >  /etc/timezone && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    crontab /crontab.txt && \
    chmod +x entry.sh

CMD ["/entry.sh"]