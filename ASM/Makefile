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

all: colleen grace sully

help:
	@echo "make collen : compile Colleen quine, execute the program and put the output in a tmp file."
	@echo "make diff_c : diff between Colleen.s and the tmp file. There must be no difference."
	@echo "make grace : compile Grace quine and execute the program."
	@echo "make diff_g : diff between Grace.s and Grace_kid.s (created by the program). There must be no difference."
	@echo "make sully : compile Sully quine and execute the program."
	@echo "make diff_s1 X=<num> : diff Sully.s with one of the created Sully_X.s file. Num range is 0 -4. There must be an only difference with the variable num."
	@echo "make diff_s2 X1=<num> X2=<num> : diff Sully_X1.s with another of the created Sully_X2.s file. Num range is 0 -4. There must be an only difference with the variable num."
	@echo "make all : execute make colleen, make grace and make sully"

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

.PHONY: all help colleen grace sully diff_c diff_g diff_s1 diff_s2 clean fclean re
