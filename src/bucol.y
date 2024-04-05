%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1
void yyerror(const char *s);
extern int yylex(void);
extern int yydebug;
%}

%union {
    int num;
    float fnum;
    char* str;
}

%token <str> STRING IDENTIFIER S S_FLOAT
%token START END MAIN MOVE ADD INPUT PRINT TO
%token <num> INTEGER
%token <fnum> FLOAT
%token DOT SEMICOLON

%start program

%%

program:
    START DOT declarations MAIN DOT statements END DOT
    ;

declarations:
    /* Empty */
    | declarations declaration
    ;

declaration:
    S IDENTIFIER DOT
    | S_FLOAT IDENTIFIER DOT
    ;

statements:
    /* Empty */
    | statements statement
    ;

statement:
    assignment_statement
    | input_statement
    | output_statement
    ;

assignment_statement:
    MOVE value TO IDENTIFIER DOT
    | ADD value TO IDENTIFIER DOT
    ;

value:
    INTEGER
    | FLOAT
    | IDENTIFIER
    ;

input_statement:
    INPUT identifiers DOT
    ;

identifiers:
    IDENTIFIER
    | identifiers SEMICOLON IDENTIFIER
    ;

output_statement:
    PRINT outputs DOT
    ;

outputs:
    STRING
    | IDENTIFIER
    | outputs SEMICOLON STRING
    | outputs SEMICOLON IDENTIFIER
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int main(void) {
    yydebug = 1;
    if (yyparse() == 0) {
        printf("Program is syntactically correct.\n");
    } else {
        printf("Program has syntax errors.\n");
    }
    return 0;
}
