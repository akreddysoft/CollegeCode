// l.h : main header file for the L application
//

#if !defined(AFX_L_H__7B1122EC_8C85_4E3E_802B_8343316CB933__INCLUDED_)
#define AFX_L_H__7B1122EC_8C85_4E3E_802B_8343316CB933__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CLApp:
// See l.cpp for the implementation of this class
//

class CLApp : public CWinApp
{
public:
	CLApp();
	CBrush* pBrush;

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CLApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_L_H__7B1122EC_8C85_4E3E_802B_8343316CB933__INCLUDED_)
