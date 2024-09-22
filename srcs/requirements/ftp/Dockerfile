FROM debian:bookworm-slim

ARG FTP_USER
ARG FTP_PASSWORD

RUN apt update -y

RUN apt install vsftpd -y

RUN cp /etc/vsftpd.conf /etc/vsftpd.conf.back && \
	useradd -m -d /web_data -G www-data ${FTP_USER} && \
	chown -R www-data:www-data /web_data && \
	echo ${FTP_USER}:${FTP_PASSWORD} | chpasswd

RUN mkdir -p /var/run/vsftpd/empty && \
	chmod 777 /var/run/vsftpd/empty

RUN mkdir -p /web_data && \
	chmod 777 /web_data

COPY conf /etc/vsftpd.conf

COPY start.sh /usr/bin/start.sh

RUN chmod +x /usr/bin/start.sh

EXPOSE 20 21 30000-31000

CMD ["/usr/bin/start.sh"]