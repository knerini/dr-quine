COLLEEN 	= Colleen
COLLEEN_SRC = Colleen.cpp
COLLEEN_OBJ = $(COLLEEN_SRC:.cpp=.o)
TMP_C		= tmp_colleen

GRACE		= Grace
GRACE_SRC	= Grace.cpp
GRACE_OBJ 	= $(GRACE_SRC:.cpp=.o)
KID			= Grace_kid.cpp

SULLY		= Sully
SULLY_SRC	= Sully.cpp
SULLY_OBJ	= $(SULLY_SRC:.cpp=.o)

CC 			= clang++
FLAGS 		= -Wall -Werror -Wextra -std=c++23

RM 			= rm -f

%.o: %.cpp
	@$(CC) -c $(FLAGS) -o $@ $<

all: colleen grace sully

help:
	@echo "make collen : compile Colleen quine, execute the program and put the output in a tmp file."
	@echo "make diff_c : diff between Colleen.cpp and the tmp file. There must be no difference."
	@echo "make grace : compile Grace quine and execute the program."
	@echo "make diff_g : diff between Grace.cpp and Grace_kid.cpp (created by the program). There must be no difference."
	@echo "make sully : compile Sully quine and execute the program."
	@echo "make diff_s1 X=<num> : diff Sully.cpp with one of the created Sully_X.cpp file. Num range is 0 -4. There must be an only difference with the variable num."
	@echo "make diff_s2 X1=<num> X2=<num> : diff Sully_X1.cpp with another of the created Sully_X2.cpp file. Num range is 0 -4. There must be an only difference with the variable num."
	@echo "make all : execute make colleen, make grace and make sully" 

colleen: $(COLLEEN_OBJ)
	@$(CC) $(FLAGS) $(COLLEEN_OBJ) -o $(COLLEEN)
	@echo "Quine Colleen compiled - CPP"
	@./$(COLLEEN) > $(TMP_C)

grace: $(GRACE_OBJ)
	@$(CC) $(FLAGS) $(GRACE_OBJ) -o $(GRACE)
	@echo "Quine Grace compiled - CPP"
	@./$(GRACE)

sully: $(SULLY_OBJ)
	@$(CC) $(FLAGS) $(SULLY_OBJ) -o $(SULLY)
	@echo "Quine Sully compiled - CPP"
	@./$(SULLY)

diff_c:
	diff $(COLLEEN_SRC) $(TMP_C) || true

diff_g:
	diff $(GRACE_SRC) $(KID) || true

diff_s1:
	diff $(SULLY_SRC) Sully_$(X).cpp || true

diff_s2:
	diff Sully_$(X1).cpp Sully_$(X2).cpp || true

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