#!/bin/sh

echo "Replacing environment variables in index.html"
envsubst < /usr/share/nginx/html/index.html > /tmp/index.html
mv /tmp/index.html /usr/share/nginx/html/index.html

echo "Starting nginx Web server"
./docker-entrypoint.sh "$@"
