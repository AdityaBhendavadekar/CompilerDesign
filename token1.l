%{
    #define yywrap() 1
    #include<stdio.h>
    int tokens = 0;
%}

%%

(#) {tokens++; fprintf(yyout,"Preprocessor directive: Token: %s\n", yytext);}

(include) {tokens++; fprintf(yyout,"Preprocessor directive: Token: %s\n", yytext);}

(stdio.h) {tokens++; fprintf(yyout,"header file keyword: Token: %s\n", yytext);}

(int) {tokens++; fprintf(yyout,"datatype keyword: Token: %s\n", yytext);}

(void) {tokens++; fprintf(yyout,"return keyword: Token: %s\n", yytext);}

(printf) {tokens++; fprintf(yyout,"IO keyword: Token: %s\n", yytext);}

(main) {tokens++; fprintf(yyout,"main keyword: Token: %s\n", yytext);}

(\".*\") {tokens++; fprintf(yyout,"string literal keyword: Token: %s\n", yytext);}

[a-zA-Z]* {tokens++; fprintf(yyout,"indentifier Token: %s\n", yytext);}

[0-9]* {tokens++; fprintf(yyout,"number Token: %s\n", yytext);}

[\=] {tokens++; fprintf(yyout,"Assignment operator: Token: %s\n", yytext);}

[<>] {tokens++; fprintf(yyout,"Comparison operator: Token: %s\n", yytext);}

[\,\%\.\;] {tokens++; fprintf(yyout,"Special symbol: Token: %s\n", yytext);}

[\{\}\(\)] {tokens++; fprintf(yyout,"Brackets: Token: %s\n", yytext);}

%%

main(){
    extern FILE *yyin, *yyout;
    
    yyin = fopen("program1.txt", "r");
    yyout = fopen("token1.txt", "w");

    yylex();

    fprintf(yyout,"Tokens: %d", tokens);

    return 0;
}