FROM debian:bookworm-slim

RUN apt update -y && apt upgrade -y

RUN apt install php-fpm php-mysql php-gd \
	php-cli php-curl php-mbstring php-zip \
	php-opcache php-xml php-mysqli -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv ./wp-cli.phar /bin/wp

RUN wp --info

RUN mkdir -p /var/www/html && \
	curl -L -O https://wordpress.org/wordpress-6.6.2.zip && \
	unzip wordpress-6.6.2.zip && \
	mv wordpress/* /var/www/html

COPY ./theme/ /var/www/html/wp-content/themes/

COPY ./configure.sh /usr/local/bin/configure.sh
RUN chmod +x /usr/local/bin/configure.sh

COPY wp-config.php /var/www/html/wp-config.php

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/usr/local/bin/configure.sh"]
