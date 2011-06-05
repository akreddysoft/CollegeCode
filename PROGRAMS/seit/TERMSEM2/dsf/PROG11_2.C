/* CREATION OF HASH TABLE WITHOUT REPLACEMENT
		WITH CHAINING*/
 int hash(int n)
 {
 int sum =0;
	while(n)
	   { sum = sum + n%10;
	 n= n/10;
	   }
	if(sum >=10)
	   return(hash(sum));
 return(sum);
 }

 main( )
 {
  int tab[10],chn[10],i,j,n,no,p,k,flag,m;
		/***TO INTIALISE THE HASH TABLE & LINKS ***/
	for(i=0;i<10;i++)
	{   tab[i] = -1;
		chn[i] = -1;
	}
	do{
	  printf("\n\nPlease give the value to enter in the table ...\n");
	 scanf("%d",&no);
	 printf("%d\n",no);
	 j=hash(no);
	  k=j;
	 m=-1;
	 flag=1;
	 do
	 {
	   printf("The position under consideration is %d\n",k);
		 printf("------------------------------------------\n");
		 if( tab[k] == -1 )
		   {
		   printf("The value can be entered in the table at position %d\n",k);
		 tab[k] = no;
		 if(m != -1)   /*** SET THE CHAIN ***/
				  chn[m] =k;
		 flag =0;
		   }
		 else	     {
				printf("The required position is full , next empty position ");
			   if(hash(tab[k])==j)
				m=k;
			   printf(" %d\n",(k+1)%10);
					  }
		k = (k+1)%10;
	 }while(flag && j!=k);
	if(flag)
		 {
			printf("The table is full\n\n");
		   break;
		 }
	printf("\nAny more numbers ? y/ n ");
	}while(getch() == 'y');
	printf("\nThe generated hash table without replaement with chain is ...\n");
	printf("     Position  Value     Next \n");
  printf("------------------------------------\n");
	for(i=0;i<10;i++)
	printf("\t%d\t%d\t%d\n",i,tab[i],chn[i]);
  printf("------------------------------------\n");
 }