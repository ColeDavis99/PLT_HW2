%{
#include <iostream>
#include <fstream>
using namespace std;

#define YY_DECL extern "C" int yylex()

ofstream fout;
%}


%%
[ \t\n]         ;
[0-9]+\.[0-9]+  {   fout << "Found a floating-point number: " << yytext << endl;    }
[0-9]+          {   fout << "Found an integer: " << yytext << endl; }
[a-zA-Z0-9]+    {   fout << "Found a string: " << yytext << endl;   }
.               {   fout << "?: " << yytext << endl;}
%%

int main()
{
fout.open("testOutput");
yylex();
fout.close();

return 0;
}