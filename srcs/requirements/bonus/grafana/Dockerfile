FROM debian:bullseye

RUN apt update -y

RUN apt install gnupg2 curl \
	software-properties-common \
	dirmngr apt-transport-https \
	lsb-release ca-certificates -y

RUN curl https://packages.grafana.com/gpg.key | apt-key add -

RUN add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

RUN apt update -y && \
	apt install grafana -y

RUN apt install vim -y

COPY grafana.ini /grafana.ini

RUN cp -r /usr/share/grafana/conf/provisioning /provisioning

COPY provisioning /provisioning

COPY configure.sh /configure.sh

RUN chmod +x /configure.sh

EXPOSE 7000

CMD ["/configure.sh"]