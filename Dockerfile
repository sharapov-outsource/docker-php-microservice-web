FROM php:8.2-alpine AS app_composer

LABEL maintainer="Alexander S. <alexander@sharapov.biz>"

ENV COMPOSER_ALLOW_SUPERUSER 1

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY composer.json /srv

WORKDIR /srv

RUN composer install --no-interaction --no-scripts --no-dev

FROM php:8.2-fpm-alpine AS app_runner

LABEL maintainer="Alexander S. <alexander@sharapov.biz>"

ENV TZ=UTC

RUN apk update &&  \
    apk add tzdata &&  \
    apk add --no-cache nginx

COPY --from=app_composer /srv/vendor /srv/vendor
COPY index.php /srv
ADD nginx.conf /etc/nginx/nginx.conf
RUN echo -e "[php]\n\
display_errors = off\n\
log_errors = on" > /usr/local/etc/php/conf.d/custom.ini

WORKDIR /srv

EXPOSE 80

COPY ./start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
