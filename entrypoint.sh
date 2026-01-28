#!/bin/bash

# 🔹 (Опционально) Миграции можно включить, если база готова
echo "Running migrations..."
bundle exec rails db:migrate RAILS_ENV=production || true

rm -f tmp/pids/server.pid
bundle exec rails server -b 0.0.0.0 -p $PORT