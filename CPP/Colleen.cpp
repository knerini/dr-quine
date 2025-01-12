#include <iostream>
/*
Is Rick Deckard a replicant ?
*/
void printer(const std::string& s){std::cout << s;}
int main(){
/*
Rachael is a Nexus-6 replicant.
*/
std::string s = R"(#include <iostream>
/*
Is Rick Deckard a replicant ?
*/
void printer(const std::string& s){std::cout << s;}
int main(){
/*
Rachael is a Nexus-6 replicant.
*/
std::string s = R"{}";
s.replace(s.find("{}"), std::string("{}").length(), '(' + s + ')');
printer(s);
return 0;}
)";
s.replace(s.find("{}"), std::string("{}").length(), '(' + s + ')');
printer(s);
return 0;}
