            
.model tiny                                       
.code                                                 
org 100h
start:                                                
	 mov dx, 070h
	 mov al, 02Eh
	 out dx, al
	 inc dx
	 xor al, al
	 out dx, al
	 mov dx, 070h
	 mov al, 02Fh
	 out dx, al
	 inc dx
	 xor al, al
	 out dx, al
	
	 mov ax,4C00h ;
	 int 21h      ; Terminate
end	start		                              
