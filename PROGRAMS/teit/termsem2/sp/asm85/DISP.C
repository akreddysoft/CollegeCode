#include "types.h"

int disp(int argc,char **argv)
{
	FILE *mot1;
	struct mot temp;
	if(argc==1)
	{
		printf("Give the filename as the argument\n");
		return EXIT_SUCCESS;
	}

	mot1=fopen(*(argv+1),"rb");
	if(mot1==NULL)
	{
		printf("\nCannot open file");
		return EXIT_FAILURE;
	}
	
	fflush(stdout);

	printf("\t\t\t\tOPCODES\n");
	printf("\nOpcode\t\tMenmonic\t\top1\t\top2\tLength\tType\n");
	while(fread(&temp,sizeof(temp),1,mot1))
	{
		printf("%s\t\t",temp.opcode);

		printf("%s\t\t",temp.mnem);
		printf("%s\t\t",temp.op1);
		printf("%s\t\t",temp.op2);
		printf("%d\t",temp.length);
		printf("%d\n",temp.type);

	}
	fclose(mot1);
	return EXIT_SUCCESS;
}
