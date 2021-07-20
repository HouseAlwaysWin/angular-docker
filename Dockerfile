FROM node:14-alpine

WORKDIR '/app'

RUN apt-get update \
  && apt-get install -y --no-install-recommends chromium

ENV CHROME_BIN=chromiu

COPY package.json .
RUN npm install @angular/cli
RUN npm install

COPY . .

CMD ["npm","run","start"]

FROM nginx:latest
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html



