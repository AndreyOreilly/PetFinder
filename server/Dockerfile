FROM node:18

RUN apt-get update && apt-get install -y postgresql-client

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Копируем скрипт entrypoint и даем ему права на выполнение
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 3000

CMD ["/app/entrypoint.sh"]
