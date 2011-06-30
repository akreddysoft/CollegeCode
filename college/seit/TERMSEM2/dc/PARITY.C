/* PROGRAM FOR PARITY 
 MADHUR AHUJA
 ROLL NO 22
*/
#include<stdio.h>
void main()
{
char m[8],e[8],o[8];
int c=0,i;
clrscr();
printf("enter the message (only 0 and 1 are acceptable) :");
while(c<7)
{
 do
 {
  fflush(stdin);
  m[c]=getch();
 }
 while(m[c]!='0'&&m[c]!='1');
 printf("%c",m[c]);
 e[c]=m[c];
 o[c]=m[c];
 c++;
}
c=0;
for(i=0;i<7;i++)
if(m[i]=='1')
c++;
if(c%2)
{
e[7]='1';
o[7]='0';
}
else
{
e[7]='0';
o[7]='1';
}
printf("\n\nthe signal for even parity is :");
for(i=0;i<8;i++)
printf("%c",e[i]);
printf("\n\nthe signal for odd parity is :");
for(i=0;i<8;i++)
printf("%c",o[c]);
getch();
}

/*OUTPUT:
enter the message (only 0 and 1 are acceptable) :1000011
the signal for even parity is :10000111
the signal for odd parity is  :10000110
*/