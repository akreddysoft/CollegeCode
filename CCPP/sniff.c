#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
int dispframe();
int main(int argc,char **argv)
{
	
	FILE *fl;
	
	if(argc==1)
	{
		printf("Give the filename as argument\n");
		return EXIT_SUCCESS;
	}
	
	fl=fopen(argv[1],"rb");
	if(fl==NULL)
	{
		fprintf(stderr,"\nCannot Open File:%s",argv[1]);
		return EXIT_FAILURE;
	}
	
	dispframe(fl);
	dispip(fl);
	fclose(fl);
	return EXIT_SUCCESS;

}

int dispip(FILE *fl)
{
	int add,buff;
	int mask=0xf0,i;
	int exlength;
	int hlen;
	
}




int dispframe(FILE *fl)
{
	char dest_add[18],src_add[18];
	int add,i;
	char proto[80][80];
	
	printf("\nContents of Ethernet Frame\n");


	return 0;
}
