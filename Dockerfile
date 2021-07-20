FROM node:14-alpine

WORKDIR '/app'

RUN apk add chromium

ENV CHROME_BIN=/usr/bin/chromium-browser

COPY package.json .
RUN npm install @angular/cli
RUN npm install

COPY . .

CMD ["npm","run","start"]

FROM nginx:latest
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html



