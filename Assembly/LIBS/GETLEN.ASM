;EXE FILE WITH FULL SEGMENTS                      
;find length of string excluding terminating character
code 	segment byte	public 'code1'	;combine with other libraries	
	assume 	cs:code
public	getlen
getlen	proc	 		;can we do this with uses 
	push	bp
	mov	bp,sp
	push	ax
	push	cx
	push	si

	xor	cx,cx		;init counter
	mov	si,[bp+6]	;get offset of string whose length to find	
	mov	ax,[bp+4]	;get the terminating character
@@count:
	inc	cx		
	inc	si
	cmp	[si],al		;char will be in al as mas ascii=ff
	jne	@@count
	mov	ax,cx		;ax will hold the length after return
	
	pop	si
	pop	cx
	pop	ax
	pop	bp
	ret	4
getlen	endp		
code	ends                                      
end                                      
