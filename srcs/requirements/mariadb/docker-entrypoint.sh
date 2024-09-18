#!/bin/bash

set -eo pipefail

# Skip initialization if it's already done
if [ ! -d "/var/lib/mysql/is_init" ]; then

    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    mysqld --user=mysql --skip-networking &
    pid="$!"

    # Wait for MySQL to be ready
    until mysqladmin ping -h"localhost" --silent; do
        echo "Waiting for MariaDB to be ready..."
        sleep 2
    done

    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "CREATE USER IF NOT EXISTS 'root'@'%';"
    mysql -e "ALTER USER 'root'@'%' IDENTIFIED BY '';"
    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
    mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
    mysql -e "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"

    echo "done" > /var/lib/mysql/is_init
    mysqladmin -uroot -p${MYSQL_ROOT_PASSWORD} shutdown
    wait "$pid"
fi

# Start MySQL server
exec gosu mysql "$@"