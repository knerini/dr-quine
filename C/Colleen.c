#include <stdio.h>
/*
Is Rick Deckard a replicant ?
*/
void printer(const char *s){printf(s, 10, 34, s);}
int main(){
/*
Rachael is a Nexus-6 replicant.
*/
const char s[] = "#include <stdio.h>%1$c/*%1$cIs Rick Deckard a replicant ?%1$c*/%1$cvoid printer(const char *s){printf(s, 10, 34, s);}%1$cint main(){%1$c/*%1$cRachael is a Nexus-6 replicant.%1$c*/%1$cconst char s[] = %2$c%3$s%2$c;%1$cprinter(s);%1$creturn 0;}%1$c";
printer(s);
return 0;}
