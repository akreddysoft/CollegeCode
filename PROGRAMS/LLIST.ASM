	ifndef	??version
?debug	macro
	endm
$comm	macro	name,dist,size,count
	comm	dist name:BYTE:count*size
	endm
	else
$comm	macro	name,dist,size,count
	comm	dist name[size]:BYTE:count
	endm
	endif
	?debug	S "llist.c"
	?debug	C E9E10C6E2F076C6C6973742E63
	?debug	C E900187F1815453A5C54435C494E434C5544455C737464696F2E68
	?debug	C E900187F1815453A5C54435C494E434C5544455C5F646566732E68
	?debug	C E900187F1815453A5C54435C494E434C5544455C5F6E756C6C2E68
_TEXT	segment byte public 'CODE'
_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void AddNode(List *L, String item)
   ;	
	assume	cs:_TEXT
_AddNode	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{ 
   ;	ListNode *currNode, *newNode; 
   ;	currNode = L->Head; 
   ;	
	mov	di,word ptr [si]
   ;	
   ;	if (L->Head == NULL) 
   ;	
	cmp	word ptr [si],0
	jne	short @1@86
   ;	
   ;	{ 
   ;	L->Head = (ListNode*)malloc(sizeof(ListNode)); 
   ;	
	mov	ax,6
	push	ax
	call	near ptr _malloc
	pop	cx
	mov	word ptr [si],ax
   ;	
   ;	L->Head->Data = item; 
   ;	
	mov	bx,word ptr [si]
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	mov	word ptr [bx+2],ax
	mov	word ptr [bx],dx
   ;	
   ;	L->Head->Link = NULL; 
   ;	
	mov	bx,word ptr [si]
	mov	word ptr [bx+4],0
   ;	
   ;	} 
   ;	
	jmp	short @1@198
@1@86:
	jmp	short @1@142
@1@114:
   ;	
   ;	else 
   ;	{ 
   ;	while(currNode->Link != NULL) 
   ;	currNode = currNode->Link; //go to the last 
   ;	
	mov	di,word ptr [di+4]
@1@142:
	cmp	word ptr [di+4],0
	jne	short @1@114
   ;	
   ;	newNode = (ListNode*)malloc(sizeof(ListNode)); 
   ;	
	mov	ax,6
	push	ax
	call	near ptr _malloc
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;	newNode->Data = item; 
   ;	
	mov	bx,word ptr [bp-2]
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	mov	word ptr [bx+2],ax
	mov	word ptr [bx],dx
   ;	
   ;	newNode->Link = NULL; 
   ;	
	mov	bx,word ptr [bp-2]
	mov	word ptr [bx+4],0
   ;	
   ;	currNode->Link = newNode; 
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [di+4],ax
@1@198:
   ;	
   ;	}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_AddNode	endp
   ;	
   ;	void DeleteNode(List *L, String item)
   ;	
	assume	cs:_TEXT
_DeleteNode	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{ 
   ;	ListNode *currNode, *prevNode; 
   ;	currNode = L->Head;
   ;	
	mov	si,word ptr [di]
   ;	
   ;	prevNode = L->Head; 
   ;	
	mov	ax,word ptr [di]
	mov	word ptr [bp-2],ax
   ;	
   ;	if (L->Head == NULL)
   ;	
	cmp	word ptr [di],0
	jne	short @2@86
   ;	
   ;	{ 
   ;	printf("empty list"); 
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	pop	cx
@2@86:
	jmp	short @2@394
@2@114:
   ;	
   ;	} 
   ;	while(currNode != NULL) //check if first 
   ;	{ 
   ;	if(strcmp(currNode->Data.str,item.str)==0) //found 
   ;	
	push	word ptr [bp+6]
	push	word ptr [si]
	call	near ptr _strcmp
	pop	cx
	pop	cx
	or	ax,ax
	jne	short @2@366
   ;	
   ;	{
   ;	if(currNode == L->Head) //first one
   ;	
	cmp	word ptr [di],si
	jne	short @2@282
   ;	
   ;	{
   ;	L->Head == currNode->Link;
   ;	
	mov	ax,word ptr [di]
	cmp	ax,word ptr [si+4]
	jne	short @2@226
	mov	ax,1
	jmp	short @2@254
@2@226:
	xor	ax,ax
@2@254:
   ;	
   ;	currNode->Link = NULL;
   ;	
	mov	word ptr [si+4],0
   ;	
   ;	free(currNode);
   ;	
	push	si
	call	near ptr _free
	pop	cx
   ;	
   ;	printf("Remove First");
   ;	
	mov	ax,offset DGROUP:s@+11
	jmp	short @2@310
@2@282:
   ;	
   ;	}
   ;	else
   ;	{ 
   ;	prevNode->Link = currNode->Link; 
   ;	
	mov	ax,word ptr [si+4]
	mov	bx,word ptr [bp-2]
	mov	word ptr [bx+4],ax
   ;	
   ;	currNode->Link = NULL;
   ;	
	mov	word ptr [si+4],0
   ;	
   ;	free(currNode); 
   ;	
	push	si
	call	near ptr _free
	pop	cx
   ;	
   ;	printf("removed ");
   ;	
	mov	ax,offset DGROUP:s@+24
@2@310:
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	} 
   ;	}
   ;	
	jmp	short @2@394
@2@366:
   ;	
   ;	else
   ;	{
   ;	prevNode = currNode;
   ;	
	mov	word ptr [bp-2],si
   ;	
   ;	currNode = currNode->Link;  //go to next one 
   ;	
	mov	si,word ptr [si+4]
@2@394:
	or	si,si
	jne	short @2@114
   ;	
   ;	}
   ;	}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DeleteNode	endp
   ;	
   ;	int main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,108
	push	si
	push	di
   ;	
   ;	{ 
   ;	FILE *fp = NULL; 
   ;	
	xor	si,si
   ;	
   ;	List list; 
   ;	String string; 
   ;	int i; 
   ;	int records = 0; 
   ;	
	mov	word ptr [bp-8],0
   ;	
   ;	char filename[100];
   ;	//list.Head = (ListNode*)malloc(sizeof(ListNode)); 
   ;	list.Head = NULL; 
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;	string.str = (char *)malloc(sizeof(char) *20); 
   ;	
	mov	ax,20
	push	ax
	call	near ptr _malloc
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;	printf("Enter filename\n"); 
   ;	
	mov	ax,offset DGROUP:s@+33
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	scanf("%s", filename); 
   ;	
	lea	ax,word ptr [bp-108]
	push	ax
	mov	ax,offset DGROUP:s@+49
	push	ax
	call	near ptr _scanf
	pop	cx
	pop	cx
   ;	
   ;	fp = fopen(filename, "r"); 
   ;	
	mov	ax,offset DGROUP:s@+52
	push	ax
	lea	ax,word ptr [bp-108]
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	
   ;	if (fp == NULL) 
   ;	
	or	si,si
	jne	short @3@86
   ;	
   ;	{ printf ("Error\n"); 
   ;	
	mov	ax,offset DGROUP:s@+54
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	exit(0); 
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _exit
	pop	cx
   ;	
   ;	}
   ;	
	jmp	short @3@226
@3@86:
   ;	
   ;	else 
   ;	{
   ;	fscanf(fp, "%d", &records);
   ;	
	lea	ax,word ptr [bp-8]
	push	ax
	mov	ax,offset DGROUP:s@+61
	push	ax
	push	si
	call	near ptr _fscanf
	add	sp,6
   ;	
   ;	for (i = 0; i<records; i++) 
   ;	
	xor	di,di
	jmp	short @3@170
@3@114:
   ;	
   ;	{
   ;	fscanf(fp, "%s", string.str);
   ;	
	push	word ptr [bp-6]
	mov	ax,offset DGROUP:s@+64
	push	ax
	push	si
	call	near ptr _fscanf
	add	sp,6
   ;	
   ;	AddNode(&list, string);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr _AddNode
	add	sp,6
   ;	
   ;	printf("%s  ", string.str);
   ;	
	push	word ptr [bp-6]
	mov	ax,offset DGROUP:s@+67
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
	inc	di
@3@170:
	cmp	di,word ptr [bp-8]
	jl	short @3@114
   ;	
   ;	}
   ;	printf("\n\nEnter a Node to delete: ");
   ;	
	mov	ax,offset DGROUP:s@+72
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	scanf("%s", string.str);
   ;	
	push	word ptr [bp-6]
	mov	ax,offset DGROUP:s@+99
	push	ax
	call	near ptr _scanf
	pop	cx
	pop	cx
   ;	
   ;	DeleteNode(&list, string);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr _DeleteNode
	add	sp,6
@3@226:
   ;	
   ;	}
   ;	return 1;
   ;	
	mov	ax,1
	jmp	short @3@254
@3@254:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'empty list'
	db	0
	db	'Remove First'
	db	0
	db	'removed '
	db	0
	db	'Enter filename'
	db	10
	db	0
	db	'%s'
	db	0
	db	'r'
	db	0
	db	'Error'
	db	10
	db	0
	db	'%d'
	db	0
	db	'%s'
	db	0
	db	'%s  '
	db	0
	db	10
	db	10
	db	'Enter a Node to delete: '
	db	0
	db	'%s'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_exit:near
	public	_main
	extrn	_free:near
	extrn	_strcmp:near
	public	_DeleteNode
	extrn	_malloc:near
	public	_AddNode
	extrn	_scanf:near
	extrn	_printf:near
	extrn	_fscanf:near
	extrn	_fopen:near
_s@	equ	s@
	end
