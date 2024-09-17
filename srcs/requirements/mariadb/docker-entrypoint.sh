#!/bin/bash

set -eo pipefail

wait_for_mysql() {
    until mysql -u root -e "SELECT 1" &> /dev/null; do
        echo "Waiting for MariaDB to be ready..."
        sleep 2
    done
}

# Skip initialization if it's already done
if [ ! -d "/is_init" ]; then
    mysqld --user=mysql --skip-networking &
    pid="$!"

    wait_for_mysql

    # Wait for MySQL to be ready
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
    mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
    mysql -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"




    echo "done" > /is_init

    echo "Stopping MySQL server..."
    kill "$pid"
    wait "$pid"
fi

# Start MySQL server
exec gosu mysql "$@"
# exec mysqld --user=mysql "$@"