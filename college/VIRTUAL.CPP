#include <iostream.h>
#include <conio.h>

class CWnd
{
private:
	int hwnd;
public:
	setwindowtext(){cout<<"cwnd:setwindowtext\n";}
	setdlgitemtext(){cout<<"cwnd::setdlgitemtext\n";}
	virtual getwindowtext(){cout<<"cwnd:getwindowtext\n";}

}                   ;

class CFrameWnd:public CWnd
{

}                    ;

class myframe:public CFrameWnd
{
	public:
	myframe()
	{
	}
	setwindowtext(){cout<<"myframe::setwindowtext\n";}
	virtual getwindowtext(){cout<<"myframe::getwindowtext\n";}
}                     ;

void main()
{
/* myframe app;         //basics: derived class version will be executed
 app.setwindowtext();
 app.getwindowtext();
 myframe *ap;
 ap=new myframe;
 ap->setwindowtext();
 ap->getwindowtext();*/

 CWnd *ap1;
 ap1=new myframe;
 ap1->getwindowtext();
 ap1->setwindowtext();
 cout<<"\n";

/*  CWnd *ap2;           //ap2 doesnt know about derived class,

 ap2=new CWnd;           //it doesnt know here,base class will be exetueded
 ap2->getwindowtext();
 ap2->setwindowtext();*/

/* myframe *ap3;
  ap3=new CWnd;
 ap3->getwindowtext();
 ap3->setwindowtext();*/       //not possible

/*  myframe *ap3;         basics: derived if exist will b e exuted
  ap3=new myframe;
 ap3->setdlgitemtext();
 ap3->getwindowtext();
 ap3->setwindowtext();*/



// delete ap;

 getch();
}
