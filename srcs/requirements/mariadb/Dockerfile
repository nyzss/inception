FROM debian:bookworm-slim

# Install MariaDB and gosu for step-down from root
RUN apt-get update && apt-get install -y mariadb-server gosu && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
	mkdir -p /var/run/mysqld && \
    chown mysql:mysql /var/run/mysqld

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=inception
ENV MYSQL_DATABASE=inception
ENV MYSQL_USER=inception
ENV MYSQL_PASSWORD=inception

RUN sed -i '/^bind-address/c\bind-address = 0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

WORKDIR /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld"]
