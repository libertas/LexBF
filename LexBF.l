%{
#include <stdio.h>
#define LENGTH 0xffffff
char c_code[LENGTH]="#include <stdio.h>\n#include<stdlib.h>\n#define LENGTH 30000\nint main(){\nchar *tape;\nint pc=0;\ntape=malloc(LENGTH);\nint c;";
FILE *output_file;
%}

%%
\+ strcat(c_code,"tape[pc]++;\n");
\- strcat(c_code,"tape[pc]--;\n");
\> strcat(c_code,"pc++;\n");
\< strcat(c_code,"pc--;\n");
\, strcat(c_code,"c=getchar();if(c>=0)tape[pc]=c;\n");
\. strcat(c_code,"putchar(tape[pc]);\n");
\[ strcat(c_code,"while (tape[pc]){\n");
\] strcat(c_code,"}\n");
.  ;
[\n] ;
%%

int main()
{
	yylex();
	strcat(c_code,"free(tape);\nreturn 0;\n}\n");
	printf("%s\n",c_code);
	return 0;
}

int yywrap()
{
	return 1;
}

