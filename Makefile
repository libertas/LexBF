CC=cc
CFLAGS=-O2

all:lexbf LexBF.c awib

awib:lexbf awib.b
	./lexbf <awib.b >awib.c
	$(CC) awib.c -o awib $(CFLAGS)

lexbf:LexBF.c
	$(CC) LexBF.c -o lexbf $(CFLAGS)

LexBF.c:LexBF.l
	lex -o LexBF.c LexBF.l


install:lexbf
	sudo cp ./lexbf /usr/local/bin/lexbf
	sudo ln -s /usr/local/bin/lexbf /usr/local/bin/bf
	
	sudo cp ./awib /usr/local/bin/awib

remove:/usr/local/bin/lexbf
	sudo rm /usr/local/bin/lexbf /usr/local/bin/bf

clean:
	rm awib awib.c lexbf LexBF.c
