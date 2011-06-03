.model small
.stack
.data
logo	db 10,13,9,'*********************************************************',10,13
	db       9,'* Crack for notepad.exe(Removes the wordpad nag screen) *',10,13
	db	 9,'* ----------------------------------------------------- *',10,13  		
	db       9,'*           by Madhur(madhur_ahuja@yahoo.com)           *',10,13
	db	 9,'*            www.geocities.com/madhur_ahuja             *',10,13
	db       9,'*********************************************************',10,13,10,13,'$'
fsize   db      '* Checking file size...',10,13, '$'
crack   db      '* Patching file...',10,13,'$'
success db      '* Patch successfull!',10,13,'$'
fildiff db      '* ERROR: File already patched or different.',10,13, '$'
sizdiff db      '* ERROR: File size mismatch.',10,13,'$'
erropen db      "* ERROR: Can't open file.",10,13,'$'
errsize	db	"* ERROR: Can't determine filesize.",10,13,'$'
errbyte db      '* ERROR: Reading bytes from file.',10,13,'$'
file    db      'notepad.exe',0h
handle	dw	0
lsize   dw      53248
hsize   dw      0
readbyt db 9 dup(0)
;we need to continously write 9bytes of data statring from 000033b1h, so there is no need
;to test file byte by byte, we read directly 9 bytes and direcly write 9 bytes
ofs	dw	0,33b1h
data	db	0ffh,15h,0a8h,64h,40h,00h,83h,0f8h,06h
data1	db	90h,90h,90h,90h,90h,90h,90h,90h,90h
; we could have incorporated both the data together like
;data	db     0ffh,90,15,90 and then used di+2 to test and write the file
	
;data	db	
.code
start:
	mov     ax,@data
	mov     ds,ax
	lea	dx,logo
	call	write
	mov	al,02h
	mov	ah,3dh
	mov	dx,offset file
	int	21h
	jc 	err21 
	mov	handle,ax
	lea	dx,fsize
	call	write
	
	call	checkfilesize
	call	seekfile
	call	testfile
	lea	dx,crack
	call	write
	call	seekfile
	call	writefile
	lea	dx,success
	call	quit


testfile:
	mov	ah,3fh
	mov	bx,handle
	mov	cx,9h
	mov	dx,offset readbyt 
	int	21h
	jc	err5
	xor	si,si
	lea	si,readbyt
	lea	di,data
checkdata:
	mov	bh,[si]
	cmp	[di],bh
	jne	alpatched
	inc	si
	inc	di
	loop	checkdata
	ret

seekfile:
	mov	ah,42h
	mov	al,0h
	mov	bx,handle
	mov	cx,[ofs]        ;high order word
	mov	dx,[ofs+2]     ;low order word
	int	21h
	ret

checkfilesize:
	mov	ax,4202h
	mov	bx,handle
	xor	cx,cx
	xor	dx,dx
	int	21h
	jc	err2
	cmp	dx,hsize
	jne	err3
	cmp	ax,lsize
	jne	err3
	ret

err21:
	lea	dx,erropen
	call	quit


writefile:
	mov	ah,40h
	mov	bx,handle
	mov	cx,9h
	mov	dx,offset data1
	int	21h
	ret

err11:
	lea	dx,erropen
	call	quit
err3:
	lea	dx,sizdiff
	call	quit
alpatched:
	lea	dx,fildiff
	call	quit
err2:
	lea	dx,errsize
	call	quit
err5:
	lea	dx,errbyte
	call	quit
write:
	mov	ah,09h
	int	21h
	ret

closefile:
	mov     ah,3Eh                  ; close file function 3Eh
	mov     bx,handle
	int     21h
	ret

quit:
	call	write
	call	closefile
	.exit
end   	start