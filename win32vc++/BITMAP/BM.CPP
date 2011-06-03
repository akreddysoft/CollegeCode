#include<windows.h>
#include "resource.h"

HINSTANCE hinstance;
BOOL flag=0,flag1=0;

POINT pt,pt1,pt2;
HBITMAP hbm,hbm1,hbm2,hbm3;
RECT rect;
	
BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam);

int _stdcall WinMain(HINSTANCE hinst,HINSTANCE hprev,LPSTR cmdline,int cmdshow)
{
	hinstance=hinst;
	DialogBoxParam(hinst,MAKEINTRESOURCE(IDD_DIALOG1),0,dlgproc,0);
	return 0;
}

BOOL CALLBACK dlgproc(HWND hwnd,UINT msg,WPARAM wparam,LPARAM lparam)
{
PAINTSTRUCT ps;
HDC hdc,mhdc,mhdc1;

	switch(msg)
	{
	case WM_INITDIALOG:
		hbm=LoadBitmap(hinstance,MAKEINTRESOURCE(IDCHOUSE));	
		hbm1=LoadBitmap(hinstance,MAKEINTRESOURCE(IDHOUSE));	
		hbm2=LoadBitmap(hinstance,MAKEINTRESOURCE(IDCMAIL));	
		hbm3=LoadBitmap(hinstance,MAKEINTRESOURCE(IDMAIL));	

		pt1.x =0xf;
		pt1.y =0x60;
		
		pt2.x =pt1.x +25;
		pt2.y =pt1.y+3;
		
		rect.top =pt1.y ;
		rect.bottom =pt1.y +14;
		rect.left =pt1.x;
		rect.right =pt2.x +11;
		
		break;

	case WM_CLOSE:
		DeleteObject(hbm);
		DeleteObject(hbm1);
		DeleteObject(hbm2);
		DeleteObject(hbm3);
		EndDialog(hwnd,0);
		break;

	case WM_COMMAND:
		if(LOWORD(wparam)==IDOK)
			SendMessage(hwnd,WM_CLOSE,0,0);
		break;

	case WM_MOUSEMOVE:
		pt.x =LOWORD(lparam);
		pt.y =HIWORD(lparam);
	
		if(pt.x >=pt1.x && pt.x <pt1.x+14 && pt.y >=pt1.y && pt.y<pt1.y +14)
		{
			if(flag==0)
			{
				flag=1;
				InvalidateRect(hwnd,&rect,1);
			}
		}
		else
		{
			if(flag==1)
			{
				flag=0;
				InvalidateRect(hwnd,&rect,1);
			}
		}
		

		if(pt.x >=pt2.x && pt.x <pt2.x+14 && pt.y >=pt2.y && pt.y<pt2.y +14)
		{
			if(flag1==0)
			{
				flag1=1;
				InvalidateRect(hwnd,0,1);
			}
		}

		else
		{
			if(flag1==1)
			{
				flag1=0;
				InvalidateRect(hwnd,0,1);
			}
		}
		break;

	case WM_PAINT:
		hdc=BeginPaint(hwnd,&ps);
		mhdc=CreateCompatibleDC(hdc);
		mhdc1=CreateCompatibleDC(hdc);
		
		if(flag==1)
			SelectObject(mhdc,hbm);
		else
			SelectObject(mhdc,hbm1);
		if(flag1==1)
			SelectObject(mhdc1,hbm2);
		else
			SelectObject(mhdc1,hbm3);

		TransparentBlt(hdc,pt1.x,pt1.y ,14,14,mhdc,0,0,14,14,0x0ff00ff);
		TransparentBlt(hdc,pt2.x ,pt2.y ,11,11,mhdc1,0,0,11,11,0x0ff00ff);

		DeleteDC(hdc);
		DeleteDC(mhdc );
		DeleteDC(mhdc1);
		EndPaint(hwnd,&ps);
		break;

	case WM_LBUTTONDOWN:
		pt.x =LOWORD(lparam);
		pt.y =HIWORD(lparam);
		if(pt.x >=pt1.x && pt.x <pt1.x+14 && pt.y >=pt1.y && pt.y<pt1.y +14)
			ShellExecute(hwnd,"open","www.geocities.com/madhur_ahuja",0,0,0);
		if(pt.x >=pt2.x && pt.x <pt2.x+14 && pt.y >=pt2.y && pt.y<pt2.y +14)
			ShellExecute(hwnd,"open","mailto:madhur_ahuja@yahoo.com",0,0,0);
		break;
	
	
	default:
		return 0;
	}
	return 1;
}