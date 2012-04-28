CC=gcc


all:LexBF LexBF.c awib

awib:LexBF awib.b
	./LexBF <awib.b >awib.c
	$(CC) awib.c -o awib -O2

LexBF:LexBF.c
	$(CC) LexBF.c -o LexBF -O3

LexBF.c:LexBF.l
	lex -o LexBF.c LexBF.l


clean:
	rm awib awib.c LexBF LexBF.c
