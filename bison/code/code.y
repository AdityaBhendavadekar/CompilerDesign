%{
    // Yacc program
    #include <stdio.h>
    #undef yywrap
    #define yywrap() 1
%}

%token IDENTIFIER RETURNTYPE FUNCTION DATATYPE OPENCURLY CLOSECURLY COMMA
%token SEMICOLON RETURN NUM OPENROUND CLOSEROUND

%%

stat: func declarations RETURN NUM SEMICOLON CLOSECURLY { 
          printf("\nThis is correct code.\n\n"); 
    }
    ;

func: RETURNTYPE FUNCTION OPENROUND CLOSEROUND OPENCURLY
    ;

declarations: declaration
            | declarations declaration
            ;

declaration: DATATYPE IDENTIFIER COMMA 
           | DATATYPE IDENTIFIER SEMICOLON 
           | IDENTIFIER COMMA 
           | IDENTIFIER SEMICOLON 
           ;

%%

extern FILE *yyin, *yyout;

int main(void)
{
    yyin = fopen("input.txt", "r");
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
    printf("Syntax error: %s\n", s);
}
