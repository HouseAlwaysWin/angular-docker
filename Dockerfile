FROM node:14-alpine

WORKDIR '/app'

COPY package.json .
RUN npm install @angular/cli
RUN npm install

COPY . .

CMD ["npm","run","start"]

FROM nginx:latest

COPY --from=0 /app/build /usr/share/nginx/html



