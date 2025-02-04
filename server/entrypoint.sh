#!/bin/sh
set -e

echo "Ожидание готовности PostgreSQL..."
# Ожидаем, пока база данных не станет доступной (используйте переменные окружения из вашего .env)
while ! pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER; do
  echo "База данных не готова, ждём 1 секунду..."
  sleep 1
done
echo "PostgreSQL готов!"

echo "Запуск миграций..."
npx sequelize-cli db:migrate

echo "Запуск сидирования..."
npx sequelize-cli db:seed:all

echo "Запуск приложения..."
exec npm run dev
