#include<stdio.h>
#include<iostream.h>
#include<objbase.h>
#include"iface.h"
void trace(const char* msg) { cout << "Client: \t\t" << msg << endl ;}
int main()
{
	const IID IID_IX = 
		{0x32bb8320, 0xb41b, 0x11cf,
		{0xa6, 0xbb, 0x0, 0x80, 0xc7, 0xb2, 0xd6, 0x82}} ;

	const CLSID CLSID_Component1 =
	{0x0c092c21, 0x882c, 0x11cf,
	{0xa6, 0xbb, 0x0, 0x80, 0xc7, 0xb2, 0xd6, 0x82}} ;
		const IID IID_IY = 
		{0x32bb8321, 0xb41b, 0x11cf,
		{0xa6, 0xbb, 0x0, 0x80, 0xc7, 0xb2, 0xd6, 0x82}} ;

	
IX* pIX = NULL ; 
	CoInitialize(NULL) ;
	HRESULT i=CoCreateInstance(CLSID_Component1,0,CLSCTX_INPROC_SERVER,IID_IX,(void **)&pIX);
	if (SUCCEEDED(i))
	{
		cout<<"Succeeded getting IX.";
	}
	switch(i)
	{
	case S_OK:
		cout<<"created\n";
		break;

	case REGDB_E_CLASSNOTREG :
		cout<<"not registered\n";
		break;

	case CLASS_E_NOAGGREGATION :
		cout<<"error";
		break;

	case E_NOINTERFACE :
		cout<<"interface not supported";
		break;
	}
	
	//ix->QueryInterface(IID_IX,
		IY* pIY = NULL ;
	HRESULT	hr = pIX->QueryInterface(IID_IY, (void**)&pIY) ;
		if (SUCCEEDED(hr))
		{
			trace("Succeeded getting IY.") ;
			pIY->Fy() ;       // Use interface IY.
			pIY->Release() ;
			trace("Release IY interface.") ;
		}
	return 0;

}