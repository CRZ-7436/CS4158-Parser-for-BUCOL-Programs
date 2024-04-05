# BUCOL Language Parser

## Prerequisites
- Flex (The Fast Lexical Analyzer)
- Bison (GNU Parser Generator)
- GCC (GNU Compiler Collection) or any compatible C/C++ compiler

My code has been tested on Linux but should work on any Unix-like system. Compatibility with Windows will probably require additional tools like Cygwin or MinGW.

## Compiling the Parser
To compile the parser youll need to cd into the src folder, then you need to generate the lexer and parser code using Flex and Bison, and then compile these into an executable using GCC. Run the following commands in the terminal:

```bash
flex -o lex.yy.c bucol.l
bison -d -o bucol.tab.c bucol.y
gcc -o bucolParser lex.yy.c bucol.tab.c -lfl

./bucolParser < your_bucol_program.bucol    *if using your own program file

./bucolParser < test.bucol                  *if you want to use my program file
