COLLEEN 	= Colleen
COLLEEN_SRC = Colleen.s
COLLEEN_OBJ = $(COLLEEN_SRC:.s=.o)
TMP_C		= tmp_colleen

GRACE		= Grace
GRACE_SRC	= Grace.s
GRACE_OBJ 	= $(GRACE_SRC:.s=.o)
KID			= Grace_kid.s

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

grace: $(GRACE_OBJ)
	@$(CC) $(CFLAGS) -nostartfiles -o $(GRACE) $(GRACE_OBJ) -e start
	@echo "Quine Grace compiled - ASM"
	@./$(GRACE)

diff_c:
	diff $(COLLEEN_SRC) $(TMP_C)

diff_g:
	diff $(GRACE_SRC) $(KID)

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
