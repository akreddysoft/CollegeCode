#include <afxwin.h>
#include "MouseCap.h"

CMyApp myApp;

BOOL CMyApp::InitInstance ()
{
    m_pMainWnd = new myfrane;
    m_pMainWnd->ShowWindow (m_nCmdShow);
    m_pMainWnd->UpdateWindow ();
    return TRUE;
}

BEGIN_MESSAGE_MAP (myfrane, CFrameWnd)
    ON_WM_LBUTTONDOWN ()
    ON_WM_LBUTTONUP ()
    ON_WM_MOUSEMOVE ()
END_MESSAGE_MAP ()

myfrane::myfrane ()
{
    Create (0, "madhurwindow");
}

void myfrane::OnLButtonDown (UINT nFlags, CPoint point)
{
    ptfrom = point;
    ptto = point;

	 m_bTracking = TRUE;

    if (m_bCaptureEnabled)
        SetCapture ();
  
}

void myfrane::OnMouseMove (UINT nFlags, CPoint point)
{
    if (m_bTracking)
	{
        CClientDC dc (this);
        Invert(&dc, ptfrom, ptto);
        Invert(&dc, ptfrom, point);
        ptto = point;
    }
}

void myfrane::OnLButtonUp (UINT nFlags, CPoint point)
{
     if (m_bTracking) 
	 {
        m_bTracking = FALSE;
        if (GetCapture () == this)
            ::ReleaseCapture ();   
	
		CClientDC dc (this);
        Invert(&dc, ptfrom, ptto);

        dc.MoveTo (ptfrom);
        dc.LineTo (point);
	 }
  
}

void myfrane::Invert(CDC* pDC, CPoint ptFrom, CPoint ptTo)
{
    int nOldMode = pDC->SetROP2 (R2_NOT);
    pDC->MoveTo (ptFrom);
    pDC->LineTo (ptTo);
    pDC->SetROP2 (nOldMode);
}