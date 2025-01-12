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

.PHONY: all colleen grace sully diff_c diff_g diff_s1 diff_s2 clean fclean re