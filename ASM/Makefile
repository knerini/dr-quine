COLLEEN 	= Colleen
COLLEEN_SRC = Colleen.s
COLLEEN_OBJ = $(COLLEEN_SRC:.s=.o)
TMP_C		= tmp_colleen

GRACE		= Grace
GRACE_SRC	= Grace.s
GRACE_OBJ 	= $(GRACE_SRC:.s=.o)
KID			= Grace_kid.s

SULLY		= Sully
SULLY_SRC	= Sully.s
SULLY_OBJ	= $(SULLY_SRC:.s=.o)

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

sully: $(SULLY_OBJ)
	@$(CC) $(CFLAGS) -o $(SULLY) $(SULLY_OBJ)
	@echo "Quine Sully compiled - ASM"
	@./$(SULLY)

diff_c:
	diff $(COLLEEN_SRC) $(TMP_C) || true

diff_g:
	diff $(GRACE_SRC) $(KID) || true

diff_s1:
	diff $(SULLY_SRC) Sully_$(X).s || true

diff_s2:
	diff Sully_$(X1).s Sully_$(X2).s || true

clean:
	@$(RM) $(COLLEEN_OBJ)
	@$(RM) $(GRACE_OBJ) 
	@$(RM) $(SULLY_OBJ)
	@echo "Objects removed."

fclean: clean
	@$(RM) $(COLLEEN)
	@$(RM) $(GRACE)
	@$(RM) $(SULLY)
	@$(RM) tmp_*
	@$(RM) $(KID)
	@$(RM) $(SULLY)_*
	@echo "Files cleaned."

re: fclean colleen grace

.PHONY: colleen grace sully diff_c diff_g diff_s1 diff_s2 clean fclean re
