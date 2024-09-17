FROM debian:bookworm-slim

RUN apt update -y && apt upgrade -y

RUN apt install php-fpm php-mysql php-gd \
	php-cli php-curl php-mbstring php-zip \
	php-opcache php-xml php-mysqli -y

