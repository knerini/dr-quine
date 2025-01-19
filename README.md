# THE PROJECT : DR-QUINE
Subject version : 2.1
## Guidelines
This 42's School Project aims to start being familiar with quines programs. A quine takes no input and produces a copy of its own source code as its only output.
It's a "self-replicating program". The purpose of the project is to write 3 quines, each with its own rules :
- Colleen : a main function, another function called by the main function, a comment inside the main function and a comment outside the program.
- Grace : no main function declared, only 3 defines, one comment. The program has to write its source code in a file called `Grace_kid.<extension>`.
- Sully : an integer starting at 5. The program has to write its source code in a file called `Sully_X.<extension>` where X is the value of the integer of the source code, compile the file and execute it. The integer has to be decremented once at each program created while X is greater or equals to 0. 

Each program has to be wrote in 2 imposed languages : C and Assembly and 1 in a choosen language and not mandatory (bonus part), C++ is my choice. To validate the program, the `diff` command must show no difference between the source code and the output or the new file created, except for *Sully* where the only difference is the value of the integer.

## Make
Programs running under Linux.
- `make` : executes `make colleen`, `make grace` and `make sully`.
- `make colleen` : compiles and executes *Colleen* program and put the output in a tmp file.
- `diff_c` : executes the `diff` command between the source file and the tmp file.
- `make grace` : compiles and executes *Grace* program.
- `diff_g` : executes the `diff` command between the source file and the kid file.
- `make sully` : compiles and executes *Sully* program.
- `make diff_s1 X=<num>` : executes `diff` command between the source file and the Sully_X file designed by argument where num is a number in range 0 - 4.
- `make diff_s2 X1=<num> X2=<num>` : executes `diff` command between one Sully_x file and another Sully_x file designed by arguments where num is a number in range 0 - 4.
- `make help` : explains each rule.

## Ressources Used
- [Quine (computing)](https://en.wikipedia.org/wiki/Quine_(computing)) Wikipedia
- [Fixed point (mathematics)](https://en.wikipedia.org/wiki/Fixed_point_(mathematics)) Wikipedia
- [Quines (self-replicating programs)](http://www.madore.org/~david/computers/quine.html#sec_fp) David Madore

# QUINES
## Language : C
### Colleen
Usage of `printf` specifying the argument number with `$` to reuse the same argument many times, making the code shorter and the `printf` function less heavier.
### Grace
Usage of `dprintf` same way as `printf` for *Colleen* but to write in as specified `fd`.
### Sully
Usage of `dprintf` as *Grace* and `sprintf` to write in a specified `char *`, same way as `printf` for *Colleen*.
Usage of `system` to execute commands to compile and execute another file inside the code. Easier than using `execve` avoiding the need to use `fork` and the need to give an environment, making the code shorter and ligher for a quine.
