void main()
{
char str[]={"madhur"};
asm{
 mov	ah,09h
 lea	dx,str
 int	21h
}
}