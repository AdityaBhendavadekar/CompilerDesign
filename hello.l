%{ 
    #undef yywrap 
    #define yywrap() 1 
%} 


%% 

%% 


main(){ 

    // yylex();  
    printf("hello world!");

} 