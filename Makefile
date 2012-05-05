CC=gcc
INSTALL=/usr/local/bin/LexBF
LINK=/usr/local/bin/bf

all:LexBF LexBF.c awib

awib:LexBF awib.b
	./LexBF <awib.b >awib.c
	$(CC) awib.c -o awib -O2

LexBF:LexBF.c
	$(CC) LexBF.c -o LexBF -O2

LexBF.c:LexBF.l
	lex -o LexBF.c LexBF.l


install:LexBF
	sudo cp ./LexBF $(INSTALL);ln -s $(INSTALL) $(LINK)

remove:$(INSTALL)
	sudo rm $(INSTALL) $(LINK)

clean:
	rm awib awib.c LexBF LexBF.c
