#!/bin/sh

echo "hola mundo" > /usr/share/nginx/html/test2

#echo "/docker-entrypoint.sh $@"

#exec "/docker-entrypoint.sh $@"

exec "$@"
