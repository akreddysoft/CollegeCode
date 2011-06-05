void insert (struct queue *,int);
int remove(struct queue*);
void display(struct queue);
#define MAX 5
struct queue
{
	int items[MAX];
	int front,rear;
};
void main()
{
	int ch,n;
	struct queue q;
	q.front=0;
	q.rear=-1;
	clrscr();
	printf("\n1 insert");
	printf("\n2 remove");
	printf("\n0 exit");
while(1)
{
	printf("\nchoice:");
	scanf("%d",&ch);

	switch(ch)
	{
		case 1:
			printf("\nEnter the element:");
			scanf("%d",&n);
			insert(&q,n);
			display(q);
			break;
		case 2:
			n=remove(&q);
			printf("\nThe remove is:%d",n);
			display(q);
			break;
		case 0:
			exit(0);
	}
}
}

void insert(struct queue *q,int n)
{
	if(q->rear%MAX==MAX-1)
		printf("\n full");
	else
	{
		q->rear=(q->rear+1)%MAX;
		q->items[q->rear]=n;
	}

}

int remove(struct queue *q)
{
	int temp;
	if(q->rear%MAX<q->front)
		printf("\nempty");
	else
	{
		temp=q->items[q->front];
		q->front++;
		if(q->front==q->rear)
		{
			q->front=-1;
			q->rear=-1;
			return 0;
		}
		return temp;
	}
}

void display(struct queue q)
{
	int i;
	printf("\nThe q is:");
	for(i=q.front;i<=q.rear;++i)
		printf("%d ",q.items[i]);
}