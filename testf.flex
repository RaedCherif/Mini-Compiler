%{
#include"testf.tab.h"
extern YYSTYPE yylval;
%}
blanc [ \t\n]+
chiffre [0-9]+
lettre [a-zA-Z]
id {lettre}({lettre}|{chiffre})*
nb ({chiffre})*
%%
{blanc} {}
"void" {return(VOID);}
"main" {return(MAIN);}
"(" {return(PO);}
")" {return(PF);}
"{" {return(AO);}
"}" {return(AF);}
"int" {return(INT);}
"while" {return(WHILE);}
{id} {return(ID);}
"=" {return(EQ);}
{nb} {yylval.num=atoi(yytext);return(NB);}
";" {return(PV);}
"==" {return(EG);}
"<>" {return(DIF);}
"<" {return(INF);}
"<=" {return(INFEG);}
">" {return(SUP);}
">=" {return(SUPEG);}
%%