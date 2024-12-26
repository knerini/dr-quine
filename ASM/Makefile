COLLEEN 	= Colleen
COLLEEN_SRC = Colleen.s
COLLEEN_OBJ = $(COLLEEN_SRC:.s=.o)
TMP_C		= tmp_colleen

CC 			= gcc
CFLAGS 		= -Wall -Werror -Wextra

NASM 		= nasm
SFLAGS		= -f elf64

RM 			= rm -f

%.o: %.s
	@$(NASM) $(SFLAGS) $< -o $@

colleen: $(COLLEEN_OBJ)
	@$(CC) $(CFLAGS) -o $(COLLEEN) $(COLLEEN_OBJ)
	@echo "Quine Colleen compiled - ASM"
	@./$(COLLEEN) > $(TMP_C)

diff_c:
	@diff $(COLLEEN_SRC) $(TMP_C)

clean:
	@$(RM) $(COLLEEN_OBJ)
	@echo "Objects removed."

fclean: clean
	@$(RM) $(COLLEEN)
	@$(RM) tmp_*
	@echo "Files cleaned."

re: flcean colleen

.PHONY: colleen clean fclean re
