FROM debian:bookworm-slim

ARG GRAFANA_USER=new_user

RUN apt update -y && \
	apt install -y apt-transport-https software-properties-common wget

RUN mkdir -p /etc/apt/keyrings/ && \
	wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | tee /etc/apt/keyrings/grafana.gpg > /dev/null

RUN echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list

RUN apt update -y && \
	apt install grafana -y

RUN apt install vim -y

COPY configure.sh /configure.sh
COPY grafana.ini /grafana.ini

RUN chmod +x /configure.sh

EXPOSE 7000

CMD ["/configure.sh"]