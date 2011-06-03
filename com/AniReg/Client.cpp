#include "AniReg.h"
#include <stdio.h>
#include <conio.h>
#include <iostream.h>
int main() 
{

HRESULT hr = CoInitialize(NULL);

if (FAILED(hr)) {
   cout << "CoInitialize Failed: " << hr << "\n\n";
   exit(1);
}
else {
   cout << "CoInitialize succeeded\n";
}

IAniEmp *pi;

   hr = CoCreateInstance(CLSID_AniEmp, NULL, CLSCTX_ALL, 
      IID_IAniEmp,reinterpret_cast<void **>(&pi));   //ianiemp's interface id
   if (FAILED(hr)) {
      cout << "CoCreateInstance Failed: " << hr << "\n\n";
      goto Uninit;
   }
   else {
      cout << "CoCreateInstance succeeded\n";
	  
	 
	int no,salary;
	char name[50];

	  int a;
	  while(1)
	  {
		  int a,c;
		  char b[50];
		  FILE *df;
		  //BSTR bs;
		  cout<<"1 Add\n";
		  cout<<"2 delete\n";
		  cout<<"3 sort\n";
		  cout<<"4 display\n";
		  cout<<"5 search\n";
		  cout<<"6 exit\n";

		  cout<<"Enter choice:";
		  cin>>a;

		  switch(a)
		  {
		  case 1:
			  cout<<"Enter emp no, name and salary";
			  cin>>no>>name>>salary;
			  //bs=SysAllocString(name);
			  pi->Add_Emp(no,BSTR(name),salary); 
				break;

		  case 2:
			  cout<<"Enter emp no.\n";
			  cin>>no;
			  pi->Del_Emp(no);
			  break;

		  case 3:
			  pi->Sort();
			  break;

		  case 4:
			  df=fopen("c:\\madhur.txt","r");
			  if(df==0)
				  break;
				  
			  printf("Employee no\tEmployee\tsalary\n");
			  while(df)
			  {
				  int k=fscanf(df,"%d %s %d\n",&a,b,&c);
				  if(k==EOF)
					  break;
				  
				  printf("%d\t\t%s\t\t%d\t\n",a,b,c);
			  }
			  fclose(df);
			  break;

		  case 5:
			  cout<<"enter employee no:\n";
			  cin>>a;
			  pi->Search_Emp(a);
			  df=fopen("c:\\result.txt","r");
			  printf("Employee no\tEmployee\tsalary\n");
			  while(df)
			  {
				  int k=fscanf(df,"%d %s %d\n",&a,b,&c);
				  if(k==EOF)
					  break;
				  
				  printf("%d\t\t%s\t\t%d\n",a,b,c);
			  }
			  fclose(df);
			  break;

		  
		  case 6:
			  return 0;
		  }
	  }


	  
	  fflush(stdout);
	 // getch();
   } 


Uninit:
   CoUninitialize();
}



