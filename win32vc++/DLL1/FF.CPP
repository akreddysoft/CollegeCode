#include<windows.h>
#include<E:\programming\win32vc\dll\hh.h>


BOOL APIENTRY DllEntry(HINSTANCE hinst,long reason,long reserved)
{
	return 1;
}



__declspec(dllexport) int madhur()
{
	int i,j=0;
	for(i=0;i<100000;++i)
		++j;
	MessageBox(0,"dfdf","dfdffd",0);
	return 1;
}
