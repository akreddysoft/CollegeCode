#include <windows.h>

struct inidata
{
	char ipad[20];
	int time_interval;
};

char *inifile="spy.ini";
char *section="madhur";
char *sec1="Address";
//char *sec2="Time";

DWORD WINAPI lstproc(void *);
int WINAPI WinMain (HINSTANCE hinst,HINSTANCE dd,LPSTR cmdline,int cmdshow)
{
	HDC hdcScreen = CreateDC("DISPLAY", NULL, NULL, NULL); 
	HDC hdcCompatible = CreateCompatibleDC(hdcScreen); 
	
	HBITMAP hbmScreen = CreateCompatibleBitmap(hdcScreen, 
                     GetDeviceCaps(hdcScreen, HORZRES), 
                     GetDeviceCaps(hdcScreen, VERTRES)); 

	SelectObject(hdcCompatible, hbmScreen);

	BitBlt(hdcCompatible, 
               0,0, 
               800,600, 
               hdcScreen, 
               0,0, 
               SRCCOPY);



	return 1;

}