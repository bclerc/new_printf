NAME = libftprintf.a
PROJECT_NAME = libftprintf.a

SOURCES_FOLDER = ./
INCLUDES_FOLDER = includes
OBJECTS_FOLDER = ./

LIBS = libft

SOURCES = \
	ft_printf.c \
	flag_utils.c \
	sources/pf_math_utils.c \
	sources/utils.c \
	sources/pf_printbinary.c \
	sources/pf_putunbr.c \
	sources/pf_putchar.c \
	sources/pf_percent.c \
	sources/pf_putnbr.c \
	sources/pf_putstr.c \
	sources/pf_tohex.c \
	sources/pf_address.c

OBJECTS = $(SOURCES:.c=.o)

FSANITIZE = -fsanitize=address
FLAGS = -Werror -Wall -Wextra
CC = clang

NO_COLOR =		\033[38;5;15m
OK_COLOR =		\033[38;5;2m
ERROR_COLOR =	\033[38;5;1m
WARN_COLOR =	\033[38;5;3m
SILENT_COLOR =	\033[38;5;245m
INFO_COLOR =	\033[38;5;140m

.PHONY: all re clean fclean libft force doclean

all: $(NAME)

$(LIBS):
	@printf "$(NO_COLOR)All objects for $(INFO_COLOR)$(PROJECT_NAME) $(NO_COLOR)where successfully created.\n"
	@printf "\n$(NO_COLOR)-------- $(INFO_COLOR)Libft $(NO_COLOR)--------\n"
	@make -C $(@)
	@printf "$(NO_COLOR)-----------------------\n\n"

$(NAME): $(OBJECTS) $(LIBS)
	@ar rcs libftprintf.a $(OBJECTS) libft/*.o
	@printf "$(INFO_COLOR)$(NAME) $(NO_COLOR)successfully compiled. $(OK_COLOR)✓$(NO_COLOR)\n"

force: $(OBJECTS)
	@printf "$(NO_COLOR)All objects for $(INFO_COLOR)$(PROJECT_NAME) $(NO_COLOR)where successfully created.\n"
	@$(CC) $(FLAGS) -I$(INCLUDES_FOLDER) -o $(NAME) $(OBJECTS) -L  libft/ -lft
	@printf "$(INFO_COLOR)$(NAME) $(NO_COLOR)successfully compiled. $(OK_COLOR)✓$(NO_COLOR)\n"

%.o: %.c
	@$(CC) $(FLAGS) -I$(INCLUDES_FOLDER) -c $< -o $@
	@printf "$(NO_COLOR)Creating $(INFO_COLOR)%-30s $(OK_COLOR)✓$(NO_COLOR)\r" "$@"

clean:
	@make -C $(LIBS) clean
	@rm -f $(OBJECTS)
	@printf "$(INFO_COLOR)$(PROJECT_NAME) $(NO_COLOR)Removed all objects$(NO_COLOR).\n"

fclean: clean
	@make -C $(LIBS) fclean
	@rm -f $(NAME)
	@printf "$(INFO_COLOR)$(PROJECT_NAME) $(NO_COLOR)Removed $(INFO_COLOR)$(NAME)$(NO_COLOR).\n"

doclean: all clean

re: fclean all
