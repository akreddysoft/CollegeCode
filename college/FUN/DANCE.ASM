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
	?debug	S "dance.c"
	?debug	C E9619E5C2D0764616E63652E63
	?debug	C E900187F1816453A5C54435C494E434C5544455C7374646C69622E+
	?debug	C 68
	?debug	C E900187F1815453A5C54435C494E434C5544455C5F646566732E68
	?debug	C E900187F1815453A5C54435C494E434C5544455C5F6E756C6C2E68
	?debug	C E900187F1814453A5C54435C494E434C5544455C74696D652E68
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
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	{
   ;	 char far *s;
   ;	 int i;
   ;	 s=0xB0008000;
   ;	
	mov	word ptr [bp-2],45056
	mov	word ptr [bp-4],32768
@1@58:
   ;	
   ;	 while(1)
   ;	 {
   ;		for(i=0;i<4000;i=i+2)
   ;	
	xor	si,si
	jmp	short @1@282
@1@86:
   ;	
   ;		{
   ;		 if(*(s+i)>='a'&&*(s+i)<='z')
   ;	
	les	bx,dword ptr [bp-4]
	cmp	byte ptr es:[bx+si],97
	jl	short @1@170
	les	bx,dword ptr [bp-4]
	cmp	byte ptr es:[bx+si],122
	jg	short @1@170
   ;	
   ;			*(s+i)=*(s+i)-32;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr es:[bx+si]
	add	al,224
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx+si],al
	jmp	short @1@254
@1@170:
   ;	
   ;		 else
   ;		 {
   ;			if(*(s+i)>='A'&&*(s+i)<='Z')
   ;	
	les	bx,dword ptr [bp-4]
	cmp	byte ptr es:[bx+si],65
	jl	short @1@254
	les	bx,dword ptr [bp-4]
	cmp	byte ptr es:[bx+si],90
	jg	short @1@254
   ;	
   ;			*(s+i)=*(s+i)+32;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr es:[bx+si]
	add	al,32
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx+si],al
@1@254:
	mov	ax,si
	add	ax,2
	mov	si,ax
@1@282:
	cmp	si,4000
	jl	short @1@86
	jmp	short @1@58
   ;	
   ;	
   ;		 }
   ;		}
   ;	 }
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_main
_s@	equ	s@
	end
