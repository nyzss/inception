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

all: 
	docker compose -f ${COMPOSE} up

orphans:
	docker compose -f ${COMPOSE} up --remove-orphans

detach: 
	docker compose -f ${COMPOSE} up -d

stop: 
	docker compose -f ${COMPOSE} stop

down: 
	docker compose -f ${COMPOSE} down

clean: stop
	docker system prune -a --volumes

fclean: stop
	docker system prune -a --volumes -f

re: fclean 
	make all

.PHONY: all clean re