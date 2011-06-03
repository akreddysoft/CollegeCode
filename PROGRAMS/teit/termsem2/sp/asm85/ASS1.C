
#include "types.h"


int input(int argc,char **argv)
{
	struct mot temp;
	FILE *mot1;
	if(argc==1)
	{
		printf("Give the filename as the argument\n");
		return EXIT_SUCCESS;
	}
   	mot1=fopen(*(argv+1),"a+");
	if(mot1==NULL)
	{
		printf("\nCannot open file");
		return EXIT_FAILURE;
	}

	do
	{
		fflush(stdin);
		printf("\nEnter opcode:");
		gets(temp.opcode);
		strupr(temp.opcode);
		fflush(stdin);
		printf("\nEnter mnemonic:");
		gets(temp.mnem);
		printf("\nEnter operand1:");
		gets(temp.op1);
		printf("\nEnter operand2:");
		gets(temp.op2);
		
		printf("Enter length:");
		scanf("%hd",&temp.length);
		printf("\nEnter type:");
		scanf("%hd",&temp.type);
		fflush(stdin);

		fwrite(&temp,sizeof(temp),1,mot1);
		printf("\nEnter more:");
	}
	while(getch()==13);
	fclose(mot1);
	return EXIT_SUCCESS;
}
