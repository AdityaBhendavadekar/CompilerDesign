%{
    // Lex program
    #include "code.tab.h"
%}

%%

"void"             { return RETURNTYPE; }
"main"             { return FUNCTION; }
"("                { return OPENROUND; }
")"                { return CLOSEROUND; }
"int"              { return DATATYPE; }
"{"                { return OPENCURLY; }
"}"                { return CLOSECURLY; }
","                { return COMMA; }
";"                { return SEMICOLON; }
"return"           { return RETURN; }
"0"                { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFIER; }

[ \t\n\r]+         { /* Skip whitespace */ }

.                  { printf("error: %s\n", yytext); return 0; }

%%

int yywrap(void)
{
    return 1;
}
