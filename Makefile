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
DB = ${HOME}/data/db

all: 
	mkdir -p ${WEB}
	mkdir -p ${DB}
	docker compose -f ${COMPOSE} up

detach: 
	docker compose -f ${COMPOSE} up -d

stop: 
	docker compose -f ${COMPOSE} stop

down: 
	sudo rm -rf ${WEB}/*
	sudo rm -rf ${DB}/*
	docker volume prune --force
	docker compose -f ${COMPOSE} down -v --remove-orphans

rebuild: down
	docker compose -f ${COMPOSE} build

clean: down
	docker system prune -a --volumes

fclean: down
	docker system prune -a --volumes -f

re: fclean 
	make all

.PHONY: all clean re