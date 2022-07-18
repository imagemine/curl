FROM alpine:latest@sha256:7580ece7963bfa863801466c0a488f11c86f85d9988051a9f9c68cb27f6b7872

LABEL base=alpine engine=curl version=java11 timezone=UTC port=8080 dir=/opt/app user=app

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apk update && apk add --no-cache tzdata curl 
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN mkdir -p /opt/app 

WORKDIR /opt/app

RUN addgroup -g 1000 -S app && adduser -u 1000 -G app -S app \
&& chown -R app:app /opt/app 

USER app
