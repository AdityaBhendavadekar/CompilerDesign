%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int tempVarCount = 1;

char* newTemp() {
    char* temp = (char*) malloc(10);
    sprintf(temp, "t%d", tempVarCount++);
    return temp;
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}
%}

%union {
    char* str;
}

%token <str> ID NUM
%type <str> expr term factor

%%

stmt: ID '=' expr {
        printf("%s = %s\n", $1, $3);
    }
    ;

expr: expr '+' term {
        char* temp = newTemp();
        printf("%s = %s + %s\n", temp, $1, $3);
        $$ = temp;
    }
    | term { $$ = $1; }
    ;

term: term '*' factor {
        char* temp = newTemp();
        printf("%s = %s * %s\n", temp, $1, $3);
        $$ = temp;
    }
    | factor { $$ = $1; }
    ;

factor: ID { $$ = $1; }
      | NUM { $$ = $1; }
      ;

%%

int main() {
    yyparse();
    return 0;
}

