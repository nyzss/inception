FROM debian:bullseye

RUN apt update -y && \
	apt install curl php php-fpm php-mysql -y

RUN php-fpm7.4 --version

RUN sed -i 's|^listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:8080|' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/html/adminer && \
	chmod -R 777 /var/www/html/adminer && \
	chown -R www-data:www-data /var/www/html/adminer

WORKDIR /var/www/html/adminer

COPY configure.sh /configure.sh

RUN chmod +x /configure.sh && \
	mkdir -p /run/php/

EXPOSE 8080

CMD [ "/configure.sh" ]
