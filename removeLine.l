%{
    #define yywrap() 1
    #include<stdio.h>
    #include<string.h>
%}

%%
^a+.*[a ]+$ {
    fprintf(yyout, yytext); 
}

[ \n]+ {fprintf(yyout, "\n");}

.* {
    printf("invalid string %s: ", yytext);
}

%%

main(){
    extern FILE *yyin, *yyout;

    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    
    yylex();

    return 0;
}