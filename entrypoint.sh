#!/bin/bash
set -e

# 🔹 Удаляем старый PID, если он остался
if [ -f /app/tmp/pids/server.pid ]; then
  echo "Removing old server.pid"
  rm /app/tmp/pids/server.pid
fi

# 🔹 Создаем tmp-папки, если их вдруг нет
mkdir -p /app/tmp/pids /app/tmp/cache /app/tmp/sockets /app/log
chmod -R 777 /app/tmp /app/log

# 🔹 Очищаем tmp Rails
bundle exec rails tmp:cache:clear
bundle exec rails tmp:sockets:clear
bundle exec rails tmp:pids:clear

# 🔹 (Опционально) Миграции можно включить, если база готова
echo "Running migrations..."
bundle exec rails db:migrate RAILS_ENV=production || true

# 🔹 Старт Rails на всех интерфейсах и порту Railway
echo "Starting Rails server..."
exec bundle exec rails server -b 0.0.0.0 -p ${PORT:-3000}



