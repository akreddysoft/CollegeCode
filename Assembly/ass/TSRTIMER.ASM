;################MACROS########################
jumps
put macro m1
	lea	dx,m1
	mov	ah,09h
	int	21h
endm
OURID   EQU     98H
;############################################
.model	tiny
.code
org	100h
start:
	jmp	main	
old8    dd      0       ;this is not transient
old2f	dd	0	
psp	dw	0
hr	db	0
min	db	0
sec	db	0
time	db	0,0,':',0,0,':',0,0
;#######################INT9################
int8:
	cli
	push	ax bx cx dx si di ds es
	
	mov	ah,02
	int	1ah
	mov	cs:[hr],ch
	mov	cs:[min],cl
	mov	cs:[sec],dh
	
	call	dispnum
	
	
	mov	ax,0b800h
	push	ax
	pop	es
	mov	bx,80h
	
        xor     di,di
timeit:
        mov     al,cs:[time+di]
	mov	es:[bx],al
        add     bx,2
        add     di,1
        cmp     di,8
        jne	timeit
	jmp	done
		
dispnum proc           
        push	ax bx cx dx si di 

        lea	di,hr
        mov     cx,0
        xor     bx,bx
	
next:       
        xor	ax,ax
        mov     al,byte ptr cs:[di]
	
        push    cx      ;save cx as used in counter	
	mov	cx,10h
	xor	si,si
@@normal:
	xor	dx,dx
	div	cx
	push	dx
	inc	si
	cmp	si,2
	jne	@@normal
	

popagain:
	pop	dx
	cmp	dl,9
	ja	char
	add	dl,30h
	jmp	skip
char:
	add	dl,37h
skip:
        mov     cs:[time+bx],dl
        inc     bx
        dec	si
	jnz	popagain

        pop     cx      ;restore the counter

        inc     bx      ;skip the ':'
        inc     cx      ;hr min sec counter
	inc	di	;point to hr,min,sec
        cmp     cx,3
	jne	next
	
	pop	di si dx cx bx ax
	ret	
dispnum endp	
		
done:
	pop     es ds di si dx cx bx ax
	sti
	jmp	cs:old8

;#####################int 2f#########################
int2f:
	cmp	ax,0	
	je	query
	cmp	ax,1
	je	remove
	jmp	cs:old2f	;any other

query:
	mov	ax,ourid
        iret

remove:	
        
        mov     ax,3508h                ;check if any other tsr loded
	int	21h		;get vector

	mov	dx,offset int8
	mov	dx,offset cs:int8
	cmp	bx,offset int8
	jne	another
	
	mov	ax,352fh
	int	21h
	cmp	bx,offset int2f
	jne	another
        
        cli
        push    ds   			;dont modify segment registers

        mov     dx,word ptr cs:[old8]    ;since this is isr only cs holds the segment address of tsr
        mov     ds,word ptr cs:[old8+2]
        mov     ax,2508h
        int     21h
        
        mov     dx,word ptr cs:[old2f]  
        mov     ds,word ptr cs:[old2f+2]
        mov     ax,252fh
        int     21h

        mov     es,word ptr cs:PSP           
        mov     es,es:word ptr [2Ch]     ;Get address of environment block.
        mov     ah,49h                   ;Deallocate the memory taken up by it!
        int     21h

        mov     es,word ptr cs:PSP          ;Deallocate the memory taken up by the PSP 
        mov     ax,4900h         
        int     21h

        pop     ds
        xor     ax,ax                   ;return 0 success

        sti
        iret

another:
	put	anot
	retf	
;#######################################################
;	transient section
;######################################################
trans:
msg0	db	"Real Time Clock TSR"
	db	10,13,"Written in asm by Madhur"
	db	10,13,10,13,"Usage: tsrtimer [option]"
	db	10,13,"/i: Install"
	db	10,13,"/u: Uninstall"
	db	10,13,"/?: Display this",10,13,"$"
	
load    db      "TSR Successfully Loaded",10,13,"$"
loaded  db      "TSR Already Loaded",10,13,"$"
unload  db      "TSR Successfully Unloaded",10,13,"$"

inval	db	"Invalid Command line arguments"	
	db	10,13,"See /? for more",10,13,"$"

notl	db	"TSR not loaded in memory",10,13,"$"
err1	db	"TSR returned error while unloading",10,13,"$"
anot	db	"Another TSR is blocking removal",10,13,"$"
main:
	mov	si,80h			;get the cmd tail
checkcmd:
	inc	si
	mov	al,[si]
	cmp	al,' '
	je	checkcmd
	cmp	al,13
	je	help
	cmp	al,'/'
	je	checkopt
	jmp	invalid			;if not space or enter or /= invalid
	
checkopt:
	mov	ax,[si]
	cmp	ah,'?'
	je	help			;disp help
	cmp	ah,'i'
	je	install			;do instal
	cmp	ah,'u'
	je	uninstall		;remove
	jmp	invalid
	
help:
	put	msg0
	jmp	quit	

invalid:
	put	inval
	jmp	quit
	

install:	
	xor	ax,ax
	int	2fh
	cmp	ax,OURID	
	jne	loadit		;if ax!=99,tsr not loaded
	
	put	loaded
	jmp	quit
	
uninstall:
	xor	ax,ax		;query presence
	int	2fh
	cmp	ax,ourid	
        je      remove1		;yes tsr present

	put	notl
	jmp	quit

remove1:
        mov     ax,1
        int     2fh		;send remove message
        cmp	ax,0		;get success status
        jnz	error
        put	unload
        jmp     quit		;quit this program

error:
	put	err1
	jmp	quit

;##########################INIT#######################
loadit:	
	cli
	
        mov     ah,51h
        int     21h
        mov     word ptr PSP,bx  ;Save the PSP base address 
	
        mov     ax,3508h
	int	21h		;get vector
	mov	word ptr [old8],bx
	mov	word ptr [old8+2],es
	
	mov	ax,352fh
	int	21h
	mov	word ptr [old2f],bx
	mov	word ptr [old2f+2],es
	
	mov	ax,2508h
	lea	dx,int8	
	int	21h		;set vector
	
	mov	ax,252fh
	lea	dx,int2f
	int	21h
	
	mov	ax,3100h
	lea	dx,trans
	sti
	int	21h
			;become tsr	
quit:
	mov	ax,4c00h
	int	21h
end	start		

