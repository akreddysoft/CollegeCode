//ASSIGNMENT NO 7
int fact(int);
void main()
{
 int n,r,ncr,npr;
 clrscr();
 printf("Enter the value of n:\n");
 scanf("%d",&n);
 printf("Enter the value of r:\n");
 scanf("%d",&r);
 npr=fact(n)/fact(n-r);
 ncr=fact(n)/(fact(r)*fact(n-r));
 printf("Permuation:%d\n",npr);
 printf("Combination:%d\n",ncr);
 getch();
}
int fact(int n)
{
 int fact=1;
 while(n>1)
 {
	fact=fact*n;
	n--;
 }
 return(fact);
}

/*OUTPUT
Enter the value of n:
5
Enter the value of r:
2
Permuation:20
Combination:10
*/
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
