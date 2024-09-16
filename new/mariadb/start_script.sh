#!/bin/sh

terminate() {
    echo "Terminating, bye.."
    mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
    exit 0
}

trap terminate TERM INT

if [ ! -d "/var/lib/mysql/mysql" ]; then
    # mysql_install_db --user=mysql --datadir=/var/lib/mysql
    mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql

    # Start MariaDB server
    mysqld_safe --user=mysql --datadir=/var/lib/mysql &

    # Wait for the server to start up
    while ! mysqladmin ping -s --password='' 2>/dev/null; do
        sleep 1
    done

    mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    mysql -e "DROP DATABASE IF EXISTS test;"
    mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"

    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -e "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
    mysql -e "GRANT ALL ON *.* TO 'admin'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"

    if [ -n "${MYSQL_DATABASE}" ]; then
        mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
    fi

    # Create user if MYSQL_USER and MYSQL_PASSWORD are provided
    if [ -n "${MYSQL_USER}" ] && [ -n "${MYSQL_PASSWORD}" ]; then
        mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
        if [ -n "${MYSQL_DATABASE}" ]; then
            mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"
        fi
        mysql -e "FLUSH PRIVILEGES;"
    fi

    # Stop the temporary server
    mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
fi

# Start MariaDB server
exec mysqld_safe --user=mysql --console