
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

NUM [0-9]+
ALPHA [a-zA-Z]+
SYM [\,\.\'\:\;]
ESCAPED [(\\\")(\\\\)]

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

[\]     {
            return BACKSLASH;
        }

[$ALPHA$NUM$SYM$ESCAPED]+       {
                                    return STRING;
                                }

$NUM    {
                return NUM;
            }

\n      {
            return EOL;
        }

[ \t]+ ;


%%

int yywrap() {
  return 1;
}
