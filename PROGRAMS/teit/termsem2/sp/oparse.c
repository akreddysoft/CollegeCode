//PROGRAM FOR OPERATOR PRECEDENCE PARSING
//MADHUR AHUJA
#include<stdio.h>
#include<string.h>
#include<stdlib.h>

int oparse();
int getindex();


		      //===============   =============   =============   =============   =============
      char mat[22][22]={'=' , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'<', 0 ,

			0   ,'=', 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'<','<','<', 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'<', 0 ,

			0   , 0 ,'=','=', 0 ,'<','<','<', 0 , 0 ,'<', 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'<', 0 ,

			0   , 0 ,'>','>', 0 , 0 , 0 , 0 , 0 , 0 ,'>', 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,


			0   ,'>', 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'>', 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,

			0   , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'=', 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'<', 0 ,

			0   , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'=', 0 , 0 , 0 ,
		    
		    	0   , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'=', 0 , 0 , 0 ,
		    
		    
		    	0   , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'>', 0 , 0 , 0 , 0 ,'<','<','<','<','<', 0 ,'<','<',
		    
		    	0   ,'<','>','>', 0 ,'<','<','<', 0 , 0 ,'>', 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'<', 0 ,
		    
		    	0   ,'>','>','>', 0 ,'<','<','<', 0 , 0 ,'>','<','<', 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'<', 0 ,
		    
		    	0   ,'>', 0 , 0 ,'<', 0 , 0 , 0 , 0 , 0 ,'>', 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,
		    
		    
		    	0   , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'=', 0 ,
		    
			0   , 0 ,'>','>', 0 , 0 , 0 , 0 ,'=', 0 ,'>', 0 , 0 , 0 ,'<','<','<','<','<', 0 ,'<','<',
		    
		    	0   , 0 ,'>','>', 0 , 0 , 0 , 0 ,'>','>','>', 0 , 0 , 0 ,'>','>','<','<','<','>','<','<',

		    	0   , 0 ,'>','>', 0 , 0 , 0 , 0 ,'>','>','>', 0 , 0 , 0 ,'>','>','<','<','<','>','<','<',
		    
		    
		    	0   , 0 ,'>','>', 0 , 0 , 0 , 0 ,'>','>','>', 0 , 0 , 0 ,'>','>','>','>','<','>','<','<',
		    
			0   , 0 ,'>','>', 0 , 0 , 0 , 0 ,'>','>','>', 0 , 0 , 0 ,'>','>','>','>','<','>','<','<',
		    
		    	0   , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,'<', 0 ,'<','<','<','<','<','=','<','<',
		    
		    	0   , 0 ,'>','>', 0 , 0 , 0 , 0 ,'>','>','>', 0 , 0 , 0 ,'>','>','>','>', 0 ,'>', 0 , 0 ,

		    
			'>' , 0 ,'>','>', 0 , 0 , 0 , 0 ,'>','>','>','>','>','=','>','>','>','>', 0 ,'>', 0 , 0 ,
		    
		    	0   , 0 ,'>','>', 0 , 0 , 0 , 0 ,'>','>','>', 0 , 0 , 0 ,'>','>','>','>', 0 ,'>', 0 , 0};
		    


char *tok[]={"VAR","BEGIN","END","END.","INTEGER","FOR","READ","WRITE","TO","DO",";",":",",","=","+","-","*","DIV","(",")","id","int"};

char *lok[]={"PROGRAM","VAR","BEGIN","END","INTEGER","FOR","READ","WRITE","TO","DO",";",":",",","=","+","-","*","DIV","(",")","id","int"};

int main()
{

	char st[100];
	printf("\nEnter the input statement:");
	//gets(st);
	strcpy(st,"id = id DIV int - int * int ;");
	oparse(st);

	return EXIT_SUCCESS;
}


int oparse(char *st)
{
	char *fields[20];
	int arr[20],delindex;
	char arr1[20];
	int i=0,j=0;

	for(i=0;i<20;++i)
		fields[i]=malloc(100);


	split(st,fields,' ');
	i=0;
	j=0;
	while(fields[j])
	{

		while(fields[j])
			arr[i++]=getindex(fields[j++],j);
		arr[i]=-1;

		i=0;
		j=0;
		while(arr[i+1]!=-1)
		{
		   arr1[j++]=mat[arr[i]][arr[i+1]];
		   i=i+1;
		}
		arr1[j]=0;
		for(i=0;i<j;++i)
		{

			if(arr1[i]=='<'&&arr1[i+1]=='>')
			{
				fields[i+1]="N";
				delindex=i+1;
				break;
			}
		}

		i=0;
		while(fields[i])
		{
			printf("%s ",fields[i]);
			i++;
		}
		printf("\n");
		delet(fields,delindex);
		j=0;
		i=0;
	}


	return 1;
}


int delet(char  *fields[20], int index)
{
	int i;
	for(i=index;i<20;++i)
		fields[i]=fields[i+1];
	return 1;
}



int getindex(const char *fld,int pos)
{

	int i;
	int ret;

	for(i=0;i<22;++i)
	{
		if(pos%2!=0)
			ret=strcmp(fld,tok[i]);
		else
			ret=strcmp(fld,lok[i]);
		if(ret==0)
			return i;
	}
	return -1;
}




int split(char * buffer, char *args[], char delimit)
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
