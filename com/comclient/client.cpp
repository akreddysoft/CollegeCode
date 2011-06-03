#include<objbase.h>
#include"iface.h"

int main()
{
	const IID IID_IX = 
		{0x32bb8320, 0xb41b, 0x11cf,
		{0xa6, 0xbb, 0x0, 0x80, 0xc7, 0xb2, 0xd6, 0x82}} ;
	
	IX *ix;
	CoCreateInstance(IID_IX,0,CLSCTX_INPROC_SERVER,IID_IX,(void **)&ix);

}