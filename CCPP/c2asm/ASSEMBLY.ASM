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
	?debug	S "assembly.c"
	?debug	C E9D573772F0A617373656D626C792E63
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
_DATA	segment word public 'DATA'
_d	label	word
	dw	DGROUP:s@
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
   ;	
   ;	{
   ;		char *s="local data";
   ;	
	mov	word ptr [bp-2],offset DGROUP:s@+12
   ;	
   ;		int a=3;
   ;	
	mov	word ptr [bp-4],3
   ;	
   ;		int b=5,c=0;
   ;	
	mov	word ptr [bp-6],5
	mov	word ptr [bp-8],0
   ;	
   ;		c=sum(a,b);  //sum defined in assembly module
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	call	near ptr _sum
	pop	cx
	pop	cx
	mov	word ptr [bp-8],ax
   ;	
   ;		printf("%s\n",s);
   ;	
	push	word ptr [bp-2]
	mov	ax,offset DGROUP:s@+23
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
   ;	
   ;		printf("%s\n",d);
   ;	
	push	word ptr DGROUP:_d
	mov	ax,offset DGROUP:s@+27
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
   ;	
   ;		_asm{
   ;			mov ah,02h
   ;	
	mov	 ah,02h
   ;	
   ;			xor dx,dx
   ;	
	xor	 dx,dx
   ;	
   ;			mov dx,c
   ;	
	mov	 dx,[bp-8]
   ;	
   ;			add dl,30h	
   ;	
	add	 dl,30h	
   ;	
   ;			int 21h
   ;	
	int	 21h
   ;	
   ;			
   ;			mov ax,4c00h
   ;	
	mov	 ax,4c00h
   ;	
   ;	// this means 21 decimal		int 21
   ;			int 21h
   ;	
	int	 21h
   ;	
   ;			}
   ;			
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'global data'
	db	0
	db	'local data'
	db	0
	db	'%s'
	db	10
	db	0
	db	'%s'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_main
	extrn	_printf:near
	public	_d
	extrn	_sum:near
_s@	equ	s@
	end
