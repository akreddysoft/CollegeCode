;PROGRAM TO READ THE BOOT RECORD OF A 1.44 MB DISKETTE.
;MADHUR AHUJA
;TE IT
;20
include ..\macro.inc
.model small
;.386
.stack 100h                       
.data
m       db      10,13,"jump to executable code                          :$"
m0      db      10,13,"manufacturer's name                              :$"
m1      db      10,13,"bytes per sector                                 :$"
m2      db      10,13,"sectors per cluster                              :$"
m3      db      10,13,"number of reserved sectors                       :$"
m4      db      10,13,"no. of copies of fat(1 or 2)                     :$"
m5      db      10,13,"no. of root directory entries                    :$"
m6      db      10,13,"total no. of sectors if vol.< 32mb               :$"
m7      db      10,13,"media descriptor byte                            :$"
m8      db      10,13,"no. of sectors per fat                           :$"
m9      db      10,13,"no. of sectors per track                         :$"
m10     db      10,13,"no. of read-write heads                          :$"
m11     db      10,13,"number of hidden sectors(DOS 3.0+)               :$"
m12     db      10,13,"(DOS 4+) number of sectors if offset 13 was 0    :$"
m13     db      10,13,"(DOS 4+) physical drive number                   :$"
m14     db      10,13,"(DOS 4+) reserved                                :$"
m15     db      10,13,"(DOS 4+) signature byte (29h)                    :$"
m16     db      10,13,"(DOS 4+) volume serial number                    :$"
m17     db      10,13,"(DOS 4+) volume label                            :$"
m18     db      10,13,"(DOS 4+) reserved                                :$"

buffer 	db 	512 dup(0)                 ;variable for no. of bytes per sector.
str1	db	30 dup('$')
cnt    	db 	3h
res    	db 	4 dup(0)

errmes  db  	10,13,"Disk not found:insert a diskette......$"
        db  	10,13,"press any key to continue $"
failmes db  	10,13,"boot read failure:exiting$"
urr	db	10,13,"Unknown Error:Exiting$"

cbyte	dw	2
cword	dw	4
cdword	dw	8
offsets db	0,3h,0Bh,0Dh,0Eh,10h,11h,13h,15h,16h,18h,1Ah,1Ch,20h,24h,25h,26h,27h,2bh,36h
lens	db	6,4,2,4,2,4,4,2,4,4,4,4,8,2,2,4
cnt1	db	0
const1	dw	0
const2	dw	0
count	db	8
pcount	db	0
.code
begin:
        mov 	ax,@data             
        mov 	ds,ax               
        mov 	es,ax              
	
start:
        mov 	ah,02h           
        mov 	al,01h              ;no. of sectors to read.
        mov 	ch,00h              ;track number ( beginning from 0 ).
        mov 	cl,01h              ;sector no
        mov 	dh,01h              ;head no. or side no.
        mov 	dl,80h                ;drive number (0 for a:)
        lea 	bx,buffer           ;load offset address of buffer in bx.
        int 	13h                
	jc	herror
	jmp	success
;########################################################################	
herror:	
	cmp	ah,80h
	je	noflopy
	jmp	uerror

noflopy:
        mov	ah,09h
        lea 	dx,errmes           
        int 	21h
                                 
        mov 	ah,01h
        int 	21h
        dec 	cnt
        jnz 	start

        mov 	ah,09h
        lea 	dx,failmes
        int 	21h

        jmp 	quit
uerror:
	lea	dx,urr
	mov	ah,09h
	int	21h
	jmp	quit

;#####################################################################
success:
	lea	di,offsets
	mov	bx,offset m
	mov	cx,offset str1
dispagain:
	xor	ax,ax
	mov	al,byte ptr [di]
        mov 	ah,09h
        mov	dx,bx
        int 	21h
        
        call	getchars
        
        mov	ax,offset [buffer]
        add	al,byte ptr [di]
	
	cmp	byte ptr [di],3			;whether to display manufacture name
        je	manufac
	
	push	const2		;push the count
	push	cx		;push str1
	push	ax		;push the buffer location
	call	buf2hex

	push	const1
	push	cx
	call	dispchar
	
contin:
	inc	di
	add	bx,35h			;point to next message
	cmp	byte ptr [di],36h		;whether last offset reached
        jne	dispagain
        jmp	quit

manufac:
        push	const2
        push	ax
        call	dispchar
        
        jmp	contin
        
buf2hex	proc
	push	bp
	mov	bp,sp
	
	push	ax
	push	bx
	push	cx
	push	dx
	push	si
	push	di
	
	mov	si,[bp+4]	;get pointer to data, first param
	mov	di,[bp+6]	;get pointer to buffer	,second param
	mov	cx,[bp+8]	;get count to converted	,third param
nextbyt:
	mov	pcount,0
	mov	bx,10h
	xor	ax,ax
	mov	al,byte ptr [si]	;get first byte
	
divag:
	xor	dx,dx
	div	bx
	push	dx
	inc	pcount
	cmp	pcount,2
	jne	divag
	
popit:
	pop	dx
	cmp	dl,9h
	ja	char
	add	dl,30h
	jmp	cont
	
char:	
	add	dl,37h			
cont:	
	mov	[di],dl
	inc	di		;point to next empty pos
	dec	pcount
	jnz	popit
	
	inc	si		;point to next byte
	dec	cx
	jnz	nextbyt
	
	pop	di
	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	
	pop	bp
	ret	6
buf2hex	endp
        
dispchar	proc
	push	bp
	mov	bp,sp
	
	push	ax
	push	cx
	push	dx
	push	si
	
	xor	dx,dx
	mov	si,[bp+4]	;get pointer to data
	mov	cx,[bp+6]	;GET COUNT
	mov	ah,02h
dispag:
	mov	dl,[si]
	int	21h
	inc	si
	dec	cx
	jnz	dispag

	pop	si
	pop	dx
	pop	cx
	pop	ax
	
	pop	bp
	ret	4
dispchar	endp

        
getchars	proc
	push	ax
	push	bx
	
	mov	ah,[di+1]
	mov	bh,[di]
	sub	ah,bh
	mov	byte ptr const2,ah
	mul	cbyte
	mov	byte ptr const1,ah
	
	pop	bx
	pop	ax
	ret
getchars	endp
	
quit:
	mov	ax,4c00h
	int	21h
end	begin
