#!/bin/bash
set -eo pipefail

# If command starts with an option, prepend mysqld
if [ "${1:0:1}" = '-' ]; then
    set -- mysqld "$@"
fi

# Skip initialization if it's already done
if [ ! -d "/var/lib/mysql/mysql" ]; then
    # Initialize MySQL data directory
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # Start MySQL server
    /usr/sbin/mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

    # Run initialization scripts
    /usr/sbin/mysqld --user=mysql --bootstrap < /docker-entrypoint-initdb.d/init.sql
fi

# Start MySQL server
exec gosu mysql "$@"