CC=cc

all:lexbf LexBF.c awib

awib:LexBF awib.b
	./lexbf <awib.b >awib.c
	$(CC) awib.c -o awib -O2

lexbf:LexBF.c
	$(CC) LexBF.c -o lexbf -O2

LexBF.c:LexBF.l
	lex -o LexBF.c LexBF.l


install:LexBF
	sudo cp ./lexbf /usr/local/bin/lexbf
	sudo ln -s /usr/local/bin/lexbf /usr/local/bin/bf
	
	sudo cp ./awib /usr/local/bin/awib

remove:/usr/local/bin/lexbf
	sudo rm /usr/local/bin/lexbf /usr/local/bin/bf

clean:
	rm awib awib.c lexbf LexBF.c
