class CMyApp : public CWinApp
{
public:
    virtual BOOL InitInstance ();
};

class myfrane : public CFrameWnd
{
protected:
    BOOL m_bTracking;			// TRUE if rubber banding
    BOOL m_bCaptureEnabled;		// TRUE if capture enabled
	CPoint ptfrom;			// "From" point for rubber banding
    CPoint ptto;			// "To" point for rubber banding
    void Invert (CDC* pDC, CPoint ptFrom, CPoint ptTo);

public:
    myfrane ();

protected:
    afx_msg void OnLButtonDown (UINT nFlags, CPoint point);
    afx_msg void OnLButtonUp (UINT nFlags, CPoint point);
    afx_msg void OnMouseMove (UINT nFlags, CPoint point);
    DECLARE_MESSAGE_MAP ()
};
