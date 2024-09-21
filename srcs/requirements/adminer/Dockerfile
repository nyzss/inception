FROM debian:bookworm-slim

RUN apt update -y && \
	apt install curl php php-fpm php-mysql -y

RUN php-fpm8.2 --version

RUN mkdir -p /var/www/html/adminer

RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/adminer/adminer.php

WORKDIR /var/www/html/adminer

EXPOSE 8080

CMD ["php-fpm8.2", "-F", "-R"]