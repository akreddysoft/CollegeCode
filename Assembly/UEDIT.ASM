;16 BIT EXE WITH SIMPLIFIED DIRECTIVES                
.model 	small                                         
.stack                                 
.data                                                 
filename	db 'uedit32.reg',0
new		db 'new.reg',0
ohandle		dw 0
nhandle		dw 0                                                      
openerror1	db 10,13,'cannot open$'
createrror1	db 10,13,'cannot create$'
readerror1	db 10,13,'cannot read$'
writeerror1	db 10,13,'cannot write$'
data		dw 0
.code                                                 
start:                                                
	mov	ax,@data                              
	mov	ds,ax                                 
	mov	ah,3dh
	lea	dx,filename
	mov	al,00
	int	21h
;	jc	openerror
	mov	ohandle,ax
	
	mov	ah,3ch
	lea	dx,new
	mov	cx,00000000b
	int	21h
	jc	createrror
	mov	nhandle,ax

	xor	si,si
	mov	di,100h
read:	
	mov	ah,3fh
	mov	bx,ohandle
	mov	cx,2
	lea	dx,data
	int	21h
	jc	readerror
	
	dec	[data]
	dec	[data+1]
	rol	data,8
	
	mov	ah,40h

	mov	bx,nhandle
	mov	cx,2
	lea	dx,data
	int	21h
	jc	writeerror
	
	inc	si
	inc	si
	cmp	si,di
	jle	read
	
	mov	ah,3eh
	mov	bx,ohandle
	int	21h
	
	mov	ah,3eh
	mov	bx,nhandle
	int	21h
	call	quit
	
readerror:
	lea	dx,readerror1
	call	write
	call	quit
	
writeerror:
	lea	dx,writeerror1
	call	write
	call	quit	

createrror:
	lea	dx,createrror1
	call	write
	call	quit	
openerror:
	lea	dx,openerror1
	call	write
	call	quit	
	
write:	                                              
	mov	ah,09h                                
	int	21h                                   
	ret	                                      
quit:                                                 
	mov	ax,4c00h                                
	int	21h                                   
	                                              
end	start		                              
