# Используем Ruby 2.5 на Debian Buster
FROM ruby:2.5-buster

# Настройки APT (чтобы старые версии Debian работали)
RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid

# Установка системных зависимостей
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Устанавливаем bundler и rails
RUN gem install bundler -v 1.17.3
RUN gem install rails -v 5.2.4 --ignore-dependencies

# Копируем Gemfile и ставим гемы
COPY Gemfile Gemfile.lock ./
RUN bundle config set force_ruby_platform true
RUN bundle install --jobs 4

# Создаем tmp и log и даем полные права
RUN mkdir -p /app/tmp /app/log && chmod -R 777 /app/tmp /app/log

# Копируем весь проект
COPY . .

# 🔥 КОПИРУЕМ ENTRYPOINT
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Устанавливаем переменные окружения
ENV RAILS_ENV=production
ENV PORT=3000

# Экспонируем порт
EXPOSE 3000

# Используем entrypoint для старта контейнера
ENTRYPOINT ["entrypoint.sh"]

