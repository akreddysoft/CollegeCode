                            
#include <stdio.h>
typedef struct
{
char *str;  //str is a dynamic array of characters
int length;  //number of characters
} String;

typedef struct node 
{ 
String Data;
struct node* Link;
} ListNode;

typedef struct listStuct 
{ 
ListNode *Head;
}List;

void AddNode(List *L, String item)
{ 
ListNode *currNode, *newNode; 
currNode = L->Head; 
if (L->Head == NULL) 
{ 
L->Head = (ListNode*)malloc(sizeof(ListNode)); 
L->Head->Data = item; 
L->Head->Link = NULL; 
} 
else 
{ 
while(currNode->Link != NULL) 
currNode = currNode->Link; //go to the last 
newNode = (ListNode*)malloc(sizeof(ListNode)); 
newNode->Data = item; 
newNode->Link = NULL; 
currNode->Link = newNode; 
}
}

void DeleteNode(List *L, String item)
{ 
ListNode *currNode, *prevNode; 
currNode = L->Head;
prevNode = L->Head; 
if (L->Head == NULL)
{ 
printf("empty list"); 
} 
while(currNode != NULL) //check if first 
{ 
if(strcmp(currNode->Data.str,item.str)==0) //found 
{
if(currNode == L->Head) //first one
{
L->Head == currNode->Link;
currNode->Link = NULL;
free(currNode);
printf("Remove First");
}
else
{ 
prevNode->Link = currNode->Link; 
currNode->Link = NULL;
free(currNode); 
printf("removed ");
} 
}
else
{
prevNode = currNode;
currNode = currNode->Link;  //go to next one 
}
}
}


int main()
{ 
FILE *fp = NULL; 
List list; 
String string; 
int i; 
int records = 0; 
char filename[100];
//list.Head = (ListNode*)malloc(sizeof(ListNode)); 
list.Head = NULL; 
string.str = (char *)malloc(sizeof(char) *20); 
printf("Enter filename\n"); 
scanf("%s", filename); 
fp = fopen(filename, "r"); 

if (fp == NULL) 
{ printf ("Error\n"); 
exit(0); 
}
else 
{
fscanf(fp, "%d", &records);
for (i = 0; i<records; i++) 
{
fscanf(fp, "%s", string.str);
AddNode(&list, string);
printf("%s  ", string.str);
}
printf("\n\nEnter a Node to delete: ");
scanf("%s", string.str);
DeleteNode(&list, string);
}
return 1;
}