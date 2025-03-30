#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
int main(){
int i=5;
if (i < 0){return 0;}
char filename[11];
char cmd[40];
const char s[] = "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <stdlib.h>%1$cint main(){%1$cint i=%2$d;%1$cif (i < 0){return 0;}%1$cchar filename[11];%1$cchar cmd[40];%1$cconst char s[] = %3$c%4$s%3$c;%1$csprintf(filename, %3$cSully_%5$cd.c%3$c, i);%1$csprintf(cmd, %3$cgcc -o Sully_%5$c1$d Sully_%5$c1$d.c ; ./Sully_%5$c1$d%3$c, i);%1$cint fd = creat(filename, S_IRUSR);%1$cif (fd){dprintf(fd, s, 10, i-1, 34, s, 37);}%1$csystem(cmd);%1$creturn 0;}%1$c";
sprintf(filename, "Sully_%d.c", i);
sprintf(cmd, "gcc -o Sully_%1$d Sully_%1$d.c ; ./Sully_%1$d", i);
int fd = creat(filename, S_IRUSR);
if (fd){dprintf(fd, s, 10, i-1, 34, s, 37);}
system(cmd);
return 0;}
