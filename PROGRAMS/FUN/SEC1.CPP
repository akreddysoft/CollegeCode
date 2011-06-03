#include<dos.h>
void main()
{

 union REGS i,o;
 int86(0x19,&i,&o);
}