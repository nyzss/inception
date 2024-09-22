FROM debian:bookworm-slim

RUN apt update -y && \
    apt install nodejs npm -y

RUN mkdir -p /var/www/html/static

COPY ./website /website

COPY configure.sh /configure.sh

RUN chmod +x /configure.sh

WORKDIR /var/www/html/static

CMD [ "/configure.sh" ]