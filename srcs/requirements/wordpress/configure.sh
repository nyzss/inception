#!/bin/bash

terminate() {
    echo "Terminating, bye.."
    pkill php-fpm
    exit 0
}

trap terminate SIGTERM SIGINT

until wp db check --allow-root; do
  echo "Waiting for database..."
  sleep 3
done

wp core install --url="${WORDPRESS_SITE_URL}" --title="${WORDPRESS_SITE_TITLE}" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --skip-email --allow-root

wp theme activate pixl --allow-root

wp user create "${USER_USERNAME}" "${USER_EMAIL}" --user_pass="${USER_PASSWORD}" --role=subscriber --allow-root

exec php-fpm8.2 -F -R