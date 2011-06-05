void insert (struct queue *,int);
int remove(struct queue*);
int display(struct queue);
struct queue
{
	int items[5];
	int front,rear;
};
void main()
{
	int ch,n;
	struct queue q;
	q.front=-1;
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
	if(q->rear==4)
		printf("\n full");
	else
		q->items[++q->rear]=n;
		if(q->front==-1)
			q->front++;
}

int remove(struct queue *q)
{
	int temp;
	if(q->rear<q->front)
	{
		printf("\nempty");
		q->front=-1;
		q->rear=-1;
	}
	else
	{
		temp=q->items[q->front];
		q->front++;
		return temp;
	}
}

int display(struct queue q)
{
	int i;
	if(q.rear==-1)
	{
		printf("\nq empty");
		return ;
	}
	printf("\nThe q is:");
	for(i=q.front;i<=q.rear;++i)
		printf("%d ",q.items[i]);
}