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
[ \t\r\f]                           {   ;   }
[\n]                                {   lines++;    }
%+.*                                {   ;   }
[\+\-\*\/\<\>\=\#]                  {   fout << "Found an operator: " << yytext << endl;    }
[0-9A-F][0-9A-F]X                   {   fout << "Found Char Literal: " << yytext << endl;   }
(WHILE|ELSE|IF|PRINT)               {   fout << "Found Keyword: " << yytext << endl;    }
[+|-]?[0-9]+                        {   fout << "Found an integer: " << yytext << endl; }
[+|-]?[0-9]+\.[0-9]+                {   fout << "Found a decimal number: " << yytext << endl;    }
[+|-]?[0-9]+\.[0-9]+E[+|-]?[0-9]+   {   fout << "Found a scientific number: " << yytext << endl;    }
[0-9A-F]+H                          {   fout << "Found a hex number: " << yytext << endl;   }
[0|1]+B                             {   fout << "Found a binary number: " << yytext << endl;    }
\"[^ \n\t\r]*\"                     {   fout << "Found a string: " << yytext << endl;   }

.                                   {   fout << "?: " << yytext << endl;}
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