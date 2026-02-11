#!/bin/sh

set -e

#envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
# 1. On génère la configuration à partir du template
# On précise les variables pour éviter que envsubst n'efface d'autres variables nginx
envsubst '${LISTEN_PORT} ${APP_HOST} ${APP_PORT}' < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf


nginx -g 'daemon off;'
