%{
#include "bucol.tab.h"
extern void yyerror(const char *s);
extern int yylex(void);
%}

%%

// Lexical rules section

[ \t]+                { /* Ignore whitespace characters such as spaces and tabs */ }
\n                    { /* Ignore newline characters */ }
"START"               { printf("Token: START\n"); return START; }           // Matches the keyword "START" and returns the START token.
"END"                 { printf("Token: END\n"); return END; }               // Matches the keyword "END" and returns the END token.
"MAIN"                { printf("Token: MAIN\n"); return MAIN; }             // Matches the keyword "MAIN" and returns the MAIN token.
"MOVE"                { printf("Token: MOVE\n"); return MOVE; }             // Matches the keyword "MOVE" and returns the MOVE token.
"ADD"                 { printf("Token: ADD\n"); return ADD; }               // Matches the keyword "ADD" and returns the ADD token.
"INPUT"               { printf("Token: INPUT\n"); return INPUT; }           // Matches the keyword "INPUT" and returns the INPUT token.
"PRINT"               { printf("Token: PRINT\n"); return PRINT; }           // Matches the keyword "PRINT" and returns the PRINT token.
"TO"                  { printf("Token: TO\n"); return TO; }                 // Matches the keyword "TO" and returns the TO token.
[Ss]+                 { printf("Token: S\n"); return S; }                   // Matches one or more 'S's, representing integer variable size.
[Ss]+[.][Ss]+         { printf("Token: S_FLOAT\n"); return S_FLOAT; }       // Matches float variable size declaration, like "SS.S".
\"[^"]*\"             { yylval.str = strdup(yytext); printf("Token: STRING (%s)\n", yytext); return STRING; }               // Matches a string enclosed in quotes.
[+-]?[0-9]+           { yylval.num = atoi(yytext); printf("Token: INTEGER (%s)\n", yytext); return INTEGER; }               // Matches an integer value.
[+-]?[0-9]+"."[0-9]+  { yylval.fnum = atof(yytext); printf("Token: FLOAT (%s)\n", yytext); return FLOAT; }                  // Matches a floating-point number.
[-]?[A-Za-z][-A-Za-z0-9]* { yylval.str = strdup(yytext); printf("Token: IDENTIFIER (%s)\n", yytext); return IDENTIFIER; }   // Matches an identifier.
[.]                   { printf("Token: DOT\n"); return DOT; }                   // Matches a period, used to end statements.
[;]                   { printf("Token: SEMICOLON\n"); return SEMICOLON; }       // Matches a semicolon, used to separate elements in a PRINT or INPUT statement.

%%

int yywrap() {
    return 1;
}
