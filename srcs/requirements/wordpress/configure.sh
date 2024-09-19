#!/bin/bash

wp core download --allow-root

wp core config --dbhost="${WORDPRESS_DB_HOST}" --dbname="${WORDPRESS_DB_NAME}" \
  --dbuser="${WORDPRESS_DB_USER}" --dbpass="${WORDPRESS_DB_PASSWORD}" --allow-root

wp config set WP_CACHE true --raw --allow-root

wp config set WP_REDIS_HOST redis --allow-root

wp config set WP_REDIS_PORT 6379 --allow-root

until wp db check --allow-root; do
  echo "Waiting for database..."
  sleep 3
done

wp core install --url="${WORDPRESS_SITE_URL}" --title="${WORDPRESS_SITE_TITLE}" \
  --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
  --admin_email="${WORDPRESS_ADMIN_EMAIL}" --skip-email --allow-root

wp theme install pixl --activate --allow-root

wp plugin install redis-cache --activate --allow-root

wp redis enable --allow-root

wp user create "${USER_USERNAME}" "${USER_EMAIL}" --user_pass="${USER_PASSWORD}" --role=subscriber --allow-root

exec php-fpm8.2 -F -R