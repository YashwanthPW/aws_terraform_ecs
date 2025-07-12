FROM node:20-alpine
WORKDIR /app
RUN npm install
COPY . .
EXPOSE 9000
CMD ["npm", "run", "dev"]
