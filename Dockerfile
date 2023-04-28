ARG CEREBROVER=0.9.4

FROM alpine:latest as builder

ARG CEREBROVER
ENV CEREBRO_VER=$CEREBROVER

ADD https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VER}/cerebro-${CEREBRO_VER}.tgz /

RUN mkdir /cerebro && tar -zxf cerebro-${CEREBRO_VER}.tgz --strip-components 1 -C /cerebro


FROM alpine:3.17
LABEL MAINTAINER ant@manchestermonkey.co.uk

ARG CEREBROVER
ENV CEREBRO_VER=$CEREBROVER

RUN apk add --no-cache bash openjdk8-jre

COPY --from=builder /cerebro /cerebro

WORKDIR /cerebro

EXPOSE 9000/tcp

ENTRYPOINT ["/cerebro/bin/cerebro"]