/* PROGRAM TO MERGE TWO LIST IN THE FIRST LIST BY INTERLACING
BY HARSHIT RASTOGI
CLASS SE COMP 2(E)
ROLL NO 66  */


#include<stdio.h>
#include<alloc.h>
#include<conio.h>
struct node
{
int data;
struct node *link;
};
int  size=sizeof(struct node),cnt;
char ch;
void main()
{
struct node *first=NULL,*temp;
struct node *first1=NULL,*temp1,*temp2,*new1,*last,*last1;
clrscr();
insert(&first);
insert(&first1);
display(first);
display(first1);
merge(first,first1);
sort(first,first1);
}
 insert(struct node **first)                          //INSERT
{
 struct node *temp,*temp1,*last;
 int n;
 temp=*first;
printf("\n Enter The Data Of  List \n");
do
{
printf("\n enter the data");
scanf("%d",&n);
if(temp==NULL)
{
temp=malloc(size);
temp->data=n;
temp->link=NULL;
last=temp;
}
else
{
  temp1=malloc(size);
  temp1->data=n;
  temp1->link=NULL;
  last->link=temp1;
  last=temp1;
  }
  printf("\n Do You Want To Continue Press Y or N ");
  scanf(" %c",&ch);
} while(ch=='y'||ch=='Y');
getch();
*first=temp;
return 0;

}

display(struct node *first)                         //DISPLAY
{
struct node *temp;
clrscr();
  temp=first;
  printf("\n List After The Entering Data   \n");
  while(temp!=NULL)
  {
	  printf("%d  ",temp->data);
	  temp=temp->link;
   }
   getch();
   return 0;
}

 merge(struct node *first,struct node *first1)     // MERGING
 {
	struct node *temp,*temp1,*temp2,*new1;
	temp=first;
	temp1=first1;
 while(temp!=NULL&&temp1!=NULL)
 {

 temp2=temp->link;
 new1=temp1;
 temp->link=new1;
 temp1=temp1->link;
 new1->link=temp2;
 temp=temp2;
 }
 temp=first;
  while(temp->link!=NULL)
  temp=temp->link;

 if(temp1!=NULL)
 while(temp1!=NULL)
 {
	temp->link=temp1;
	temp=temp1;
	temp->link=NULL;
	temp1=temp1->link;
 }
 temp->link=NULL;
 cnt=0;
 printf("\n Data After Merging Is \n");
 temp=first;
 while(temp!=NULL)
 {         cnt++;
	printf("%d ",temp->data);
	temp=temp->link;
 }
 getch();
 return 0;
 }



 sort(struct  node *first)
 {	  int i,j;                                     //SORTING
	struct node *new1,*temp,*temp1;
	new1=malloc(size); ;
	temp=first;
 for(i=0;i<cnt-1;i++)
 {
	temp=first;
	temp1=temp->link;
 for(j=1;j<cnt-i;j++)
 {
 if(temp->data>temp1->data)
 {
	 new1->data=temp->data;
	 temp->data=temp1->data;
	 temp1->data=new1->data;
 }
 temp=temp->link;
 temp1=temp1->link;
 }
 }
  temp=first;
  printf("\n the sorted list is \n");
 while(temp!=NULL)
 {
	printf("%d ",temp->data);
	 temp=temp->link;
 }

 getch();
 return 0;

 }





/* Enter The Data Of  List

enter the data3

 Do You Want To Continue Press Y or N y

 enter the data2

 Do You Want To Continue Press Y or N y

 enter the data8

 Do You Want To Continue Press Y or N y

 enter the data1

 Do You Want To Continue Press Y or N n





 Enter The Data Of  List

 enter the data9

 Do You Want To Continue Press Y or N y

 enter the data4

 Do You Want To Continue Press Y or N y

 enter the data6

 Do You Want To Continue Press Y or N n




 List After The Entering Data
3  2  8  1



 List After The Entering Data
9  4  6

 Data After Merging Is

3 9 8 4 2 6 1

 The Sorted List Is
1 2 3 4 6 8 9











                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                



















                                                                                
                                                                                
*/





