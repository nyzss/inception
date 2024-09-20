FROM debian:bookworm-slim

ARG FTP_USER
ARG FTP_PASSWORD

RUN apt update -y

RUN apt install vsftpd -y

RUN cp /etc/vsftpd.conf /etc/vsftpd.conf.back && \
	useradd -m -d /web_data -G www-data ${FTP_USER} && \
	echo ${FTP_USER}:${FTP_PASSWORD} | chpasswd

RUN mkdir -p /web_data && \
	# chown ${FTP_USER}:${FTP_USER} /web_data && \
	chmod 777 /web_data

COPY conf /etc/vsftpd.conf

EXPOSE 20 21 40000-50000

CMD ["vsftpd", "/etc/vsftpd.conf"]