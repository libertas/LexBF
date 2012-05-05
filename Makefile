CC=gcc


all:LexBF LexBF.c awib

awib:LexBF awib.b
	./LexBF <awib.b >awib.c
	$(CC) awib.c -o awib -O2

LexBF:LexBF.c
	$(CC) LexBF.c -o LexBF -O2

LexBF.c:LexBF.l
	lex -o LexBF.c LexBF.l


install:LexBF
	sudo cp ./LexBF /usr/local/bin/LexBF;ln -s /usr/local/bin/LexBF /usr/local/bin/bf

remove:/usr/local/bin/LexBF
	sudo rm /usr/local/bin/LexBF /usr/local/bin/bf

clean:
	rm awib awib.c LexBF LexBF.c
