NAME		=	so_long
CC			=	gcc
FLAGS		=	-Wall -Wextra -Werror
MLX			=	mlx/Makefile.gen
LFT			=	libft/libft.a
INC			=	-I ./inc -I ./libft -I ./mlx
LIB			=	-L ./libft -lft -L ./mlx -lmlx -lXext -lX11 -lm -lbsd
OBJ			=	$(patsubst src%, obj%, $(SRC:.c=.o))
SRC			=	test.c	\

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m

all:		$(MLX) $(LFT) obj $(NAME)

$(NAME):	$(OBJ)
			@echo "$(COLOUR_RED) [ .. ] | compiling so_long..$(COLOUR_END)"
			$(CC) $(FLAGS) -o $@ $^ $(LIB)
			@echo "$(COLOUR_GREEN) [ OK ] | so_long ready!$(COLOUR_END)"


$(MLX):
			@echo "$(COLOUR_RED) [ .. ] | Compiling minilibx..$(COLOUR_END)"
			@make -s -C mlx
			@echo "$(COLOUR_GREEN) [ OK ] | Minilibx ready!$(COLOUR_END)"

$(LFT):		
			@echo "$(COLOUR_RED) [ .. ] | Compiling libft..$(COLOUR_END)"
			@make -s -C libft
			@echo "$(COLOUR_GREEN) [ OK ] | Libft ready!$(COLOUR_END)"

obj:
			@mkdir -p obj

obj/%.o:	src/%.c
			$(CC) $(FLAGS) $(INC) -o $@ -c $<

clean:
			@make -s $@ -C libft
			@rm -rf $(OBJ) obj
			@echo "$(COLOUR_BLUE)object files removed.$(COLOUR_END)"

fclean:		clean
			@make -s $@ -C libft
			@rm -rf $(NAME)
			@echo "$(COLOUR_BLUE)binary file removed.$(COLOUR_END)"

re:			fclean all

.PHONY:		all clean fclean re