
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

DIGIT [0-9]


%%

[{]     {
            return R_CURLY;
        }

[}]     {
            return L_CURLY;
        }

[[]     {
            return R_BRACKET;
        }

[]]     {
            return L_BRACKET;
        }

["]     {
            return QUOTE;
        }

[,]     {
            return COMMA;
        }

[:]     {
            return COLON;
        }

\\     {
            return BACKSLASH;
        }

[-]     {
            return MINUS;
        }

[1-9]  {
            return ONENINE;
        }

[0]       {
            return ZERO;
        }

\.      {
            return DOT;
        }

[ \t\n]+ ;

.       {
            return CHAR;
        }


%%

int yywrap() {
  return 1;
}
