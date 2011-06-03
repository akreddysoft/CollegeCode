#if !defined(AFX_LDLG_H__89E3EBAB_0DF1_4650_AA50_9A3B1C137588__INCLUDED_)
#define AFX_LDLG_H__89E3EBAB_0DF1_4650_AA50_9A3B1C137588__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// LDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CLDlg dialog

class CLDlg : public CDialog
{
// Construction
public:
	CLDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CLDlg)
	enum { IDD = IDD_DIALOG2 };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CLDlg)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LDLG_H__89E3EBAB_0DF1_4650_AA50_9A3B1C137588__INCLUDED_)
