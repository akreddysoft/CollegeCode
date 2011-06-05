/*CREATE A HASH TABLE AND HANDLE THE COLLISION
  USING LINEAR PROBING WITH AND WITHOUT REPLACEMENT

  MADHUR AHUJA
  ROLL NO 22
*/
void main()
{
 int ch;
 clrscr();
 printf("\n1 With replacement");
 printf("\n2 Without replacement");
 printf("\n0 Exit");
 printf("\nEnter choice:");
 scanf("%d",&ch);
 switch(ch)
 {
  case 1:
	wrepl();
	break;
  case 2:
   wnrepl();
   break;
  case 0:
   exit(1);
 }
 getch();
}

 int hash(int n)
 {   int sum =0;
	while(n)
	   { sum = sum + n%10;
	 n= n/10;
	   }
	if(sum >=10)
	   return(hash(sum));
 return(sum);
 }

 wrepl( )
 {   int tab[10],i,j,n,no,p,k,flag,temp;
			 /***TO INTIALISE THE HASH TABLE ***/
	for(i=0;i<10;i++)
		   tab[i] = -1;
	do  {  printf("\n\nPlease give the value to enter in the table ...\n");
	 scanf("%d",&no);
	  j=hash(no);
	  k=j;	flag=1;
	 /*** 	THIS IS THE CALL FOR THE HASH FUNCTION WHICH 			RETURNS THE   	POSITION ***/
	do{     printf("The position under consideration is %d\n",k);
		 printf("------------------------------------------\n");
				if(tab[k] == -1 )
			  {printf("The value can be entered in the table at position %d\n",k);
		  tab[k] = no;
		  flag =0;
			  }
			else
					 {  printf("The value can not be entered in the table at the ");
		printf(" given position\n");
		printf("By linear probing find the next successive ");
		printf(" empty position\n");
		printf("Try position %d\n\n",(k+1)%10);
			 }
		if(flag && tab[k]!=-1)
		{ if(hash(tab[k]) != k)
			{ temp = no;
			  no = tab[k];
			  tab[k] = temp;
			  }
		}
		printf("The hash table is ...\n");
		for(i=0;i<10;i++)
			printf("%d\t",i);
		printf("\n\n");
		for(i=0;i<10;i++)
			 printf("%d\t",tab[i]);
		k = (k+1)%10;
	 }while(flag && j!=k);
	if(flag)
		 printf("The table is full\n\n");
	printf("\nAny more numbers ? y/ n ");
	}while(getch() == 'y');
	printf("The generated hash table is ...\n");
	for(i=0;i<10;i++)
	printf(" Position %d  contains %d\n",i,tab[i]);
	return 0;
 }


  int hash1(int n)
 {   int sum =0;
	while(n)
	   { sum = sum + n%10;
	 n= n/10;
	   }
	if(sum >=10)
	   return(hash1(sum));
 return(sum);
 }

 wnrepl( )
 {   int tab[10],chn[10],i,j,n,no,p,k,flag,m;
		/***TO INTIALISE THE HASH TABLE & LINKS ***/
	for(i=0;i<10;i++)
	{   tab[i] = -1;
		chn[i] = -1;
	}
	do{    printf("\n\nPlease give the value to enter in the table ...\n");
	 scanf("%d",&no);
	 printf("%d\n",no);
	 j=hash1(no);
	  k=j;
	 m=-1;
	 flag=1;
	 do
	 {  printf("The position under consideration is %d\n",k);
		 printf("------------------------------------------\n");
		 if( tab[k] == -1 )
		   { printf("The value can be entered in the table at position %d\n",k);
		 tab[k] = no;
		 if(m != -1)   /*** SET THE CHAIN ***/
				  chn[m] =k;
		 flag =0;
		   }
		 else	     { printf("The required position is full , next empty position ");
			   if(hash1(tab[k])==j)
				m=k;
			   printf(" %d\n",(k+1)%10);
					  }
		k = (k+1)%10;
	 }while(flag && j!=k);
	if(flag)
		 { printf("The table is full\n\n");
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

  /*



