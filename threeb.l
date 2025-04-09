%{
    #undef yywrap
    #define yywrap() 1
%}

%%

(aa|bb|((ab|ba)(aa|bb)*(ab|ba)))* {
    printf("String contains even number of a's and b's");

}

^([^aeiou]*aeiou[^aeiou]*(aeiou)*)$ {
    printf("contains vowel-> %s\n", yytext);
}

.* {
    printf("Invalid-> %s\n", yytext);
}

%%

main(){
    yylex();
}