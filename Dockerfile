FROM alpine:latest

MAINTAINER ZixSeRo <tkp2147.abyss@gmail.com>

RUN apk add --no-cache git curl make gcc g++ mariadb-dev pcre-dev zlib-dev nano dos2unix bind-tools

RUN mkdir -p /opt/rAthena \
    && git clone https://github.com/rAthena-Thailand/rathena.git /opt/rAthena \
    && cd /opt/rAthena \
    && ./configure --enable-packetver=20191224 \
    && make clean \
    && make server

RUN apk del curl make

WORKDIR /opt/rAthena

COPY ./docker-entrypoint.sh docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

EXPOSE 6900/tcp 6121/tcp 5121/tcp

CMD ["./athena-start", "watch"]
