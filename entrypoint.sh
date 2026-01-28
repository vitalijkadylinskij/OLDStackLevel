#!/bin/bash
set -e

echo "Starting Rails on port $PORT"
exec bundle exec rails server -b 0.0.0.0 -p $PORT
