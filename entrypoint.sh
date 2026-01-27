#!/bin/sh
set -e

mkdir -p tmp/pids
mkdir -p log

chmod -R 777 tmp log

rm -f tmp/pids/server.pid

exec "$@"
