FROM debian:bullseye

RUN apt update -y

RUN apt install redis -y

EXPOSE 6379

CMD ["redis-server", "--bind", "0.0.0.0", "--port", "6379", "--protected-mode no"]