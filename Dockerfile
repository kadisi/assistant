#FROM ubuntu:18.04 AS builder
#FROM ubuntu:18.04 
FROM node:16
#RUN if [ ! -z "${MIRROR_REPO+x}" ]; then sed -i "s/dl-cdn.alpinelinux.org/${MIRROR_REPO}/g" /etc/apk/repositories; fi && \
#    apk add ca-certificates bash libc6-compat iptables ip6tables conntrack-tools curl && update-ca-certificates && rm /var/cache/apk/*

#RUN apt update
#RUN apt-get install curl -y

#RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

#RUN apt update

#RUN apt install nodejs build-essential npm -y

WORKDIR /app

ADD . .

RUN npm install
RUN npm install --save-dev webpack
RUN npm run build:prod
