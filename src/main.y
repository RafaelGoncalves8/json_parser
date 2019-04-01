

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token R_CURLY L_CURLY COMMA COLON QUOTE EOL NUM STRING

%%

PROGRAM:
       PROGRAM EXP EOL { printf("VALIDO\n"); }
        |
        ;

EXP:
    R_CURLY EXP L_CURLY
    | KEY COLON EXP
    | STRING { $$ = $1 }
    | NUM { $$ = $1 }
    | LIST { $$ = $1 }
    ;

KEY:
    QUOTE STRING QUOTE
    ;

LIST:
    R_BRACKET EXP L_BRACKET
    ;


%%

void yyerror(char *s) {
}

int main() {
  yyparse();
    return 0;

}
