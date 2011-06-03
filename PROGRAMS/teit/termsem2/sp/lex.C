#include<stdio.h>
#include<stdlib.h>
struct TT
{
	int index;
	char symbol[20];
	int break1;
}tt[100];

struct UST
{
	char type[20];
	int index;
	char token[20];
}ust[100];

struct IDT
{
	char name[20];
}idt[100];

struct LT
{
	char literal[10];
	int base;
	int prec;
}lt[100];

int count,uindex,index,lindex;
int main(int argc,char **argv)
{
	char filename[255];

	if(argc==1)
	{
		printf("\nGive the filename as argument");
		return EXIT_SUCCESS;
	}
	else
		strcpy(filename,argv[1]);

	count=gettable("table.txt");
	process(filename);

	return EXIT_SUCCESS;

}

int gettable(char *file)
{
	FILE *fp=fopen(file,"rt");
	int i=0,k;
	char buffer[80];

	if(fp==NULL)
	{
		fprintf(stderr,"\nCannot open file");
		return EXIT_FAILURE;
	}

	while(fgets(buffer,80,fp))
	{
		sscanf(buffer,"%d %s %d",&tt[i].index,tt[i].symbol,&tt[i].break1);
		k=strcmp(tt[i].symbol,"?");
		if(k==0)
			strcpy(tt[i].symbol," ");
		i++;
	}

	fclose(fp);
	return i;
}



int process(const char *filename)
{

	char symbol[100],ch;
	FILE *fp=fopen(filename,"r");
	FILE *fw=fopen("lexout.txt","w");
	int i=0,ret;
	if(fp==NULL)
	{
		fprintf(stderr,"\nCannot open file");
		return EXIT_FAILURE;
	}

	while(1)
	{
		int n,flag=0,bindex;
		char ch;
		symbol[i]=fgetc(fp);
		if(symbol[i]==EOF)
			break;
		ch=symbol[i];
		if(symbol[i]=='\n')	continue;

		ret=isbreak(symbol[i],i);		//character identified as break character
		bindex=ret; //save for later
		if(ret)
		{
			ret=match(symbol,i);		//symbol matched with terminal
			if(ret>0&&ret<100)
			{
				strcpy(ust[uindex].token,symbol);
				strcpy(ust[uindex].type,"TERMINAL");
				ust[uindex].index=ret;
				uindex++;

			}
			else if(ret==0)		//either literal or identifer,not break
			{
				//sscanf(symbol,"%d",n);
				n=atoi(symbol);

				if(n>0)
				{
					strcpy(lt[lindex].literal,symbol);
					lindex++;
				}
				else         //identifier entry goes both into ust and idt
				{
					int ret=checkdup(symbol);
					if(ret==1)
					{
						strcpy(ust[uindex].type,"IDENTIFIER");
						ust[uindex].index=index+1;
						strcpy(ust[uindex].token,symbol);

						strcpy(idt[index].name,symbol);
						index++;
						uindex++;
					}
				}
			}
			//since break character was found, insert the break character in ust also
			//break character saved in ch

			if(ch!=' ') //avoid repetition of spaces
			{
				strcpy(ust[uindex].type,"TERMINAL");
				ust[uindex].index=bindex;
				ust[uindex].token[0]=ch;
				ust[uindex].token[1]=0;
				uindex++;
			}

			flag=1;
			i=0;

		}
		if(!flag)
			i++;
	}

	fprintf(fw,"\n\n\n\t\tTERMINAL TABLE\n\n\n");
	for(i=0;i<count;++i)
	   fprintf(fw,"%d\t%s\t%d\n",tt[i].index,tt[i].symbol,tt[i].break1);
	fprintf(fw,"\n\n\n\t\tUNIFORM SYMBOL TABLE\n\n\n");
	for(i=0;i<uindex;++i)
	   fprintf(fw,"%d\t%s\t%s\n",ust[i].index,ust[i].token,ust[i].type);
	fprintf(fw,"\n\n\n\t\tIDENTIFIER TABLE\n\n\n");
	for(i=0;i<index;++i)
	   fprintf(fw,"%d\t%s\n",i+1,idt[i].name);
	fprintf(fw,"\n\n\n\t\tLITERAL TABLE\n\n\n");
	for(i=0;i<lindex;++i)
	   fprintf(fw,"%d\t%s\n",i+1,lt[i].literal);

	fclose(fw);

	return 1;
}

int checkdup(char *sym)
{
	int i,j;
	for(i=0;i<index;++i)
	{
		j=strcmp(idt[i].name,sym);
		if(j==0)
			return 0;

	}
	return 1;
}
	

int isbreak(char symbol,int i)
{

	for(i=0;i<count;++i)
		if(tt[i].break1==1&&symbol==tt[i].symbol[0])
			return i+1;
	return 0;
}


int match(char *symbol,int i)
{
	int j;
	if(i==0)
	symbol[++i]=0;
	else
	symbol[i]=0;
	for(i=0;i<count;++i)
	{

		j=strcmp(tt[i].symbol,symbol);
		if(j==0)		//we do not match the break char here
		{
			if(tt[i].break1==1)
				return 999;
			else
							//bcoz they will be inserted automatically later
				return i+1;
		}

	}

	return 0;
}
