LexBF:lex.yy.c
	cc lex.yy.c -o LexBF

lex.yy.c:LexBF.l
	lex LexBF.l
