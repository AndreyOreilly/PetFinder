FROM node:18

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["sh", "-c", "sleep 5 && npx sequelize-cli db:migrate && npx sequelize-cli db:seed:all && npm run dev"]
