#include <fstream>
#include <iostream>
/*
We're not in Blade Runner
*/
#define F_NAME "Grace_kid.cpp"
#define SRC R"(#include <fstream>
#include <iostream>
/*
We're not in Blade Runner
*/
#define F_NAME "Grace_kid.cpp"
#define SRC R"{}"
#define FT() int main(){std::string s = SRC; s.replace(s.find("{}"), std::string("{}").length(), '(' + s + ')'); std::ofstream file; file.open(F_NAME); file << s; file.close(); return 0;}
FT()
)"
#define FT() int main(){std::string s = SRC; s.replace(s.find("{}"), std::string("{}").length(), '(' + s + ')'); std::ofstream file; file.open(F_NAME); file << s; file.close(); return 0;}
FT()
