#include <stdlib.h>
#include <stdio.h>

int main(void)
{
	 long l;
	 char *lstr = "98765432";
	 clrscr();
	 l = atol(lstr);
	 printf("string = %s integer = %ld\n", lstr, l);
	 getch();
}

