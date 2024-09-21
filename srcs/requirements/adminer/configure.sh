#!/bin/bash



if [ ! -d "/var/www/html/adminer/index.php" ]; then
	echo "Downloading adminer..."

	curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o index.php
fi

echo "Started adminer!"
exec php-fpm8.2 -F -R