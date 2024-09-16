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

# Copy initialization script and entrypoint
COPY init.sql /docker-entrypoint-initdb.d/
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose the MySQL port
EXPOSE 3306

# Set the entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]

# Start MariaDB server
CMD ["mysqld"]

# FROM debian:bookworm-slim

# ENV MYSQL_ROOT_PASSWORD=inception
# ENV MYSQL_DATABASE=inception
# ENV MYSQL_USER=inception
# ENV MYSQL_PASSWORD=inception

# RUN apt-get update -y && \
# 	apt-get install -y mariadb-server && \
# 	rm -rf /var/lib/apt/lists/*

# RUN mkdir /scripts && \
# 	mkdir -p /run/mysqld && \
# 	chown -R mysql:mysql /run/mysqld

# COPY start_script.sh /scripts/start_script.sh
# RUN chmod +x /scripts/start_script.sh

# EXPOSE 3306

# CMD ["/scripts/start_script.sh"]

