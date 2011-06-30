#include<stdio.h>

int main()
{
	char buff1[80],f1[10],f2[10],f3[10];
	char *buff="1,2,3";
	int a,b,c;
	sscanf(buff,"%d,%d,%d",&a,&b,&c);
	printf("%d %d %d\n",a,b,c);
	
	strcpy(buff1,"mad1,mad2,mad3");
	sscanf(buff1,"%s,%s,%s",f1,f2,f3);
	printf("%s\n %s\n %s\n",f1,f2,f3);	//this doesnt work
	
	strcpy(buff1,"mad1 ,mad2 ,mad3");
	sscanf(buff1,"%s , %s , %s",f1,f2,f3);
	printf("%s %s %s\n",f1,f2,f3);		//this workds
	
	sscanf(buff1,"%s ,%s ,%s",f1,f2,f3);
	printf("%s %s %s\n",f1,f2,f3);		//this words
	
	
	strcpy(buff1,"mad1, mad2, mad3");
	sscanf(buff1,"%s , %s , %s",f1,f2,f3);
	printf("%s %s %s\n",f1,f2,f3);		//this doesnt
	
	sscanf(buff1,"%s, %s, %s",f1,f2,f3);
	printf("%s %s %s\n",f1,f2,f3);		//this doesnt
	
	strcpy(buff1,"mad1 , mad2 , mad3");
	sscanf(buff1,"%s , %s , %s",f1,f2,f3);
	printf("%s %s %s\n",f1,f2,f3);		//this
	
	sscanf(buff1,"%s, %s, %s",f1,f2,f3);
	printf("%s %s %s\n",f1,f2,f3);		//this 
	
	sscanf(buff1,"%s ,%s ,%s",f1,f2,f3);
	printf("%s %s %s\n",f1,f2,f3);		//this 
	return 0;
}