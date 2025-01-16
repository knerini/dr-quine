#include <stdio.h>
#include <fcntl.h>
/*
We're not in Blade Runner
*/
#define F_NAME "Grace_kid.c"
#define SRC "#include <stdio.h>%1$c#include <fcntl.h>%1$c/*%1$cWe're not in Blade Runner%1$c*/%1$c#define F_NAME %2$cGrace_kid.c%2$c%1$c#define SRC %2$c%3$s%2$c%1$c#define FT() int main(){int fd = creat(F_NAME, S_IRUSR);if (fd) {dprintf(fd, SRC, 10, 34, SRC);}return 0;}%1$cFT()%1$c"
#define FT() int main(){int fd = creat(F_NAME, S_IRUSR);if (fd) {dprintf(fd, SRC, 10, 34, SRC);}return 0;}
FT()
