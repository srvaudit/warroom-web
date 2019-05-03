#!/usr/bin/env sh
set -eu

envsubst '${WARROOM_URL}' < /etc/nginx/conf.d/warroom.com.conf.template > /etc/nginx/conf.d/warroom.com.conf

exec "$@"
