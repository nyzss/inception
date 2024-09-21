FROM debian:bookworm-slim

RUN apt update -y && apt upgrade -y && \
	apt install openssl -y && \
	apt install nginx -y

RUN mkdir -p /var/www/html && \
	chmod -R 777 /var/www/html && \
	chown -R www-data:www-data /var/www/html

RUN mkdir -p /etc/nginx/ssl && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/nginx/ssl/server.key \
		-out /etc/nginx/ssl/server.crt \
		-subj "/CN=${DOMAIN_NAME}"

COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]