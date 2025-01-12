COLLEEN 	= Colleen
COLLEEN_SRC = Colleen.c
COLLEEN_OBJ = $(COLLEEN_SRC:.c=.o)
TMP_C 		= tmp_colleen

GRACE 		= Grace
GRACE_SRC 	= Grace.c
GRACE_OBJ	= $(GRACE_SRC:.c=.o)
KID 		= Grace_kid.c

SULLY		= Sully
SULLY_SRC	= Sully.c
SULLY_OBJ	= $(SULLY_SRC:.c=.o)

CC 			= gcc
FLAGS 		= -Wall -Werror -Wextra

RM 			= rm -f

%.o: %.c
	@$(CC) $(FLAGS) -o $@ -c $<

all : colleen grace sully

help:
	@echo "make collen : compile Colleen quine, execute the program and put the output in a tmp file."
	@echo "make diff_c : diff between Colleen.c and the tmp file. There must be no difference."
	@echo "make grace : compile Grace quine and execute the program."
	@echo "make diff_g : diff between Grace.c and Grace_kid.c (created by the program). There must be no difference."
	@echo "make sully : compile Sully quine and execute the program."
	@echo "make diff_s1 X=<num> : diff Sully.c with one of the created Sully_X.c file. Num range is 0 -4. There must be an only difference with the variable num."
	@echo "make diff_s2 X1=<num> X2=<num> : diff Sully_X1.c with another of the created Sully_X2.c file. Num range is 0 -4. There must be an only difference with the variable num."
	@echo "make all : execute make colleen, make grace and make sully"

colleen: $(COLLEEN)
	@echo "Quine Colleen compiled - C"
	@./$(COLLEEN) > $(TMP_C)

grace: $(GRACE)
	@echo "Quine Grace compiled - C"
	@./$(GRACE)

sully: $(SULLY)
	@echo "Quine Sully compiled - C"
	@./$(SULLY)

diff_c:
	diff $(COLLEEN_SRC) $(TMP_C) || true

diff_g:
	diff $(GRACE_SRC) $(KID) || true

diff_s1:
	diff $(SULLY_SRC) Sully_$(X).c || true

diff_s2:
	diff Sully_$(X1).c Sully_$(X2).c || true

$(COLLEEN): $(COLLEEN_OBJ)
	@$(CC) $(FLAGS) $(COLLEEN_OBJ) -o $(COLLEEN)

$(GRACE): $(GRACE_OBJ)
	@$(CC) $(FLAGS) $(GRACE_OBJ) -o $(GRACE)

$(SULLY): $(SULLY_OBJ)
	@$(CC) $(FLAGS) $(SULLY_OBJ) -o $(SULLY)

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

re: fclean all

.PHONY: all help colleen grace sully diff_c diff_g diff_s1 diff_s2 clean fclean re