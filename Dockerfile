FROM node:lts-alpine AS build

WORKDIR /app

COPY . .

RUN npm install

FROM nginx:1.27.3-alpine

COPY --from=build /app /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
