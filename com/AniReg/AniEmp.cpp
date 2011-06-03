// AniEmp.cpp : Implementation of CAniEmp
#include "stdafx.h"
#include "AniReg.h"
#include "AniEmp.h"
#include "AniReg.h"
#include<iostream.h>
#include "AniEmp.h"
#include "stdlib.h"

/////////////////////////////////////////////////////////////////////////////
// CAniEmp

HRESULT STDMETHODCALLTYPE CAniEmp::Add_Emp(int no,BSTR emp,int sl) {
	char res[45];
	char tmp[10];

	FILE *df=fopen("C:\\madhur.txt","a");
	if(df==0)
		return S_OK;
	fprintf(df,"%d %s %d\n",no,emp,sl);
	fclose(df);
	
return S_OK;		
}

HRESULT STDMETHODCALLTYPE CAniEmp::Func1() {
char str[20];
strcpy(str,"");
char res[45];
strcpy(res,"");
for(int start_list=0;start_list<count;itoa(sal[start_list],str,10),strcat(res,records[start_list]),strcat(res," Salary:"),strcat(res,str),start_list++) {
cout<<res;
}
return S_OK;	
}
//search for employee then delete
HRESULT STDMETHODCALLTYPE CAniEmp::Del_Emp(int emp) {

	int no,sl;
	char emp1[50];
	FILE *df=fopen("C:\\madhur.txt","r");
		FILE *df1=fopen("C:\\madhur1.txt","w");

	if(df==0)
		return S_OK;
	int i=0;
	while(df)
	{
		int k=fscanf(df,"%d %s %d\n",&no,emp1,&sl);
		if(k==EOF)
			break;
		if(no==emp)
			; 
		else
			fprintf(df1,"%d %s %d\n",no,emp1,sl);
	i++;
	}
	fclose(df);
	fclose(df1);
	system("del c:\\madhur.txt");
	system("ren c:\\madhur1.txt madhur.txt");




return S_OK;
}



HRESULT STDMETHODCALLTYPE CAniEmp::Search_Emp(int cc) {
	char str[20];
	char res[45];
	int no,sl;
	char emp[50];

	FILE *df=fopen("C:\\madhur.txt","r");
	FILE *df1=fopen("C:\\result.txt","w");
	
	if(df==0)
		return S_OK;
	int i=0;
	while(df)
	{
		int k=fscanf(df,"%d %s %d\n",&no,emp,&sl);
		if(k==EOF)
			break;
		if(no==cc)
		{	
			fprintf(df1,"%d %s %d\n",no,emp,sl);
		}
		i++;
	}
	fclose(df);
	fclose(df1);



return S_OK;
}

HRESULT STDMETHODCALLTYPE CAniEmp::Sort() {
	
	struct emp
	{
		int no;
		char emp1[50];
		int sal;

	};

	emp employ[100];
	FILE *df=fopen("C:\\madhur.txt","r");
	FILE *df1=fopen("C:\\madhur1.txt","w");
	
	if(df==0)
		return S_OK;
	int i=0;
	int n=0;
	while(df)
	{
		int k=fscanf(df,"%d %s %d\n",&employ[i].no,employ[i].emp1,&employ[i].sal);
		if(k==EOF)
			break;
		i++;
		n++;
	}
	fclose(df);
//int n=3;	

i=0; 
int l=0,j,flag=0;
 emp temp;
 while(i<n-1&&!flag)
 {
	flag=1;
	i++;
	for(j=1;j<n-i-1;++j)
	{
	 if(employ[i].sal>employ[i+1].sal)
	 {
		temp=employ[i];
		employ[i]=employ[i+1];
		employ[i+1]=temp;
		
		flag=0;
	 }
	
	}
 }

	i=0;
	while(i!=n)
	{
		fprintf(df1,"%d %s %d\n",employ[i].no,employ[i].emp1,employ[i].sal);
		i++;
	}

	fclose(df1);
	
	system("copy c:\\madhur1.txt c:\\madhur2.txt");
	system("del c:\\madhur.txt");
	system("ren c:\\madhur1.txt madhur.txt");

return S_OK;
}




