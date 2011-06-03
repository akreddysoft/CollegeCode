#include <conio.h>

int main(void)
{
	 cprintf("Press any key to continue:");
	 while (!kbhit()) /* do nothing */ ;
	 cprintf("\r\nA key was pressed...\r\n");
	 return 0;
}

