COLLEEN 	= Colleen
COLLEEN_SRC = Colleen.c
COLLEEN_OBJ = $(COLLEEN_SRC:.c=.o)
TMP_C 		= tmp_colleen

GRACE 		= Grace
GRACE_SRC 	= Grace.c
GRACE_OBJ	= $(GRACE_SRC:.c=.o)
KID 		= Grace_kid.c

CC 			= gcc
FLAGS 		= -Wall -Werror -Wextra

RM 			= rm -f

%.o: %.c
	@$(CC) $(FLAGS) -o $@ -c $<

colleen: $(COLLEEN)
	@echo "Quine Colleen compiled - C"
	@./$(COLLEEN) > $(TMP_C)

grace: $(GRACE)
	@echo "Quine Grace compiled - C"
	@./$(GRACE)

diff_c:
	diff $(COLLEEN_SRC) $(TMP_C)

diff_g:
	diff $(GRACE_SRC) $(KID)

$(COLLEEN): $(COLLEEN_OBJ)
	@$(CC) $(FLAGS) $(COLLEEN_OBJ) -o $(COLLEEN)

$(GRACE): $(GRACE_OBJ)
	@$(CC) $(FLAGS) $(GRACE_OBJ) -o $(GRACE)

clean:
	@$(RM) $(COLLEEN_OBJ)
	@$(RM) $(GRACE_OBJ)
	@echo "Objects removed."

fclean: clean
	@$(RM) $(COLLEEN)
	@$(RM) $(GRACE)
	@$(RM) tmp_*
	@$(RM) $(KID)
	@echo "Files cleaned."

re: fclean colleen grace

.PHONY: colleen grace diff_c diff_g clean fclean re