#!/bin/bash
[ ! -z "${VIRTUAL_HOST}" ] && sed -i "s/VIRTUAL_HOST/${VIRTUAL_HOST}/" /etc/nginx/conf.d/default.conf
[ ! -z "${PHP_HOST}" ] && sed -i "s/PHP_HOST/${PHP_HOST}/" /etc/nginx/conf.d/default.conf
[ ! -z "${PHP_PORT}" ] && sed -i "s/PHP_PORT/${PHP_PORT}/" /etc/nginx/conf.d/default.conf
[ ! -z "${APP_MAGE_MODE}" ] && sed -i "s/APP_MAGE_MODE/${APP_MAGE_MODE}/" /etc/nginx/conf.d/default.conf

mkdir -p /srv/nginx/${VIRTUAL_HOST} && \
echo "example docker container nginx server" > /srv/nginx/${VIRTUAL_HOST}/index.html

/usr/sbin/nginx -g "daemon off;"