#!/usr/bin/env sh

if [ "$@" == "default" ]; then
    php-fpm7 && nginx -g 'daemon off;'
else
    exec "$@"
fi