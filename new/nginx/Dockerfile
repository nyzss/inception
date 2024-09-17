FROM debian:bookworm-slim

ENV DOMAIN_NAME=localhost

RUN apt update -y && apt upgrade -y && \
	apt install openssl -y && \
	apt install nginx -y

# RUN mkdir -p /var/www/html/${DOMAIN_NAME} && \
# 	mkdir -p /etc/nginx/sites-available && \
# 	mkdir -p /etc/nginx/sites-enabled && \
# 	rm /etc/nginx/sites-enabled/default

# RUN mkdir -p /etc/nginx/ssl && \
# 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 		-keyout /etc/nginx/ssl/server.key \
# 		-out /etc/nginx/ssl/server.crt \
# 		-subj "/CN=${DOMAIN_NAME}"

# COPY nginx.conf /etc/nginx/sites-available/${DOMAIN_NAME}.conf

# RUN ln -s /etc/nginx/sites-available/${DOMAIN_NAME}.conf /etc/nginx/sites-enabled/

EXPOSE 80

CMD ["nginx", "-t"]