%{
//Cole Davis
//CS3500 HW2 Submission

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

ofstream fout;

int tokens = 0;
int lines = 0;

void pretty_print(int tokens);

#define YY_DECL extern "C" int yylex()
%}


%%
[ \t\r\f]               {   ;   }
[\n]                    {   lines++;    }
[\+\-\*\/\<\>\=\#]      {   fout << "Found an operator: " << yytext << endl;    }


%+.*                    {   ;   }
[0-9]+\.[0-9]+          {   fout << "Found a floating-point number: " << yytext << endl;    }
[0-9]+                  {   fout << "Found an integer: " << yytext << endl; }
[a-zA-Z0-9]+            {   fout << "Found a string: " << yytext << endl;   }
.                       {   fout << "?: " << yytext << endl;}
%%

void pretty_print(int tokens)
{
    fout << "#" << tokens << ":\tTOKEN:"<<endl;
}

int main()
{
    fout.open("testOutput");
    yylex();

    fout << lines << " lines processed."<<endl;
    fout.close();

    return 0;
}