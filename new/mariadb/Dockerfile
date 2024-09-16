FROM debian:bookworm-slim

ENV MYSQL_ROOT_PASSWORD=inception
ENV MYSQL_DATABASE=inception
ENV MYSQL_USER=inception
ENV MYSQL_PASSWORD=inception

RUN apt-get update -y && \
	apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir /scripts && \
	mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld

COPY start_script.sh /scripts/start_script.sh
RUN chmod +x /scripts/start_script.sh

EXPOSE 3306

CMD ["/scripts/start_script.sh"]

