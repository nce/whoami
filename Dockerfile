FROM node AS builder

WORKDIR /usr/src/app/
COPY www/package*.json .

RUN npm install \
 && mkdir src

COPY www/src src

RUN npm run build

FROM nginx:1.23.3

COPY --from=builder /usr/src/app/dist /usr/share/nginx/html
