%{

    #include <stdio.h>
    #undef yywrap
    #define yywrap() 1

%}

%token ANS VAR ADDITION EQUALS NUMBER MULTI NUM1 NUM2 NUM3

%%

final: dd dd2 dd3 expr {
        printf("\n correct expression\n");
    }
;

expr: ANS EQUALS add 
;

add: NUM1 ADDITION NUM2 MULTI NUM3
;

dd: NUM1 EQUALS NUMBER
;

dd2: NUM2 EQUALS NUMBER
;

dd3: NUM3 EQUALS NUMBER
;

%%

extern FILE *yyin, *yyout;

int main(void)
{
    yyin = fopen("math.txt", "r");
    if (!yyin) {
        printf("Error opening input file.\n");
        return 1;
    }
    
    yyparse();  
    fclose(yyin);
    return 0;
}

void yyerror(const char *s)
{
    printf("Expression error: %s\n", s);
}
