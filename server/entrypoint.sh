#!/bin/sh
set -e

echo "Ждём, пока PostgreSQL поднимется..."
until PGPASSWORD=$DB_PASS psql -h $DB_HOST -U $DB_USER -d $DB_NAME -c '\q' > /dev/null 2>&1; do
  echo "База данных не готова, ждём 1 секунду..."
  sleep 1
done
echo "PostgreSQL готов!"

echo "Запуск миграций..."
npx sequelize-cli db:migrate

echo "Запуск сидирования..."
npx sequelize-cli db:seed:all

echo "Запуск сервера..."
exec npm run dev
