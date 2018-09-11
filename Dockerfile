FROM alpine:3.8

ENV S6VERSION=v1.21.7.0

# Install packages
RUN set -ex \
 && apk --no-cache add \
      nginx \
      bash \
      curl \
      git \
      php-fpm \
 && curl -sSfL "https://github.com/just-containers/s6-overlay/releases/download/${S6VERSION}/s6-overlay-amd64.tar.gz" | tar -xzv -C / \
 && rm -Rf /var/www/*

# Copy configuration files to root
COPY rootfs /

# Fix permissions
RUN chown -Rf nginx:www-data /var/www/

WORKDIR /var/www
EXPOSE 80 443

ENTRYPOINT ["/init"]
