

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token R_CURLY L_CURLY COMMA COLON QUOTE EOL ONENINE ZERO CHAR BACKSLASH MINUS DOT R_BRACKET L_BRACKET

%%

JSON:
        ELEMENT { printf("VALIDO\n"); return 0; }
        |
        ;

VALUE:
     OBJECT
     | ARRAY
     | STRING
     | NUM
     ;

OBJECT:
      R_CURLY L_CURLY
      | R_CURLY MEMBERS L_CURLY
      ;

MEMBERS:
      MEMBER
      | MEMBER COMMA MEMBERS
      ;

MEMBER:
      STRING COLON ELEMENT
      ;

ARRAY:
     R_BRACKET L_BRACKET
     | R_BRACKET ELEMENTS L_BRACKET
     ;

ELEMENTS:
        ELEMENT
        | ELEMENT COMMA ELEMENTS
        ;

ELEMENT:
       VALUE
       ;

STRING:
      QUOTE CHARACTERS QUOTE
      ;

CHARACTERS:
          CHARACTER CHARACTERS
          |
          ;

CHARACTER:
         CHAR
         | ZERO
         | ONENINE
         | R_CURLY
         | L_CURLY
         | R_BRACKET
         | L_BRACKET
         | COMMA
         | COLON
         | MINUS
         | BACKSLASH QUOTE
         | BACKSLASH BACKSLASH
         ;

NUM:
    INT FRAC
    ;

INT:
   DIGIT
   | ONENINE DIGITS
   | MINUS DIGIT
   | MINUS ONENINE DIGITS
   ;

DIGITS:
      DIGIT
      | DIGIT DIGITS
      ;

DIGIT:
     ZERO
     | ONENINE
     ;

FRAC:
    DOT DIGITS
    |
    ;

%%

void yyerror(char *s) {
    printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
