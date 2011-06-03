//PROGRAM FOR A 2 PASS MACRO PROCESSOR
#include<stdlib.h>
#include<stdio.h>
#include<string.h>

int process();
int expand();
int define();
int replace();
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

		buffer[strlen(buffer)-1]=0;
		retval=strcmp(buffer,"");
		if(retval==0)	continue;

		retval=split(buffer,fields,' ');
		ret=strcmp(fields[0],"END");
		if(ret==0&&retval)
		{
			fprintf(fi,"%s\n",buffer);
			break;
		}

		ret=strcmp(fields[1],"MACRO");
		if(ret==0&&retval)
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
a:
		fgets(buffer,80,fi);
		buffer[strlen(buffer)-1]=0;
		split(buffer,fields,' ');

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

	char buffer[80], *fields[10],temp[20];
	int i,ret;
	for(i=0;i<10;++i)
		*(fields+i)=malloc(100);

	strcpy(deftab[defi].line,nameline);
	namtab[nami].index=defi;

	split(nameline,fields,' ');
	strcpy(namtab[nami].name,fields[0]);
	nami++;
	defi++;

	strcpy(temp,fields[2]);
	ret=split(temp,fields,',');
	for(i=0;i<ret;++i)
		strcpy(ala[i],fields[i]);		//set up arguments

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
		buffer[strlen(buffer)-1]=0;
		sscanf(buffer,"%s %s %s",fields[0],fields[1],fields[2]);
		//split(buffer,fields,' ');	//seperate opcode and operands
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
	split(line,fields,' ');
	split(fields[1],args,',');
	namindex++;	//skip nameline
	while(1)
	{
		int ret1;

		for(i=0;i<10;++i)
			fields[i]=malloc(100);

		strcpy(buffer,deftab[namindex].line);
		split(buffer,fields,' ');
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
/*

//split the line by space into fields
int split(char * buffer, char *args[], char delimit)
{
	int		j=0,		k=0, pass=0;
	char *i,str[2];
	str[0]=delimit;
	str[1]=0;
	i=strstr(buffer,str);	//special:if the string doesnt containd delimiter
	if(i==NULL)
	{
		strcpy(args[0],buffer);
		return 1;
	}
	while(buffer[j])
	{
		if(delimit==' ')
			while(buffer[j]==' '||buffer[j]=='\t')
				j++;	//skip leading spaces or tabs
		else
			while(buffer[j]==' '||buffer[j]=='\t'||buffer[j]==delimit)
				j++;

		k=0;
		
		while(buffer[j]!=delimit&&buffer[j]!='\t'&&buffer[j])
			args[pass][k++]=buffer[j++];

		args[pass][k]=0;
		pass++;

	}
	args[pass]=0;
	if(pass==0)
		return 0;

	return pass+1;
}

*/
int replace(char *buff,char *str, char *rep)
{
	char *loc=strstr(buff,str);
	strcpy(loc,rep);
	return 1;
}
