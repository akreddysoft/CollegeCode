//args is a array of pointers to strings,
//the function expects a memory area to fill in the fields
//the memory can be allocated as
/*char *aa[10];  //number of fields
  for(i=0;i<10;++i)
	*(aa+i)=malloc(100);	//100 is length of string allocated for each memory area
*/

//this would fill in the aa with addresses of memory locations containing
//100 bytes free, example

// let aa address is 0000:1000
/*
0000:1000 	0020	xxxx	xxxx	xxxx	xxxx	xxxx	xxxx	xxxx
			xxxx	xxxx

after the filling is finished the function sets the last address with the
	null 0000 address. this can be used to iterate over the strings

note that if the split function is called again , none of the 10 address
contains a null address, previously filled,
thus it is better to free the previous addresses and again call malloc
before calling the split function again

*/


int split1(char * buffer, char *args[], char delimit)
{
	int		j=0;
	int		k=0;
	int pass=0;
	while(buffer[j])
	{
		if(delimit==' ')
		{
			while(buffer[j]==' '||buffer[j]=='\t')
				j++;	//skip leading spaces or tabs
		}
		else
		{
			while(buffer[j]==' '||buffer[j]=='\t'||buffer[j]==delimit)
				j++;
		}


		k=0;

		while(buffer[j]!=delimit&&buffer[j]!='\t'&&buffer[j])
			args[pass][k++]=buffer[j++];

		args[pass][k]=0;
		pass++;

	}
	args[pass]=0;

	return 1;
}


int getlinetext(char buffer[50],FILE *fl)
{

	int i=0;
	while(fread(buffer+i,1,1,fl))
	{
		if(buffer[i]=='\n')
			break;
		++i;
	}
	buffer[i]=0;
	return 0;
}

int getlines(char *filename)
{
	FILE *fl;
	char buffer[1000];
	int i=0,lines=0;
	fl=fopen(filename,"r");
	while(fread(buffer+i,1,1,fl))
	{
		if(buffer[i]=='\n')
			lines++;
		++i;
	}
	fclose(fl);
	return lines;
}

int replace(char *buff,char *str, char *rep)
{
	char *loc=strstr(buff,str);
	strcpy(loc,rep);
	return 1;
}
