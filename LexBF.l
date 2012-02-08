%{
#include <stdio.h>
#define LENGTH 0xffffff
char c_code[LENGTH]="#include <stdio.h>\n#include<stdlib.h>\n#define LENGTH 30000\nint main(){\nchar *tape;\nint pc=0;\ntape=malloc(LENGTH);\n";
FILE *output_file;
%}

%%
\+ strcat(c_code,"tape[pc]++;\n");
\- strcat(c_code,"tape[pc]--;\n");
\> strcat(c_code,"pc++;\n");
\< strcat(c_code,"pc--;\n");
\, strcat(c_code,"tape[pc]=getchar();\n");
\. strcat(c_code,"putchar(tape[pc]);\n");
\[ strcat(c_code,"while (tape[pc]){\n");
\] strcat(c_code,"}\n");
.  ;
%%

int main(int argc,char *argv[])
{
	yylex();
	strcat(c_code,"free(tape);\nreturn 0;\n}\n");
	if (argv[1])
	{
		output_file=fopen(argv[1],"wr");
		fputs(c_code,output_file);
		fclose(output_file);
	}
	printf("%s\n",c_code);
	return 0;
}

int yywrap()
{
	return 1;
}

