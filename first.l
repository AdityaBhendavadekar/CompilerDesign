%{
    #undef yywrap
    #define yywrap() 1
%}

%%

^a+(a|b)*a$ {
    printf("%s starts and ends with a with zero or more number of a's or b's\n", yytext); 
}

^(a|b)+$ {
    printf("String of a and b");
}

(a|b)*a(a|b){2}$ {
    printf("third last character is a");
}  

a*ba*ba*b$ {
    printf("third last character is a");
} 

aditya$ {
    printf("string aditya");
}

%%

main(){
    yylex(); 
}