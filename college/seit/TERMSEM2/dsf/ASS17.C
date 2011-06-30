/* CREATION OF HASH TABLE LINEAR PROBING WITH  REPLACEMENT
   AND WITHOUT REPLACEMENT

   MADHUR AHUJA
   ROLL NO 22
*/
 int hash(int n)
 {
   int sum =0;
   clrscr();
	while(n)
       { sum = sum + n%10;
	 n= n/10;
       }
    if(sum >=10)
       return(hash(sum));
 return(sum);
 }

 main()
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
 }

/* OUTPUT

 The position under consideration is 9
------------------------------------------
The value can be entered in the table at position 9
The hash table is ...
0       1       2       3       4       5       6       7       8       9


-1      1       -1      -1      4       5       -1      -1      -1      9

Any more numbers ? y/ n The generated hash table is ...
 Position 0  contains -1
 Position 1  contains 1
 Position 2  contains -1
 Position 3  contains -1
 Position 4  contains 4
 Position 5  contains 5
 Position 6  contains -1
 Position 7  contains -1
 Position 8  contains -1
 Position 9  contains 9
*/




