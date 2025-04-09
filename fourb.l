%{
  #define yywrap() 1
  #include <stdio.h>
  #include <string.h>
  int words =0;
  int chars = 0;
  int lines = 0;
%}

%%

([a-zA-Z0-9 ]) {
    chars++;

    if (yytext[0] == ' ' || yytext[0] == '\t' || yytext[0] == '\n') {
        words++;
    }
}

\n {
    lines++;
}

%%

main(){

    extern FILE *yyin, *yyout;

    yyin = fopen("input.txt", "r");


    yylex();
    printf("No. of chars: %d\n", chars);
    printf("No. of lines: %d\n", lines);
    printf("No. of words: %d\n", words);

    return 0;
}