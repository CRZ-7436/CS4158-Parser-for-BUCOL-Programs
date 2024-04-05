%{
#include "bucol.tab.h"
extern void yyerror(const char *s);
extern int yylex(void);
%}

%%

[ \t]+                { /* Ignore whitespace */ }
\n                    { /* Ignore newlines */ }
"START"               { printf("Token: START\n"); return START; }
"END"                 { printf("Token: END\n"); return END; }
"MAIN"                { printf("Token: MAIN\n"); return MAIN; }
"MOVE"                { printf("Token: MOVE\n"); return MOVE; }
"ADD"                 { printf("Token: ADD\n"); return ADD; }
"INPUT"               { printf("Token: INPUT\n"); return INPUT; }
"PRINT"               { printf("Token: PRINT\n"); return PRINT; }
"TO"                  { printf("Token: TO\n"); return TO; }
[Ss]+                 { printf("Token: S\n"); return S; }
[Ss]+[.][Ss]+         { printf("Token: S_FLOAT\n"); return S_FLOAT; }
\"[^"]*\"             { yylval.str = strdup(yytext); printf("Token: STRING (%s)\n", yytext); return STRING; }
[+-]?[0-9]+           { yylval.num = atoi(yytext); printf("Token: INTEGER (%s)\n", yytext); return INTEGER; }
[+-]?[0-9]+"."[0-9]+  { yylval.fnum = atof(yytext); printf("Token: FLOAT (%s)\n", yytext); return FLOAT; }
[-]?[A-Za-z][-A-Za-z0-9]* { yylval.str = strdup(yytext); printf("Token: IDENTIFIER (%s)\n", yytext); return IDENTIFIER; }
[.]                   { printf("Token: DOT\n"); return DOT; }
[;]                   { printf("Token: SEMICOLON\n"); return SEMICOLON; }

%%

int yywrap() {
    return 1;
}
