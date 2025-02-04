FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Копируем скрипт entrypoint и делаем его исполняемым
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 3000

# Используем entrypoint для автоматического выполнения миграций, сидов и запуска приложения
CMD ["/app/entrypoint.sh"]
