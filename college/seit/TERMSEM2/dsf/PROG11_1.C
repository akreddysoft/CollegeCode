/* PROGRAM 11.01 : CREATION OF HASH TABLE */
 int hash(int n)
 {
  int sum =0;
	while(n)
	   {
	   sum = sum + n%10;
	 n= n/10;
	   }
	if(sum >=10)
	   return(hash(sum));
 return(sum);
 }

main()
 {   int tab[10],i,j,n,no,p,k,flag;
 /***TO INTIALISE THE HASH TABLE ***/

	for(i=0;i<10;i++)
	   tab[i] = -1;

 /*** WHILE PREPARING THE HASH TABLE WE SHOULD NECESSARILY KNOW  THE SIZE OF THE TABLE ***/
 /*** WE WILL HAVE A FUNCTION WHICH WILL FIND THE POISTION OF THE GIVEN ELEMENT IN THE ARRAY DEPENDING UPON ITS VALUE.SUCH A FUNCTION IS KNOWN AS HASHING FUNCTION***/
 /*** HERE THE HASHING FUNCTION WILL CONSIDER THE SUM OF THE DIGITS OF GIVEN NUMBER AND TREAT IT AS THE HASH VALUE.IT IS VERY NECESSARY THAT THIS VALUE SHOULD BE A SINGLE DIGIT ***/
	do
	  {
	  printf("\n\nPlease give the value to enter in the table ...\n");
	 scanf("%d",&no);
	 j=hash(no);
	 k=j;
/* THIS IS THE CALL FOR THE HASH FUNCTION WHICH RETURNS THE POSITION */
	flag=1;
	do
	  {
		 printf("The position under consideration is %d\n",k);
		 printf("------------------------------------------\n");
		 if(tab[k] == -1 )
		   {
		   printf("The value can be entered in the table at position %d\n",k);
		 tab[k] = no;
		 flag =0;
		   }
		 else
		  {
		  printf("The value can not be entered in the table at the given 					position\n");
		printf("By linear probing  find the next successive empty 					position\n");
		printf("Try position %d\n\n",(k+1)%10);
		  }
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
