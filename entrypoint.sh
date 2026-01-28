#!/bin/bash
set -e

echo "Creating database (if not exists)..."

echo "Running migrations..."
bundle exec rails db:migrate

echo "Starting Rails on port $PORT"
exec bundle exec rails server -b 0.0.0.0 -p $PORT
