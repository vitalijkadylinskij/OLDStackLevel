#!/bin/bash
set -e

# 🔥 Удаляем старый PID Puma, если он остался после предыдущего запуска
rm -f /app/tmp/pids/server.pid

# 🔥 Прогоняем миграции (можно отключить, если не нужно)
echo "Running migrations..."
bundle exec rails db:migrate RAILS_ENV=production || true

# 🔥 Очищаем кэш Rails
bundle exec rails tmp:cache:clear
bundle exec rails tmp:sockets:clear
bundle exec rails tmp:pids:clear

# 🔥 Запуск Puma на всех IP и порту, который задаёт Railway
echo "Starting Rails server..."
exec bundle exec rails server -b 0.0.0.0 -p ${PORT:-3000}
