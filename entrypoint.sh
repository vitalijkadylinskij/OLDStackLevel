#!/bin/bash
set -e

# Удаляем старый PID, если он остался
if [ -f /app/tmp/pids/server.pid ]; then
  echo "Removing old server.pid"
  rm /app/tmp/pids/server.pid
fi

# Очищаем tmp
bundle exec rails tmp:cache:clear
bundle exec rails tmp:sockets:clear
bundle exec rails tmp:pids:clear

# (Опционально) Можно запускать миграции, если база готова
# echo "Running migrations..."
# bundle exec rails db:migrate RAILS_ENV=production || true

# Запуск Rails на всех интерфейсах и нужном порту
echo "Starting Rails server..."
exec bundle exec rails server -b 0.0.0.0 -p ${PORT:-3000}


