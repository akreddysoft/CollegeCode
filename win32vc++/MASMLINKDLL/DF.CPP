#include<windows.h>
//extern "C++" void madhurahuja();
extern "C" madhurahuja();
//extern void  _madhurahuja();
//void madhurahuja();
int WINAPI WinMain(HINSTANCE hisnt,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	madhurahuja();
//	_madhurahuja();
	return 0;
}