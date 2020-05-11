FROM python:alpine

RUN apk add --no-cache postgresql-libs

RUN apk add --no-cache --virtual .build-deps \
        gcc \
        linux-headers \
        postgresql-dev \
        musl-dev \
    && pip3 install psycopg2 pg_activity \
    && apk del .build-deps

ADD entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
