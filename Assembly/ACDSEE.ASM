.model 	small                                         
.stack                                    
.data                                                 
logo	db 10,13,9,9,'****************************************',10,13
     	db       9,9,'*       Crack for ACDSee 32 v2.22      *',10,13
    	db	 9,9,'*       -------------------------      *',10,13
    	db	 9,9,'*   by Madhur(madhur_ahuja@yahoo.com)  *',10,13
    	db       9,9,'*    www.geocities.com/madhur_ahuja    *',10,13
    	db       9,9,'****************************************',10,13,10,13,'$' 
fsize   db      '* Checking file size...',10,13, '$'
crack   db      '* Patching file...',10,13,'$'
success db      '* Patch successfull!',10,13,'$'
fildiff db      '* ERROR: File already patched or different.',10,13, '$'
sizdiff db      '* ERROR: File size mismatch.',10,13,'$'
erropen db      "* ERROR: Can't open file.",10,13,'$'
errsize	db	"* ERROR: Can't determine filesize.",10,13,'$'
errbyte db      '* ERROR: Reading data from file.',10,13,'$'
patch	db	'* ERROR: Unable to Patch.',10,13,'$'
file    db      'acdsee32.exe',0h
handle	dw	0
lsize   dw      9600h
hsize   dw      0ch
readbyt db 	2 dup(0)
ofs	dw	0,48dah
data	db	75h,02h
data1	db	74h,02h
code segment word public 'code'
	assume cs:code
start:                                                

	mov	ax,@data                              
	mov	ds,ax                                 
	lea	dx,[logo]
	call	write
	
	mov	ah,3dh
	mov	al,02h
	lea	dx,file
	int	21h
	jc	fopenerror 
	mov	handle,ax
	
	lea	dx,fsize
	call	write
	call	checksize	
	call	seekfile
	call	checkdata
	call	seekfile
	lea	dx,crack
	call	write
	call	patchit
	call	closefile
	lea	dx,success
	call	write
	call	quit
	
fopenerror:
	lea	dx,erropen
	call	write
	call	quit	

checksize	proc	
	mov	ah,42h
	mov	al,02h
	mov	bx,handle
	xor	cx,cx
	xor	dx,dx
	int	21h
	jc	fsizerr		
	cmp	dx,hsize
	jne	fsizeerror
	cmp	ax,lsize
	jne	fsizeerror
	ret
checksize	endp	

seekfile	proc
	mov	ah,42h
	mov	al,00h
	mov	bx,handle
	mov	cx,ofs
	mov	dx,ofs+2
	int	21h
	jc	readerror
	ret
seekfile	endp	
	
checkdata	proc
	mov	ah,3fh
	mov	bx,handle
	mov	cx,2h
	lea	dx,readbyt
	int	21h
	
	xor	si,si
check:	
	xor	ax,ax
	mov	al,[data+si]
	cmp	[readbyt+si],al
	jne	hexerror
	inc	si
	cmp	si,2h
	jne	check
	ret
checkdata	endp	

patchit	proc
	mov	ah,40h
	mov	bx,handle
	mov	cx,2h
	lea	dx,data1
	int	21h
	jc	patcherror
	ret
patchit	endp	

closefile	proc
	mov	ah,3eh
	mov	bx,handle
	int	21h
	ret
closefile	endp	

fsizeerror:
	lea	dx,sizdiff
	call	write
	call	quit	

fsizerr:
	lea	dx,errsize
	call	write
	call	quit
	
patcherror:
	lea	dx,patch
	call	write
	call	quit


readerror:
	lea	dx,errbyte
	call	write
	call	quit

hexerror:
	lea	dx,fildiff
	call	write
	call	quit

write:	                                              
	mov	ah,09h                                
	int	21h                                   
	ret	                                      
	                                              
quit:                                                 
	mov	ax,4c00h                                
	int	21h           
	
exit:   dfdfs
	fddsf
	sdfsdf
	                        
code	ends
end	start                        
            
         