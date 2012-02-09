#! /bin/sh

make
echo "make done."

./LexBF <./test/awib.b >./test/awib.c
./LexBF <./test/hello.b >./test/hello.c
echo "LexBF done."

cc ./test/hello.c -o ./test/hello
cc ./test/awib.c -o ./test/awib
echo "cc done."

./test/hello
./test/awib <./test/awib.b >./test/awib.c
echo "The test done."

rm ./test/awib ./test/hello ./test/awib.c ./test/hello.c
rm lex.yy.c LexBF
echo "All done."
