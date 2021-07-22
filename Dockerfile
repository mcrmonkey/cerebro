FROM alpine:latest
LABEL MAINTAINER ant@manchestermonkey.co.uk

RUN apk update && apk add bash openjdk8-jre

ENV CEREBRO_VER 0.9.3

ADD https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VER}/cerebro-${CEREBRO_VER}.tgz /

RUN mkdir /cerebro && tar -zxf cerebro-${CEREBRO_VER}.tgz --strip-components 1 -C /cerebro

WORKDIR /cerebro

EXPOSE 9000

ENTRYPOINT ["/cerebro/bin/cerebro"]

