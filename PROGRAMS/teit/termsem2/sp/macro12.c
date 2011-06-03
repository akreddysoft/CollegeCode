#include<stdio.h>
#include<stdlib.h>
#include<string.h>
struct DEFTAB
{
	char line[80];
}deftab[200];

struct NAMTAB
{
	char name[20];
	int index;
}namtab[200];
int defi=0,nami=0;
int main(int argc,char **argv)
{
	char filename[255];
	if(argc==1)
		strcpy(filename,"macro.txt");
	else
		strcpy(filename,argv[1]);
		
	process(filename);
	return EXIT_SUCCESS;
}


int process(const char *file)
{
	FILE *fl=fopen(file,"r");
	FILE *fi=fopen("inter.txt","w");
	FILE *fw=fopen("output.txt","w");
	
	char buffer[80];
	char fields1[20],fields2[20],fields3[20],fields4[20];
	if(fl==NULL)
	{
		fprintf(stderr,"\ncannot open file\n");
		return EXIT_FAILURE;
	}
	
	while(1)	//pass1
	{
		int i;
		fgets(buffer,80,fl);
		i=strcmp(buffer,"\n");
		if(i==0)	continue;
		sscanf(buffer,"%s %s %s",fields1,fields2,fields3);
		i=strcmp(fields2,"MACRO");
		if(i==0)
		{
			define(fl,buffer);
			continue;
		}
		i=strcmp(fields1,"END");
		if(i==0)
		{
			fprintf(fi,"%s\n",buffer);
			break;
		}
		
		fprintf(fi,"%s\n",buffer);
		
	}
	fclose(fl);
	fclose(fi);
	
	fl=fopen("inter.txt","r");
	
	while(1)		//pass2
	{
		int ret,i;
a:
		fgets(buffer,80,fl);
		sscanf(buffer,"%s %s %s",fields1,fields2,fields3);
		i=strcmp(fields1,"END");
		if(i==0)
			break;
			
		for(i=0;i<nami;++i)
		{
			ret=strcmp(fields1,namtab[i].name);
			if(ret==0)
			{
//				expand(fw,buffer,namtab[i].index);
				goto a;
			}
			
		}
		
		fprintf(fw,"%s\n",buffer);
	}
	
	fclose(fw);
	fclose(fl);
			
	return 1;
}

	
int define(FILE *fl,char *line)
{
	char fields1[20],fields2[20],fields3[20],fields4[20],fields5[20];
	char ala[20][80];
	int i;
	char buffer[80];

	strcpy(deftab[defi].line,line);
	defi++;
	sscanf(line,"%s %s %s ,%s ,%s",fields1,fields2,fields3,fields4,fields5);
	strcpy(ala[0],fields3);
	strcpy(ala[1],fields4);
	strcpy(ala[2],fields5);
	
	strcpy(namtab[nami].name,fields1);
	
	namtab[nami].index=defi;
	nami++;
	
	while(1)
	{
		int ret,j=0;
		fgets(buffer,80,fl);
		sscanf(buffer,"%s %s %s",fields1,fields2,fields3);
		ret=strcmp(fields1,"MEND");
		if(ret==0)
		{
			strcpy(deftab[defi++].line,buffer);
			break;
		}

		while(j<3)
		{
			i=strcmp(ala[j],fields2);
			if(i==0)
			{
				switch(j)
				{
					case 0:
						replace(buffer,ala[j],"#1");
						break;

					case 1:
						replace(buffer,ala[j],"#2");
						break;

					case 2:
						replace(buffer,ala[j],"#3");
						break;
				}
			}
			++j;
			
		}
		strcpy(deftab[defi++].line,buffer);
		
	}
	return 1;
	
}

int replace(char *buff,char *str, char *rep)
{
	char *loc=strstr(buff,str);
	strcpy(loc,rep);
	return 1;
}
	
	
int expand(FILE *fw,char *line,int index)
{
	
	char buffer[80];
	char fields1[20],fields[2],fields[3],fields[4];
	char *ar[]={"#1","#2","#3"};
	
	strcpy(buffer,deftab[index].line);	//this is the nameline
	index++;
	
	
	while(1)
	{
		int i;
		strcpy(buffer,deftab[index].line);
		i=strcmp(buffer,"MEND");
		if(i==0)
			break;
			
		
		sscanf(buffer,"%s %s %s ,%s ,%s",fields1,fields2,fields3);
		
		
		
		
		
	