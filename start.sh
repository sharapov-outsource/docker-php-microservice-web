#!/bin/sh
php-fpm -D
sleep 5s
nginx -g 'daemon off;'
