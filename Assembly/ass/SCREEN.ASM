;################MACROS########################
m2m     macro  a,b
push    b
pop     a
endm

put macro m1
	lea	dx,m1
	mov	ah,09h
	int	21h
endm
OURID   EQU     97H
;############################################
.model	tiny
.code
org	100h
start:
	jmp	main	
old8    dd      0       ;this is not transient
old2f	dd	0
old9	dd	0	
psp	dw	0
active	db	0
buffer	db	80*25*2 dup(0)
count	dw	0
image   db      53h,07,63h,07,72h,07,65h,07
        db      65h,07,6Eh,07,20h,07,53h,07
        db      61h,07,76h,07,65h,07,72h,07
        db      20h,07,42h,07,79h,07,20h,07
        db      4Dh,07,61h,07,64h,07,68h,07
        db      75h,07,72h,07
count1  dw      2h
imageloc dw     0
;#######################INT9################
int8:
	cli
	push	ax bx cx dx si di ds es
	
	inc	cs:[count]
        cmp     cs:[count],180

        jb      don

        cmp     cs:[active],0
        je      loadscr      	
        dec     cs:count1
        jz      animate
        jmp     don
		
loadscr:	
        mov     ax,0b800h
        push    ax
        pop     es

        mov	ax,0100h      
        mov	cx,0100h     
        int	10h

        mov     di,offset cs:buffer
        xor     si,si
        mov     cx,4000
saveit:
        m2m     cs:[di] es:[si]
        inc     si
        inc     di
        loop    saveit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
animate:
        mov     cs:count1,2h      ;reset count
	mov 	ax,0600h
        mov 	bh,07h
        mov 	cx,0000h
        mov 	dx,184fh
        int 	10h			;clrscr


        mov     ax,0b800h
        push    ax
        pop     es

        add     cs:imageloc,2
        mov     di,cs:imageloc
        cmp     di,4000
        jne     cont
        mov     imageloc,0
        mov     di,imageloc
cont:
        lea	si,cs:image
        mov     cx,42
imageit:
        m2m     es:[di] cs:[si]
        inc     si
        inc     di
        loop    imageit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	mov	cs:[active],1
		
don:
	pop     es ds di si dx cx bx ax
	sti
        jmp     cs:old8
;#############################int 9#####################
int9:
	cli
	push	ax bx cx dx si di ds es
	
        cmp     cs:[active],0
        je      @@done
        
        mov	ax,0100h		;Show the cursor
       	mov	cx,0607h
       	int	10h   
        
        mov	ax,0b800h
	push	ax
	pop	es

        xor     di,di
        lea     si,cs:buffer     ;what cs:buffer or ds:buffer generated code
        mov     cx,4000 
restore:
        m2m     es:[di] cs:[si]
        inc     si
        inc     di
        loop    restore
			
@@done:
	mov	cs:[count],0
	mov	cs:[active],0
	
	pop     es ds di si dx cx bx ax
	sti
	jmp	cs:old9

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
	cmp	bx,offset int8
	jne	another
	
	mov	ax,352fh
	int	21h
	cmp	bx,offset int2f
	jne	another
        
       	mov	ax,3509h
       	int	21h
       	cmp	bx,offset int9
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
        
        mov	dx,word ptr cs:[old9]
        mov	ds,word ptr cs:[old9+2]
        mov	ax,2509h
        int	21h

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
	iret	

;#######################################################
;	transient section
;######################################################
trans:
msg0	db	"Screen Saver TSR"
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

notl	db	"TSR not loaded in memory or another TSR installed",10,13,"$"
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
	
	mov	ax,3509h
	int	21h
	mov	word ptr [old9],bx
	mov	word ptr [old9+2],es
	
	mov	ax,2508h
	lea	dx,int8	
	int	21h		;set vector
	
	mov	ax,252fh
	lea	dx,int2f
	int	21h

        mov     ax,2509h
        lea     dx,int9
	int	21h

        put     load

        mov	ax,3100h
	lea	dx,trans
	sti
	int	21h
			;become tsr	
quit:
	mov	ax,4c00h
	int	21h
end	start		

