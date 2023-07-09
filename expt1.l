%{
	#include<stdio.h>
	#include<string.h>
	int flag=0,i=0,j,k=0;
	char o[20][20],opar[20][20];
%}

%%
[0-9]+ {flag++;strcpy(o[i],yytext);i++;}
[+*/-] {flag--;strcpy(opar[k],yytext);k++;}
. ;
%%
int yywrap()
{
	return 1;
}
int main(int argc,char *argv[])
{
	printf("Enter an arithmetic expression : \n");
	yylex();
	if(flag!=1)
		printf("Invalid Expression!!!");
	else
	{
		printf("Valid Expression!!!\n");
		printf("The operands are : ");
		for(j=0;j<i;j++)
			printf("%s ",o[j]);
		printf("\nThe operators are : ");
		for(j=0;j<k;j++)
			printf("%s ",opar[j]);
	printf("\n");
	}
}


