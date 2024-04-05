CC = gcc
LEX = flex
YACC = bison
CFLAGS = -Wall -g
LDFLAGS =

SRCDIR = src
OBJDIR = obj
BINDIR = bin

SOURCES = $(wildcard $(SRCDIR)/*.c)
LEX_SOURCE = $(wildcard $(SRCDIR)/*.l)
YACC_SOURCE = $(wildcard $(SRCDIR)/*.y)
LEX_OUTPUT = $(SRCDIR)/lex.yy.c
YACC_OUTPUT = $(SRCDIR)/bucol.tab.c
YACC_HEADER = $(SRCDIR)/bucol.tab.h
OBJECTS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SOURCES))
EXECUTABLE = $(BINDIR)/bucolParser

.PHONY: all clean

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) $(LEX_OUTPUT) $(YACC_OUTPUT)
	@mkdir -p $(BINDIR)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ -lfl

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(LEX_OUTPUT): $(LEX_SOURCE)
	$(LEX) -o $@ $<

$(YACC_OUTPUT): $(YACC_SOURCE)
	$(YACC) -d -o $@ $<

clean:
	rm -rf $(OBJDIR) $(BINDIR) $(LEX_OUTPUT) $(YACC_OUTPUT) $(YACC_HEADER)
