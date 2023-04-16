
FROM node:16
#ubuntu:18.04
#RUN if [ ! -z "${MIRROR_REPO+x}" ]; then sed -i "s/dl-cdn.alpinelinux.org/${MIRROR_REPO}/g" /etc/apk/repositories; fi && \
#    apk add ca-certificates bash libc6-compat iptables ip6tables conntrack-tools curl && update-ca-certificates && rm /var/cache/apk/*

WORKDIR /app

ADD . .
RUN npm install
ENTRYPOINT ["npm","run", "build:prod"]
