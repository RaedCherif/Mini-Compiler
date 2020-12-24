%{
#include<stdio.h>
#include<stdlib.h>
%}
%union{int num;}
%token<num> NB
%type<num> ID
%token VOID MAIN PO PF AO AF INT ID EQ PV WHILE EG DIF INF INFEG SUP SUPEG
%start program
%%
program:VOID MAIN PO PF AO code AF {printf("Proggramme acceptée");}
	;
code:
	|declaration
	|boucle
	|declaration boucle
	;
declaration: INT ID EQ NB PV {$2=$4;printf("Declaration acceptée variable=%d\n",$2);}
           ;
boucle:	WHILE PO cond PF AO code AF {printf("Boucle acceptée\n");}
	;
cond:
	|NB operl NB
	|ID operl ID
	|ID operl NB
	|NB operl ID
	;
operl:	EG
	|DIF
	|INF
	|INFEG
	|SUP
	|SUPEG
	;
%%
int yyerror(char *s){printf("%s\n",s);}
int yywrap(){return(1);}
int main(void){yyparse();}
