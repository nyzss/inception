FROM debian:bookworm-slim

RUN apt-get update -y && \
	apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*

RUN sed -i 's/bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN systemctl start mariadb && \
# 	systemctl enable mariadb

# RUN systemctl status mariadb

# RUN mysql_secure_installation