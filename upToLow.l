%{

    #define yywrap() 1
    #include<stdio.h>
    #include<string.h>

%}

%%

\/\*(([ a-zA-Z ]*|\n)*)\*\/ {
    fprintf(yyout, yytext);
}

(\/\/).* {
    fprintf(yyout, yytext);
}

[a-z] {
    fprintf(yyout,"%c", yytext[0]-32);
}


%%

main(){

    extern FILE *yyin, *yyout;

    yyin = fopen("input2.txt", "r");

    yyout = fopen("output2.txt", "w");

    yylex();

    return 0;

}