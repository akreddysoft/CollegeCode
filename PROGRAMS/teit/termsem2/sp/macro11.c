//PROGRAM FOR A 2 PASS MACRO PROCESSOR
#include<stdlib.h>
#include<stdio.h>
#include<string.h>

int process();
int expand();
int define();
struct DEFTAB
{
	char line[80];
}deftab[200];

struct NAMTAB
{
	char name[10];
	int index;
}namtab[200];

char ala[80][80];
int defi=0,nami=0;

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

	process(filename);
	return EXIT_SUCCESS;

}

int process(const char *filename)
{
	FILE *fp=fopen(filename,"r");
	FILE *fw=fopen("output.txt","w");
	FILE *fi=fopen("inter.txt","w");

	char buffer[255],*fields[10];
	int ret,i;

	for(i=0;i<10;++i)
		*(fields+i)=malloc(100);

	if(fp==NULL || fw==NULL)
	{
		fprintf(stderr,"\nCannot open file");
		exit(EXIT_FAILURE);
	}

	while(1)	//pass1
	{
		int retval;
		fgets(buffer,80,fp);

		retval=strcmp(buffer,"\n");
		if(retval==0)	continue;

		sscanf(buffer,"%s %s %s",fields[0],fields[1],fields[2]);
		ret=strcmp(fields[0],"END");
		if(ret==0)
		{
			fprintf(fi,"%s\n",buffer);
			break;
		}

		ret=strcmp(fields[1],"MACRO");
		if(ret==0)
		{
			define(fp,buffer);
			continue;
		}
		fprintf(fi,"%s\n",buffer);		//file without definitions
	}
	fclose(fi);
	fclose(fp);

	fi=fopen("inter.txt","r");
	while(1)           //pass2
	{

		int i;
a:
		fgets(buffer,80,fi);
		i=strcmp(buffer,"\n");
		if(i==0) continue;

		sscanf(buffer,"%s %s %s",fields[0],fields[1],fields[2]);

		for(i=0;i<=nami;++i)
		{
			ret=strcmp(fields[0],namtab[i].name);
			if(ret==0)
			{
				expand(buffer,fw,namtab[i].index);
				goto a;
			}
		}

		ret=strcmp(fields[0],"END");
		if(ret==0)
			break;

		fprintf(fw,"%s\n",buffer);

	}
	for(i=0;i<10;++i)
		free(*(fields+i));

	fclose(fi);
	fclose(fw);
	return 1;

}


int define(FILE *fp,const char * nameline)
{

	char buffer[80], *fields[10];
	int i,ret;
	for(i=0;i<10;++i)
		*(fields+i)=malloc(100);

	strcpy(deftab[defi].line,nameline);
	namtab[nami].index=defi;

	sscanf(nameline,"%s %s %s ,%s ,%s",fields[0],fields[1],fields[2],fields[3],fields[4]);
	strcpy(namtab[nami].name,fields[0]);
	nami++;
	defi++;

	for(i=0;i<3;++i)
		strcpy(ala[i],fields[i+2]);		//set up arguments

	while(1)
	{
		char *fields[10],*args[10];
		int ret1,j=0,i=0;
		for(i=0;i<10;++i)
		{
			fields[i]=malloc(100);
			args[i]=malloc(100);
		}

		fgets(buffer,80,fp);
		sscanf(buffer,"%s %s",fields[0],fields[1]);
		ret1=strcmp(fields[0],"MEND");
		if(ret1==0)
		{
			strcpy(deftab[defi++].line,buffer);
			break;
		}
		while(j<3)
		{
			ret=strcmp(fields[1],ala[j]);
			if(ret==0)
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
			j++;
		}

		strcpy(deftab[defi++].line,buffer);
		for(i=0;i<10;++i)
		{
			free(fields[i]);
			free(args[i]);

		}
	}
	for(i=0;i<10;++i)
		free(fields[i]);
	return 1;
}


int expand(const char *line,FILE *fw,int namindex)
{
	char *fields[10],buffer[80],*args[10], *ar[]={"#1","#2","#3","#4"};
	int i;
	for(i=0;i<10;++i)
	{
		fields[i]=malloc(100);
		args[i]=malloc(100);
	}
	sscanf(line,"%s %s ,%s ,%s",fields[0],fields[1],fields[2],fields[3]);
	args[0]=fields[1]; args[1]=fields[2];args[2]=fields[3];
	namindex++;	//skip nameline
	while(1)
	{
		int ret1;

		for(i=0;i<10;++i)
			fields[i]=malloc(100);

		strcpy(buffer,deftab[namindex].line);
		sscanf(buffer,"%s %s %s",fields[0],fields[1],fields[2]);
		ret1=strcmp(fields[0],"MEND");
		if(ret1==0)
			break;
		for(i=0;i<4;++i)
		{
			int ret=strcmp(fields[1],ar[i]);
			if(ret==0)
			{
				switch(i)
				{
					case 0:
						replace(buffer,ar[i],args[0]);
						break;
					case 1:
						replace(buffer,ar[i],args[1]);
						break;
					case 2:
						replace(buffer,ar[i],args[2]);
						break;
				}
			}
		}


		fprintf(fw,"%s\n",buffer);
		namindex++;
		for(i=0;i<10;++i)
			free(fields[i]);

	}

	for(i=0;i<10;++i)
	{
		free(fields[i]);
		free(args[i]);
	}

	return 1;
}

int replace(char *buff,char *str, char *rep)
{
	char *loc=strstr(buff,str);
	strcpy(loc,rep);
	return 1;
}
