FROM debian:bookworm-slim

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-client curl php-fpm php-mysql php-gd \
	php-cli php-curl php-mbstring php-zip \
	php-opcache php-xml php-mysqli -y

RUN php-fpm8.2 --version

RUN sed -i 's|^listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -L -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv ./wp-cli.phar /bin/wp

RUN wp --info

RUN mkdir -p /var/www/html/wordpress && \
	chmod -R 777 /var/www/html/wordpress && \
	chown -R www-data:www-data /var/www/html/wordpress

WORKDIR /var/www/html/wordpress

COPY ./configure.sh /usr/local/bin/configure.sh
RUN chmod +x /usr/local/bin/configure.sh

# RUN apt install redis -y

EXPOSE 9000

CMD ["/usr/local/bin/configure.sh"]
