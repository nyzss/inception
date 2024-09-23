FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install curl -y

RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o /nodesource_setup.sh && \
    bash /nodesource_setup.sh

RUN apt-get update -y && \
    apt-get install nodejs -y

RUN mkdir -p /var/www/html/static

COPY ./website /website

COPY configure.sh /configure.sh

RUN chmod +x /configure.sh

WORKDIR /var/www/html/static

CMD [ "/configure.sh" ]