class CDlgCalcDlg : public CDialog
{
public:
	void UpdateDisplay (LPCTSTR pszDisplay);
	CDlgCalcDlg(CWnd* pParent = NULL);	// standard constructor

	enum { IDD = IDD_DLGCALC_DIALOG };
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	virtual BOOL OnCommand(WPARAM wParam, LPARAM lParam);
protected:
	void DropStack();
	void LiftStack();
	void DisplayXRegister();

    double m_dblStack[4];
    double m_dblMemory;
    CString m_strDisplay;
    CString m_strFormat;
    CRect m_rect;
    int m_cxChar;
    int m_cyChar;

    BOOL m_bFixPending;
    BOOL m_bErrorFlag;
    BOOL m_bDecimalInString;
    BOOL m_bStackLiftEnabled;
    BOOL m_bNewX;

	HICON m_hIcon;
	HACCEL m_hAccel;

	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg void OnAdd();
	afx_msg void OnSubtract();
	afx_msg void OnMultiply();
	afx_msg void OnDivide();
	afx_msg void OnEnter();
	afx_msg void OnChangeSign();
	afx_msg void OnExponent();
	afx_msg void OnStore();
	afx_msg void OnRecall();
	afx_msg void OnFix();
	afx_msg void OnClear();
	afx_msg void OnDecimal();
	afx_msg void OnDelete();
	afx_msg void OnDigit(UINT nID);
	DECLARE_MESSAGE_MAP()
};
