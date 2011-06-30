#include "types.h"

//extern char  filename[100];

extern char filename[255];
extern int symindex;
extern char oper1[100][100],oper2[100][100],lbl[100][100];
extern char opc[100][100];
extern int motcount;
extern char machine[100][10];
extern char *regs[];

extern struct mot mottable[500];
extern struct ST sym[100];

int writeinter();

int pass1()
{
	motcount=getmottable(&mottable,"mot.dat");
	symtable(filename);
	return 0;
}

int getmottable(struct mot *mottable,const char *file)
{
	FILE *df=fopen(file,"r");
	int i=0;
	if(df==NULL)
	{
		fprintf(stderr,"Cannot open mot file\n");
		exit(EXIT_FAILURE);
	}

	while(fread(mottable+i,sizeof(*mottable),1,df))
		++i;
	fclose(df);
	return i;
}


int symtable(char *file)
{
	int l=0,k,lc=0,i;
	FILE *fl;
	char buffer[50],*fields[10];

	fl=fopen(file,"r");

	if(fl==NULL)
	{
		fprintf(stderr,"\nCannot open file");
		exit(EXIT_FAILURE);
	}

	while(1)
	{
		int motindex,labelflag=0;
		char lcval[10],*ret,temp[50];

		for(i=0;i<10;++i)
			*(fields+i)=calloc(100,1);

		//getlinetext(buffer,fl);
		fgets(buffer,80,fl);
		buffer[strlen(buffer)-1]=0;
		k=strcmp(buffer,"END");
		if(k==0) break;
		k=strcmp(buffer,"");

		if(k==0)
		{
			l++;
			continue;//continue if empty line
		}

		split1(buffer,fields,' ');
		ret=strstr(fields[0],":");
		if(ret!=0)  //if there is a label
		{
			int m=strlen(fields[0]);
			strcpy(lbl[l],fields[0]);
			strcpy(opc[l],fields[1]);

			itoa(lc,lcval,10);
			strcpy(sym[symindex].name,lbl[l]);
			sym[symindex].value=lc;
			strcpy(sym[symindex].val,lcval);
			sym[symindex].length=1;
			symindex++;
			labelflag=1;
		}
		else
			strcpy(opc[l],fields[0]);

		if(fields[labelflag+1])	//case when opcode has no operand
		{
		strcpy(temp,fields[labelflag+1]);
			split1(temp,fields,',');

		if(fields[0]!=NULL)
			strcpy(oper1[l],fields[0]);
		if(fields[1]!=NULL)
			strcpy(oper2[l],fields[1]);
		}
		//get motindex in order to increment lc
		motindex=getmotindex(opc[l],oper1[l],oper2[l]);
		lc=lc+mottable[motindex].length;
		//////////////////////////////
		++l;

		for(i=0;i<10;++i)
			free(*(fields+i));
	}

	fclose(fl);
	return 0;
}



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
