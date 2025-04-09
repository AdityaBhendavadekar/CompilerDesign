%{
#include "file.tab.h"
%}

%%

[a-zA-Z][a-zA-Z0-9]*  { yylval.str = strdup(yytext); return ID; }
[0-9]+                { yylval.str = strdup(yytext); return NUM; }
"="                   { return '='; }
"*"                   { return '*'; }
"+"                   { return '+'; }
[ \t\n]               ;  
.                     ;

%%

int yywrap() { return 1; }