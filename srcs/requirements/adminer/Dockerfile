FROM debian:bookworm-slim

RUN apt update -y && \
	apt install curl php php-fpm php-mysql -y

RUN php-fpm8.2 --version

RUN sed -i 's|^listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:8080|' /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html/adminer && \
	chmod -R 777 /var/www/html/adminer && \
	chown -R www-data:www-data /var/www/html/adminer

RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/adminer/index.php

WORKDIR /var/www/html/adminer

EXPOSE 8080

CMD ["php-fpm8.2", "-F", "-R"]
# CMD ["php", "-S", "0.0.0.0:8080"]