;
;                          Boot Sector (since DOS 2.0)
;
;      Offset  Size              Description
;
;        00   3bytes     jump to executable code
;        03   8bytes     OEM name and version
;        0B   word       bytes per sector
;        0D   byte       sectors per cluster (allocation unit size)
;        0E   word       number of reserved sectors (starting at 0)
;        10   byte       number of FAT's on disk
;        11   word       number of root directory entries (directory size)
;        13   word       number of total sectors (0 if partition > 32Mb)
;        15   byte       media descriptor byte  (see MEDIA DESCRIPTOR)
;        16   word       sectors per FAT
;        18   word       sectors per track  (DOS 3.0+)
;        1A   word       number of heads  (DOS 3.0+)
;        1C   word       number of hidden sectors  (DOS 3.0+)
;        20   dword      (DOS 4+) number of sectors if offset 13 was 0
;        24   byte       (DOS 4+) physical drive number
;        25   byte       (DOS 4+) reserved
;        26   byte       (DOS 4+) signature byte (29h)
;        27   dword      (DOS 4+) volume serial number
; 	 2B  11bytes     (DOS 4+) volume label
; 	 36   8bytes     (DOS 4+) reserved

.model small
.stack 50                       
.data
buffer db 512 dup()               
lg db 10,13,"           BOOT RECORD"
   db 10,13,"           ===========",10,13 
   db 10,13,"Offset  Size       Description                          $"

m1  db 10,13,"03      8 bytes    manufacturer's name                : $"
m2  db 10,13,"0b      word       bytes per sector                   : $"
m3  db 10,13,"0d      word       sectors per cluster                : $"
m33 db 10,13,"0e      word       number of reserved sectors         : $"
m4  db 10,13,"10      byte       no. of copies of fat(1 or 2)       : $"
m5  db 10,13,"11      word       no. of root directory entries      : $"
m6  db 10,13,"13      word       total no. of sectors if vol.< 32mb : $"
m7  db 10,13,"15      byte       media descriptor byte              : $"
m8  db 10,13,"16      word       no. of sectors of fat              : $"
m9  db 10,13,"18      word       no. of sectors per track           : $"
m10 db 10,13,"1a      word       no. of read-write heads            : $"
s10 db 10,13,"1c      word       number of hidden sectors           : $"

s11 db 10,13,"24      byte       (DOS 4+) physical drive number     : $"
s12 db 10,13,"25      byte       (DOS 4+) reserved                  : $"
s13 db 10,13,"26      byte       (DOS 4+) signature byte (29h)      : $"

m12 db 10,13,"27      dword      volume serial number               : $"
m13 db 10,13,"2b      11 bytes   volume label                       : $"
m14 db 10,13,"36      8 bytes    (DOS 4+) reserved                  : $"
ss1 db 10,13,"20      dword      number of sectors if offset 13 was0: $" ;hidden


cnt    db 3h
res    db 4 dup(0)
offsets db      0Bh,0Dh,0Eh,10h,11h,13h,15h,16h,18h,1Ah,1Ch,24h,25h,26h,27h
lens	db	4,2,4,2,4,4,2,4,4,4,4,8,2,2,4

errmes  db  	10,13,"Disk not found:insert a diskette..."
        db  	10,13,"press any key to continue $"
failmes db      10,13,10,13,"boot read failure:exiting$"
urr	db	10,13,"Unknown Error:Exiting$"

.code
begin:
        mov 	ax,@data             
        mov 	ds,ax               
        mov 	es,ax              
	
start:
;        mov 	ah,02h           
;        mov 	al,01h              ;no. of sectors to read.
;        mov 	ch,00h              ;track number ( beginning from 0 ).
;        mov 	cl,01h              ;sector no
;        mov 	dh,00h              ;head no. or side no.
;        mov 	dl,0                ;drive number (0 for a:)
;        lea 	bx,buffer           ;load offset address of buffer in bx.
;        int 	13h            

	mov	al,0		    ;drive number
	mov	cx,1		    ;no of sectors
	mov	dx,0		    ;starting logical sector
	lea	bx,buffer
	int	25h
	popf
	    
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

success:
        mov     ah,09h
        lea     dx,lg
        int     21h

        mov 	ah,09h
        lea 	dx,m1               ;display manufacturer's name.
        int 	21h

        lea 	bx,buffer           ;load effective address of buffer in bx.
        add 	bx,03h              ;here point contents in bx to 03h.
        xor	cx,cx
        mov 	cl,08
        push	cx               ;count for manufacturer's name.
        push	bx
        call 	dispchar         ;display name by calling the subroutine.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	lea	di,offsets
	mov	bx,offset m2
	lea	si,lens
dispagain:
	xor	ax,ax
	
        mov 	ah,09h
        mov	dx,bx
        int 	21h
        
	push	bx
	mov	dl,byte ptr [di]
	lea	bx,buffer
	add	bl,dl
	
	xor	ax,ax
	mov	al,byte ptr [si]		;get whether to display byte,word
	mov	cx,word ptr [bx]	;get the num to display
	push	ax
	push	cx
	call	dispnum
	
	pop	bx
	
	inc	si
	inc	di
        add     bx,3bh                 ;point to next message
	cmp	byte ptr [di],27h		;whether last offset reached
        jne	dispagain
;        jmp     quit

;#################################################################################

        mov 	ah,09h
        lea 	dx,m12
        int 	21h
                      
        lea 	si,buffer           ;load effective address of buffer in bx.
        add 	si,29h              ;point bx to contents of 11h.
        mov 	bx,word ptr[si]     ;point bx to contents of 11h.
        call 	display16          ;call subroutine.
        mov	ah,02
        mov 	dl,'-'
        int 	21h
        sub 	si,02
        mov 	bx,word ptr[si]
        call 	display16          ;call subroutine.

        mov 	ah,09h
        lea 	dx,m13               ;display volume label
        int 	21h

        lea 	bx,buffer           ;load effective address of buffer in bx.
        add 	bx,2bh              ;point bx to contents of 11h.
        xor     cx,cx
        mov 	cl,12
        push	cx
        push	bx
        call 	dispchar         ;call subroutine.
                      
        mov     ah,09h
        lea     dx,m14
        int     21h

        lea     bx,buffer           ;load effective address of buffer in bx.
        add     bx,36h              ;point bx to contents of 11h.
        mov     cl,12
        push    cx
        push    bx
        call    dispchar

        jmp     quit

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

dispnum proc               ; procedure to convert 16 bit hex no.
	push	bp
	mov	bp,sp
        push	ax
        push	bx
        push	cx
        push	dx
        push	si
        push	di
             
        mov	cx,[bp+4]	;get the num to display
        mov	si,[bp+6]	;decide whether to display byte,word
        cmp	si,4
        je	@@normal
        
@@mask: 
	xor	ch,ch
	
@@normal:       
        lea 	si,res                ; into its equivalent bcd and display it
        mov 	ax,cx
        mov 	dx,00h
tt1:
        cmp 	ax,0ah
        jb 	tt
        mov 	bx,0ah
        div 	bx                    ; divide no. by 0ah until it is greater than 0ah
        add 	dl,30h
        mov 	[si],dl
        inc	si
        mov 	dx,00h
        jmp 	tt1

tt:	
        add 	al,30h
        mov 	[si],al

	call 	disp
	
	pop	di
	pop	si
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	
	pop	bp	
	ret	4

dispnum endp

disp proc

        lea 	di,res
d1:
        cmp 	si,di
        je 	ex
        mov 	dl,[si]
        mov 	ah,02h
        int 	21h
        dec 	si
        jmp 	d1

ex:
        mov 	dl,[si]
        mov 	ah,02h
        int 	21h
        ret	

disp endp

display16 proc       ; displays 16-bit hex/bcd no. in bx

        mov 	ax,bx
        shr 	ax,0ch
        call 	checkhex_o
        mov 	ah,02h
        mov 	dl,al
        int 	21h                 ; display msb

        mov 	ax,bx
        and 	ax,0fffh
        shr 	ax,08h
        call 	checkhex_o
        mov 	ah,02h
        mov 	dl,al
        int 	21h                  ; display 2nd digit

        mov 	ax,bx
        and 	ax,00ffh
        shr 	ax,04h
        call 	checkhex_o
        mov 	ah,02h
        mov 	dl,al
        int 	21h                  ; display 3rd digit 

        mov 	ax,bx
        and 	ax,000fh
        call 	checkhex_o
        mov 	ah,02h
        mov 	dl,al
        int 	21h                  ; display 4th digit
        ret

display16 endp

checkhex_o proc near        ; checks whether a no. in al is hex/bcd

             cmp al, 09h                 ; and puts the ascii values  in al
             jbe decimal
             add al, 37h
             jmp back2

decimal:
             add al, 30h

back2:
             ret
checkhex_o endp

quit:
	mov	ax,4c00h
	int	21h
end	begin
