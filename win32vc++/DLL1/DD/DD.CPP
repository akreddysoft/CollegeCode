#include<windows.h>

typedef VOID (*MYPROC)(); 

int WINAPI WinMain(HINSTANCE hins,HINSTANCE hrev,LPSTR cmdline,int cmdshow)
{
	HMODULE hh;
	
	MYPROC add;
	hh=LoadLibrary("E:\\programming\\win32vc\\dll\\debug\\dll.dll");
	add=(MYPROC)GetProcAddress(hh,"madhur");
	if(add!=0)
	{

	add();
	}
	return 1;
}