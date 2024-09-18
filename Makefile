# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: okoca <okoca@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/20 18:43:34 by okoca             #+#    #+#              #
#    Updated: 2024/08/09 14:55:02 by okoca            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = srcs/

DOCKER_COMPOSE = docker-compose.yml

COMPOSE = ${SRCS}${DOCKER_COMPOSE}

WEB = ${HOME}/data/web
DB = ${HOME}/data/web

all: 
	mkdir -p ${WEB}
	mkdir -p ${DB}
	docker compose -f ${COMPOSE} up

orphans:
	docker compose -f ${COMPOSE} up --remove-orphans

detach: 
	docker compose -f ${COMPOSE} up -d

stop: 
	docker compose -f ${COMPOSE} stop

down: 
	docker volume prune --force
	docker compose -f ${COMPOSE} down -v --remove-orphans

# docker run --rm -v srcs_web:/data/ alpine /bin/sh -c "rm -rf /data/*"
# docker run --rm -v srcs_db:/data/ alpine /bin/sh -c "rm -rf /data/*"
rebuild: down
	sudo rm -rf ${WEB}/*
	sudo rm -rf ${DB}/*
	docker compose -f ${COMPOSE} build

clean: down
	docker system prune -a --volumes
	docker volume prune

fclean: down
	docker system prune -a --volumes -f
	docker volume prune

re: fclean 
	make all

.PHONY: all clean re