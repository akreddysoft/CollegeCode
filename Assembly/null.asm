;16 BIT COM WITH SIMPLIFIED DIRECTIVES
.model	tiny
.code
org	100h
start:
	jmp	main	

buff	db	512 dup(0)

main:

	mov	ah,03
	mov	al,01
	mov	ch,00
	mov	cl,1
	mov	dh,0
	mov	dl,82h
	int	13h
	
	mov	ah,02
	mov	al,01
	mov	ch,00
	mov	cl,1
	mov	dh,0
	mov	dl,82h
	int	13h
	
	
	
	
	

	
	
quit:
	mov	ax,4ch
	int	21h
end	start		
	