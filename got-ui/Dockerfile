FROM alpine:3.6
LABEL maintainer="Fernand Galiana"

ENV APP_DIR /app
ENV HTTP_PORT 80

WORKDIR $APP_DIR

ADD dist  $APP_DIR/dist
ADD nginx $APP_DIR/nginx
ADD scripts $APP_DIR/scripts

RUN set -ex; \
  apk --no-cache add nginx; \
  mv nginx/nginx.conf /etc/nginx; \
  mkdir -p /run/nginx; \
  chmod -R 744 /run/nginx; \
  chown -R nginx /run/nginx

EXPOSE 80

ENTRYPOINT ["/app/scripts/start.sh"]