int cdecl sum();
char *d="global data";
int cdecl printf(const char *__format, ...);
void main()
{
	char *s="local data";
	int a=3;
	int b=5,c=0;
	c=sum(a,b);  //sum defined in assembly module
	printf("%s\n",s);
	printf("%s\n",d);
	_asm{
		mov ah,02h
		xor dx,dx
		mov dx,c
		add dl,30h	
		int 21h
		
		mov ax,4c00h
// this means 21 decimal		int 21
		int 21h
		}
		

}
