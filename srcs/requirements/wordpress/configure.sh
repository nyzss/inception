#!/bin/bash

# Function to handle termination signals
terminate() {
    echo "Terminating..."
    pkill php-fpm
    exit 0
}

# Trap termination signals
trap terminate SIGTERM SIGINT

# Wait for the database to be ready
until wp db check --allow-root; do
  echo "Waiting for database..."
  sleep 3
done

# Set up WordPress
wp core install --url="${WORDPRESS_SITE_URL}" --title="${WORDPRESS_SITE_TITLE}" --admin_user="${WORDPRESS_ADMIN_USER}" --admin_password="${WORDPRESS_ADMIN_PASSWORD}" --admin_email="${WORDPRESS_ADMIN_EMAIL}" --skip-email --allow-root

# Optionally, set up additional settings
wp option update blogname "${WORDPRESS_SITE_TITLE}" --allow-root
wp option update blogdescription "Just another WordPress site" --allow-root

# Start PHP-FPM
exec php-fpm