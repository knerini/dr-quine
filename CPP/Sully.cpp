#include <fstream>
#include <iostream>
#include <format>
#include <cstdlib>
int main(){
int i = 5;
if (i <= 0){return 0;}
std::string s = R"(#include <fstream>
#include <iostream>
#include <format>
#include <cstdlib>
int main(){
int i = ?;
if (i <= 0){return 0;}
std::string s = R"{}";
s.replace(s.find("{}"), std::string("{}").length(), '(' + s + ')');
s.replace(s.find("?"), std::string("?").length(), std::to_string(i-1));
std::string f_name = "Sully_" + std::to_string(i-1) + ".cpp";
std::ofstream file;
file.open(f_name);
file << s;
file.close();
std::string cmd = std::format("clang++ -std=c++23 -o Sully_{0} Sully_{0}.cpp ; ./Sully_{0}", std::to_string(i-1));
std::system(cmd.c_str());
return 0;
}
)";
s.replace(s.find("{}"), std::string("{}").length(), '(' + s + ')');
s.replace(s.find("?"), std::string("?").length(), std::to_string(i-1));
std::string f_name = "Sully_" + std::to_string(i-1) + ".cpp";
std::ofstream file;
file.open(f_name);
file << s;
file.close();
std::string cmd = std::format("clang++ -std=c++23 -o Sully_{0} Sully_{0}.cpp ; ./Sully_{0}", std::to_string(i-1));
std::system(cmd.c_str());
return 0;
}
