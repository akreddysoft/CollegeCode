//PROGRAM FOR A 1 PASS MACRO PROCESSOR
//MADHUR AHUJA
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int define();
int expand();
int getline();
int processline();
int getnamtabindex();
int replace();

struct NAMTAB
{
	char name[10];
	short int pos1;
	short int pos2;
}namtab[100];

struct DEFTAB
{
	char mac[50];
}deftab[100];

struct ARGTAB
{
	char arg1[10];
	char arg2[10];
	char arg3[10];
}argtab[100];

int nami=0;
int defi=0;
int exp1=0;
int argi=0;

int main(int argc, char **argv)
{
	char filename[255],*ret,buffer[100];
	FILE * fd,*fw;

	if(argc==1)
	{
		printf("\nGive the filename as the argument");
		return EXIT_SUCCESS;
	}
	else
		strcpy(filename,argv[1]);


	fd=fopen(filename,"r");
	fw=fopen("output.txt","w");

	if (fd==NULL || fw ==NULL)
	{
		fprintf(stderr,"\nCannot Create files");
		exit(EXIT_FAILURE);
	}

	while(1)
	{
		fgets(buffer,80,fd);
		ret=strstr(buffer,"END");
		if(ret!=NULL)
			break;
		processline(buffer,fd,fw);
	}
	fclose(fd);
	fclose(fw);
	return EXIT_SUCCESS;

}


int processline(const char *line,FILE *fd,FILE *fw)
{
	int ret,i;
	char *fields[10];
	for(i=0;i<10;++i)
		*(fields+i)=malloc(100);

	split(line,fields,' ');

	//if it is a macro call then expand
	for(i=0;i<nami;++i)
	{
		ret=strcmp(namtab[i].name,fields[0]);
		if(ret==0)
		{
			expand(line,fw);
			return 1;
		}

	}

	//if it is a macro definiton than , define it
	ret=strcmp(fields[1],"MACRO");
	if(ret==0)
	{
		define(line,fields[0],fd);
		return 1;
	}

	//else write in into the output file

	fprintf(fw,line);
	fprintf(fw,"\n");

	for(i=0;i<10;++i)
		free(*(fields+i));
	return 1;

}


int define(const char *nameline,char *macname,FILE *fd)
{
	int level=1,pntr1,pntr2,i;
	char buff[255];
	char *fields[10],*args[10];
	char temp[100];
	for(i=0;i<10;++i)
	{
	   *(fields+i)=malloc(100);
	   *(args+i)=malloc(100);
	}

	//put macro name into namtab, and macro line into deftab
	strcpy(namtab[nami].name,macname);
	strcpy(deftab[defi++].mac,nameline);

	split(nameline,fields,' ');
	strcpy(temp,fields[2]);
	split(temp,fields,',');


	pntr1=defi;
	while(level>0)
	{
		char * ret;
		int i;

		fgets(buff,80,fd);
		split(buff,args,' ');

		i=0;
		while(fields[i])
		{
			int ret=strcmp(fields[i],args[1]);
			if(ret==0)
			{
				if(i==0)
					replace(buff,args[1],"#1");
				else if (i==1)
					replace(buff,args[1],"#2");
				else if(i==2)
					replace(buff,args[1],"#3");
				else
					replace(buff,args[1],"#4");
			}
			++i;

		}


		strcpy(deftab[defi++].mac,buff);

		ret=strstr(buff,"MACRO");
		if(ret!=0)	level++;

		ret=strstr(buff,"MEND");
		if(ret!=0)	level--;

	}
	pntr2=defi;

	namtab[nami].pos1=pntr1;
	namtab[nami].pos2=pntr2;

	nami++;
	for(i=0;i<10;++i)
	{
		free(*(fields+i));
		free(*(args+i));
	}
	return 1;

}

int replace(char *buff,char *str, char *rep)
{
	char *loc=strstr(buff,str);
	strcpy(loc,rep);
	return 1;
}


int expand(char * line,FILE *fw)
{

	int i,startindex,endindex;
	char *args[10],*args1[10];

	for(i=0;i<10;++i)
	{
		*(args+i)=malloc(100);
		*(args1+i)=malloc(100);
	}

	exp1=1;
	split(line,args,' ');
	startindex=getnamtabindex(args[0],1);
	endindex=getnamtabindex(args[0],0);

	split(args[1],args1,',');

	strcpy(argtab[argi].arg1,args1[0]);
	strcpy(argtab[argi].arg2,args1[1]);
	strcpy(argtab[argi].arg3,args1[2]);

	fprintf(fw,";");
	fprintf(fw,line);
	fprintf(fw,"\n");

	for(i=startindex;i<endindex-1;++i)
	{
		char *arg[]={"#1","#2","#3","#4"};
		char temp[100];
		int j;
		strcpy(temp,deftab[i].mac);
		for(j=0;j<4;++j)
		{
			char* ret=strstr(temp,arg[j]);
			if(ret!=0)
				replace(temp,arg[j],args1[j]);
		}


		fprintf(fw,temp);
		fprintf(fw,"\n");
	}

	for(i=0;i<10;++i)
	{
		free(*(args+i));
		free(*(args1+i));
	}
	argi++;

	return 1;
}




//if flag=1, then starting pos in deftab is returned otherwise ending pos is returned
int getnamtabindex(const char * macroname, int flag)
{
	int i,ret;

	for(i=0;i<nami;++i)
	{
		ret=strcmp(namtab[i].name,macroname);
		if(ret==0)
		{
			if(flag)
				return namtab[i].pos1;
			else
				return namtab[i].pos2;
		}
	}
	return -1;
}

//split the line by space into fields
int split(char * buffer, char *args[], char delimit)
{
	int		j=0;
	int		k=0;
	int pass=0;
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

	return 1;
}
