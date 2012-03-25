awib:LexBF,awib.b
	./LexBF <awib.b >awib.c
	cc awib.c -o awib -O2

LexBF:lex.yy.c
	cc lex.yy.c -o LexBF -O3

lex.yy.c:LexBF.l
	lex LexBF.l
