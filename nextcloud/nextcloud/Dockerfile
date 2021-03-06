FROM alpine:edge
ENV nextcloud_version 10.0.1

RUN apk add --update \
    s6 \
    nginx \
    php5-fpm \
    php5-gd \
    php5-json \
    php5-mysql \
    php5-curl \
    php5-intl \
    php5-mcrypt \
    php5-imagick \
    php5-sqlite3 \
    php5-apcu \
    php5-pdo \
    php5-pdo_sqlite \
    php5-zip \
    php5-dom \
    php5-xml \
    php5-xmlreader \
    php5-ctype \
    php5-zlib \
    php5-iconv \
 && rm -rf /var/cache/apk/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

ADD https://download.nextcloud.com/server/releases/nextcloud-${nextcloud_version}.tar.bz2 /var/www/
RUN tar xvfj /var/www/nextcloud-${nextcloud_version}.tar.bz2 -C /var/www/
RUN chown -Rv nobody:nobody /var/www/nextcloud

COPY root /
RUN rm -rf /var/lib/nginx \
 && mkdir /var/lib/nginx \
 && mkdir /var/lib/nginx/tmp \
 && chown -Rv nobody:nobody /var/lib/nginx
RUN chmod +x /entrypoint.sh

VOLUME ["/var/www/nextcloud/data", "/var/www/nextcloud/config"]
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nextcloud"]
