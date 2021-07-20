FROM node:14-alpine

WORKDIR '/app'

RUN apk update \
  && apk install -y --no-install-recommends chromium

ENV CHROME_BIN=chromium

COPY package.json .
RUN npm install @angular/cli
RUN npm install

COPY . .

CMD ["npm","run","start"]

FROM nginx:latest
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html



