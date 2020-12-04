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
[\+\-\*\/\<\>\=\#]                  {   pretty_print(tokens);   fout << "OPERATOR   LEXEME: " << yytext << endl; tokens++;    }
[0-9A-F][0-9A-F]X                   {   pretty_print(tokens);   fout << "CHCONST    LEXEME: " << yytext << endl;  tokens++;}
(WHILE|ELSE|IF|PRINT)               {   pretty_print(tokens);   fout << "KEYWORD    LEXEME: " << yytext << endl;    tokens++;   }
[+|-]?[0-9]+                        {   pretty_print(tokens);   fout << "INTCONST   LEXEME: " << yytext << endl; tokens++;   }
[+|-]?[0-9]+\.[0-9]+                {   pretty_print(tokens);   fout << "DECCONST   LEXEME: " << yytext << endl;   tokens++;   }
[+|-]?[0-9]+\.[0-9]+E[+|-]?[0-9]+   {   pretty_print(tokens);   fout << "SCICONST   LEXEME: " << yytext << endl;    tokens++;   }
[0-9A-F]+H                          {   pretty_print(tokens);   fout << "HEXCONST   LEXEME: " << yytext << endl;   tokens++;   }
[0|1]+B                             {   pretty_print(tokens);   fout << "BINCONST   LEXEME: " << yytext << endl;    tokens++;   }
\"[^ \n\t\r]*\"                     {   pretty_print(tokens);   fout << "STRCONST   LEXEME: " << yytext << endl;   tokens++;   }
[A-Za-z][^ \n\t\r\"]*               {   pretty_print(tokens); fout << "IDENT      LEXEME: " << yytext << endl;  tokens++;   }
.                                   {   pretty_print(tokens); fout << "?          LEXEME: " << yytext << endl;    tokens++;   }
%%

void pretty_print(int tokens)
{
    fout << "#" << tokens << ": TOKEN: ";
}

int main()
{
    fout.open("testOutput");
    yylex();

    fout << lines << " lines processed.";
    fout.close();

    return 0;
}