// lDlg.h : header file
//

#if !defined(AFX_LDLG_H__C210E29D_8293_40DD_BE02_275560D32B45__INCLUDED_)
#define AFX_LDLG_H__C210E29D_8293_40DD_BE02_275560D32B45__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CLDlg dialog

class CLDlg : public CDialog
{
// Construction

/////////////////////// declarations //////////////////////////////////////
CPoint pt1[10];
CPoint pt2[10];
int cmip[10][4];
CPoint cmpt[10];
CBrush* pBrush;
/////////////////////// declarations //////////////////////////////////////
public:
	CLDlg(CWnd* pParent = NULL);	// standard constructor
	HBRUSH OnCtlColor(CDC* pDC, CWnd* pWnd, UINT nCtlColor);

// Dialog Data
	//{{AFX_DATA(CLDlg)
	enum { IDD = IDD_L_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	HBRUSH m_hYellowBrush,m_hRedBrush;
	// Generated message map functions
	//{{AFX_MSG(CLDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	afx_msg void OnButton1();
	afx_msg void OnDV();
	afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LDLG_H__C210E29D_8293_40DD_BE02_275560D32B45__INCLUDED_)
