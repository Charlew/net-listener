FROM python:3.8.4-alpine3.12

COPY crontab.txt /
COPY net-listener.py /

RUN apk add tzdata && \
    cp /usr/share/zoneinfo/Europe/Warsaw /etc/localtime && \
    echo "Europe/Warsaw" >  /etc/timezone && \
    crontab /crontab.txt

CMD ["python", "net-listener.py"]