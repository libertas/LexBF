LexBF:lex.yy.c
	cc lex.yy.c -o LexBF -O3

lex.yy.c:LexBF.l
	lex LexBF.l
