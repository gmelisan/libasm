# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kemmeric <kemmeric@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/20 12:48:23 by gmelisan          #+#    #+#              #
#    Updated: 2021/07/20 17:31:39 by gmelisan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

CC = clang

AS = nasm
ASFLAGS = -f macho64

SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJ = $(SRC:.s=.o)

SRC_TEST = main.c
OBJ_TEST = main.o

all: $(NAME)

$(NAME): $(OBJ)
	@ar rc $@ $^
	@ranlib $@
	@echo "\033[0;32mFile $@ was successfully created.\033[0m"

test: main.c
	@$(CC) $(CFLAGS) main.c -L. -lasm -o test

%.o : %.s
	$(AS) $(ASFLAGS) $<

clean:
	@rm -f $(OBJ)
	@rm -f $(OBJ_TEST)

fclean: clean
	@rm -f $(NAME)
	@rm -f test

re: fclean all
