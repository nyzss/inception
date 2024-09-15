FROM wordpress:6.6.2-php8.1-fpm-alpine

RUN apk --no-cache add curl bash

RUN apk --no-cache add curl bash mysql-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv ./wp-cli.phar /bin/wp

RUN wp --info

COPY ./wp-config.php /var/www/html/wp-config.php

# Your custom theme (if needed)
COPY ./theme/ /var/www/html/wp-content/themes/

COPY ./configure.sh /usr/local/bin/configure.sh

RUN chmod +x /usr/local/bin/configure.sh

WORKDIR /var/www/html

EXPOSE 9000

# CMD ["php-fpm"]
CMD ["/usr/local/bin/configure.sh"]