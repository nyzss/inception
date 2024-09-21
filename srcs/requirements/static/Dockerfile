FROM debian:bookworm-slim

RUN apt update -y

RUN apt install nodejs -y
RUN apt install npm -y

RUN mkdir -p /var/www/html/static

COPY ./website /var/www/html/static

WORKDIR /var/www/html/static

RUN npm install

RUN npm run build

CMD ["bash"]