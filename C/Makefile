COLLEEN 	= Colleen
COLLEEN_SRC = Colleen.c
COLLEEN_OBJ = $(COLLEEN_SRC:.c=.o)
TMP_C 		= tmp_colleen

CC 			= gcc
FLAGS 		= -Wall -Werror -Wextra

RM 			= rm -f

%.o: %.c
	@$(CC) $(FLAGS) -o $@ -c $<

colleen: $(COLLEEN)
	@echo "Quine Colleen compiled - C"
	@./Colleen > $(TMP_C)

diff_c:
	@diff $(COLLEEN_SRC) $(TMP_C)

$(COLLEEN): $(COLLEEN_OBJ)
	@$(CC) $(FLAGS) $(COLLEEN_OBJ) -o $(COLLEEN) 

clean:
	@$(RM) $(COLLEEN_OBJ)
	@echo "Objects removed."

fclean: clean
	@$(RM) $(COLLEEN)
	@$(RM) tmp_*
	@echo "Files cleaned."

re: fclean colleen

.PHONY: colleen clean fclean re