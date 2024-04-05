%{
#include "bucol.tab.h"
%}

%%

[ \t]+                { /* Ignore whitespace */ }
\n                    { /* Ignore newlines */ }
"START"               { return START; }
"END"                 { return END; }
"MAIN"                { return MAIN; }
"MOVE"                { return MOVE; }
"ADD"                 { return ADD; }
"INPUT"               { return INPUT; }
"PRINT"               { return PRINT; }
[S]+                  { return S; }
[S]+[.][S]+           { return S_FLOAT; }
\"[^"]*\"             { yylval.str = strdup(yytext); return STRING; }
[+-]?[0-9]+           { yylval.num = atoi(yytext); return INTEGER; }
[+-]?[0-9]+"."[0-9]+  { yylval.fnum = atof(yytext); return FLOAT; }
[-]?[A-Za-z][-A-Za-z0-9]* { yylval.str = strdup(yytext); return IDENTIFIER; }
[.]                   { return DOT; }
[;]                   { return SEMICOLON; }

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int yywrap() {
    return 1;
}
