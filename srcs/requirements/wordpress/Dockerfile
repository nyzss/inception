FROM debian:bookworm-slim

RUN apt update -y && apt upgrade -y

RUN apt install mariadb-client curl php-fpm php-mysql php-gd \
	php-cli php-curl php-mbstring php-zip \
	php-opcache php-xml php-mysqli -y

RUN php-fpm8.2 --version

RUN sed -i 's|^listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|' /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv ./wp-cli.phar /bin/wp

RUN wp --info

# RUN mkdir -p /var/www/html && \
# 	curl -L -O https://wordpress.org/wordpress-6.6.2.tar.gz && \
# 	tar xf wordpress-6.6.2.tar.gz && \
# 	mv wordpress/* /var/www/html

RUN mkdir -p /var/www/html && \
	chmod -R 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

WORKDIR /var/www/html

COPY ./theme/ /var/www/html/wp-content/themes/

COPY ./configure.sh /usr/local/bin/configure.sh
RUN chmod +x /usr/local/bin/configure.sh

# COPY wp-config.php /var/www/html/wp-config.php

EXPOSE 9000

CMD ["/usr/local/bin/configure.sh"]
# CMD ["php-fpm8.2", "-F", "-R"]
