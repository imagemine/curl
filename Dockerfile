FROM alpine:latest@sha256:bc41182d7ef5ffc53a40b044e725193bc10142a1243f395ee852a8d9730fc2ad

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
