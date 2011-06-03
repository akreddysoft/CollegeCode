// AniEmp.h : Declaration of the CAniEmp

#ifndef __ANIEMP_H_
#define __ANIEMP_H_

#include "resource.h"       // main symbols
#include<fstream.h>



/////////////////////////////////////////////////////////////////////////////
// CAniEmp
class ATL_NO_VTABLE CAniEmp : 
	public CComObjectRootEx<CComSingleThreadModel>,
	public CComCoClass<CAniEmp, &CLSID_AniEmp>,
	public IDispatchImpl<IAniEmp, &IID_IAniEmp, &LIBID_ANIREGLib>
{
public:
	char records[100][100];

	long int sal[100];
	int flag,count,id[100],lim;

	
	char name[25];
	CAniEmp()
	{

	
				
	}
	void CAniEmp::FinalRelease() {
    cout<<"Here";
   
	}


HRESULT STDMETHODCALLTYPE Add_Emp(int,BSTR,int);
HRESULT STDMETHODCALLTYPE Func1();
HRESULT STDMETHODCALLTYPE Del_Emp(int);
HRESULT STDMETHODCALLTYPE Search_Emp(int);
HRESULT STDMETHODCALLTYPE Sort();

DECLARE_REGISTRY_RESOURCEID(IDR_ANIEMP)

DECLARE_PROTECT_FINAL_CONSTRUCT()

BEGIN_COM_MAP(CAniEmp)
	COM_INTERFACE_ENTRY(IAniEmp)
	COM_INTERFACE_ENTRY(IDispatch)
END_COM_MAP()

// IAniEmp
public:
};

#endif //__ANIEMP_H_
