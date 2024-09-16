#!/bin/bash

service mariadb start

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    mysqld_safe --datadir=/var/lib/mysql &
    sleep 5
    mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"
    mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"
    killall mysqld
    sleep 5
fi

exec mysqld_safe