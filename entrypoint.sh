#!/bin/bash
set -e

# Удаляем старый PID, если он есть
rm -f tmp/pids/server.pid

# Выполняем миграции
echo "Running database migrations..."
bundle exec rails db:migrate

# Запускаем сервер
echo "Starting Rails server..."
bundle exec rails server -b 0.0.0.0 -p ${PORT:-3000}
