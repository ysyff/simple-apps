From node:18.20.8-alpine
WORKDIR /app
ENV APP_PORT=3000
ADD . .
RUN npm install
CMD npm start