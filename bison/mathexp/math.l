%{
    #include "math.tab.h"
%}

%%

"r"   {return ANS;}
"="     {return EQUALS;}
"x"    {return NUM1;}
"y"    {return NUM2;}
"z"    {return NUM3;}
"+"     {return ADDITION;}
"*"     {return MULTI;}
[0-9]*   {return NUMBER;}

[ \t\n\r]+         {  }
.                  { printf("error: %s\n", yytext); return 0; }

%%

int yywrap(void)
{
    return 1;
}