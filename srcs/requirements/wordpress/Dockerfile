FROM wordpress:6.6.2-php8.1-fpm-alpine

COPY ./theme/ /var/www/html/wp-content/themes/

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm"]