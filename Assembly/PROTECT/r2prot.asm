;REAL MODE TO PROTECTED MODE
;PROGRAM BY MADHUR AHUJA
;INDIA
;DATED: 30th Oct 03

.386
codesg 	segment
	assume cs:codesg,ds:codesg,ss:codesg
	org 100h
main:
	jmp 	begin
gdt	dd 	2 dup(0)	;first null descriptor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	dw	0fffh		;limit=ffff, base =0
	dw	0
	db	0
	db	10011010b	;p=1,dpl=00,type=11010(1a for code)
	db	11001111b	;g=1,b=1,0,avl=0, limit=ffh
	db	0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
gdt1	dw	0ffffh		;limit=ffff
	dw	0		;base=0
	db	0		;base=0
	db	10010010b	;p=1,dpl=00,type=10010(12 for data)[expand up,writeable,non access]
	db	11001111b	;g=1,b=1,0,avl=0,limit=ff
	db	0		;base=0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;		
gdt2	dw	0fffh		;limit=ffff, base =0
	dw	0
	db	0
	db	10011010b	;p=1,dpl=00,type=11010(1a for code)[non conforming,readaable,non access]
	db	11001111b	;g=1,b=1,0,avl=0, limit=ffh
	db	0		;base=0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
gdt3	dw	0fffh		;limit=ffff, base =0
	dw	0
	db	0
	db	10010010b	;p=1,dpl=00,type=10010(12 for data)[expand up,writeable,non access]
	db	11001111b	;g=1,b=1,0,avl=0, limit=ffh
	db	0		;base=0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
gdt4	dw	0fffh		;limit=ffff, base =0
	dw	0
	db	0
	db	10011010b	;p=1,dpl=00,type=11010(1a for code)[non conforming,readaable,non access]
	db	11001111b	;g=1,b=1,0,avl=0, limit=ffh
	db	0		;base=0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
gdt5	dw	0fffh		;limit=ffff, base =0
	dw	0
	db	0
	db	10011010b	;p=1,dpl=00,type=11010(1a for code)[non conforming,readaable,non access]
	db	11001111b	;g=1,b=1,0,avl=0, limit=ffh
	db	0		;base=0

label	gdt_end 
gdtr	dw gdt_end - gdt - 1	; GDT limit
	dd gdt                  ; (GDT base gets set above)

begin:
	xor	ebx,ebx
	mov	bx,ds
	shl 	ebx,4   ;bx contains the starting physical address of program                    ; BX="linear" address of segment base
	mov 	eax,ebx  ;lea eax=00012340h
	mov 	word ptr [gdt2 + 2],ax               ; set base address of 32-bit segments
	mov 	word ptr [gdt3 + 2],ax
	mov 	word ptr [gdt4 + 2],ax               ; set base address of 16-bit segments
	mov 	word ptr [gdt5 + 2],ax		;ax=2340h
	
	shr 	eax,16	;eax=
	mov 	byte ptr [gdt2 + 4],al
	mov 	byte ptr [gdt3 + 4],al
	mov 	byte ptr [gdt4 + 4],al
	mov 	byte ptr [gdt5 + 4],al

	mov 	byte ptr [gdt2 + 7],ah
	mov 	byte ptr [gdt3 + 7],ah
	mov 	byte ptr [gdt4 + 7],ah
	mov 	byte ptr [gdt5 + 7],ah
	
	xor	ebx,ebx
	mov	bx,ds			;get segment base
	shl	ebx,4			;get physical  address
	mov	edx,offset gdt
	add	bx,dx		;add offset of gdt
	mov	[gdtr+2],bx		;set base address
	


	
quit:
	mov 	ah,4ch
	int 	21h
codesg 	ends
end 	main