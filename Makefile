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

all: 
	docker compose -f ${SRCS}/${DOCKER_COMPOSE} up

clean:
	echo clean

fclean: clean
	echo fclean

re: fclean all

.PHONY: all clean fclean re