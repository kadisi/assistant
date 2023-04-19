FROM node:16 AS builder

WORKDIR /app

ADD . .

RUN npm install
RUN npm install --save-dev webpack
RUN npm run build:prod



FROM nginx:latest  

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /app/dist/* /usr/share/nginx/html/ 

RUN chmod -R 755 /usr/share/nginx/html
RUN chmod -R 755 /usr/share/nginx/html/*

RUN chown -R root:root /usr/share/nginx/html/*
RUN chown -R root:root /usr/share/nginx/html

ADD ./nginx/default.conf /etc/nginx/conf.d/default.conf

