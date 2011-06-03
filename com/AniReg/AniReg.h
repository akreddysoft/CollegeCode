/* this ALWAYS GENERATED file contains the definitions for the interfaces */


/* File created by MIDL compiler version 5.01.0164 */
/* at Thu Mar 24 15:53:59 2005
 */
/* Compiler settings for D:\Documents and Settings\madhur.MADHUR.000\Desktop\AniReg\AniReg.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __AniReg_h__
#define __AniReg_h__

#ifdef __cplusplus
extern "C"{
#endif 

/* Forward Declarations */ 

#ifndef __IAniEmp_FWD_DEFINED__
#define __IAniEmp_FWD_DEFINED__
typedef interface IAniEmp IAniEmp;
#endif 	/* __IAniEmp_FWD_DEFINED__ */


#ifndef __AniEmp_FWD_DEFINED__
#define __AniEmp_FWD_DEFINED__

#ifdef __cplusplus
typedef class AniEmp AniEmp;
#else
typedef struct AniEmp AniEmp;
#endif /* __cplusplus */

#endif 	/* __AniEmp_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

void __RPC_FAR * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void __RPC_FAR * ); 

#ifndef __IAniEmp_INTERFACE_DEFINED__
#define __IAniEmp_INTERFACE_DEFINED__

/* interface IAniEmp */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IAniEmp;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("C9265561-1922-426D-AA6A-0272866A6C59")
    IAniEmp : public IDispatch
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Func1( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Add_Emp( 
            int __MIDL_0015,
            BSTR __MIDL_0016,
            int __MIDL_0017) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Del_Emp( 
            int __MIDL_0018) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Search_Emp( 
            int __MIDL_0019) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Sort( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAniEmpVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *QueryInterface )( 
            IAniEmp __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void __RPC_FAR *__RPC_FAR *ppvObject);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *AddRef )( 
            IAniEmp __RPC_FAR * This);
        
        ULONG ( STDMETHODCALLTYPE __RPC_FAR *Release )( 
            IAniEmp __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfoCount )( 
            IAniEmp __RPC_FAR * This,
            /* [out] */ UINT __RPC_FAR *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetTypeInfo )( 
            IAniEmp __RPC_FAR * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ ITypeInfo __RPC_FAR *__RPC_FAR *ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *GetIDsOfNames )( 
            IAniEmp __RPC_FAR * This,
            /* [in] */ REFIID riid,
            /* [size_is][in] */ LPOLESTR __RPC_FAR *rgszNames,
            /* [in] */ UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ DISPID __RPC_FAR *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Invoke )( 
            IAniEmp __RPC_FAR * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS __RPC_FAR *pDispParams,
            /* [out] */ VARIANT __RPC_FAR *pVarResult,
            /* [out] */ EXCEPINFO __RPC_FAR *pExcepInfo,
            /* [out] */ UINT __RPC_FAR *puArgErr);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Func1 )( 
            IAniEmp __RPC_FAR * This);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Add_Emp )( 
            IAniEmp __RPC_FAR * This,
            int __MIDL_0015,
            BSTR __MIDL_0016,
            int __MIDL_0017);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Del_Emp )( 
            IAniEmp __RPC_FAR * This,
            int __MIDL_0018);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Search_Emp )( 
            IAniEmp __RPC_FAR * This,
            int __MIDL_0019);
        
        HRESULT ( STDMETHODCALLTYPE __RPC_FAR *Sort )( 
            IAniEmp __RPC_FAR * This);
        
        END_INTERFACE
    } IAniEmpVtbl;

    interface IAniEmp
    {
        CONST_VTBL struct IAniEmpVtbl __RPC_FAR *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAniEmp_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IAniEmp_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IAniEmp_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IAniEmp_GetTypeInfoCount(This,pctinfo)	\
    (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo)

#define IAniEmp_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo)

#define IAniEmp_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)

#define IAniEmp_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)


#define IAniEmp_Func1(This)	\
    (This)->lpVtbl -> Func1(This)

#define IAniEmp_Add_Emp(This,__MIDL_0015,__MIDL_0016,__MIDL_0017)	\
    (This)->lpVtbl -> Add_Emp(This,__MIDL_0015,__MIDL_0016,__MIDL_0017)

#define IAniEmp_Del_Emp(This,__MIDL_0018)	\
    (This)->lpVtbl -> Del_Emp(This,__MIDL_0018)

#define IAniEmp_Search_Emp(This,__MIDL_0019)	\
    (This)->lpVtbl -> Search_Emp(This,__MIDL_0019)

#define IAniEmp_Sort(This)	\
    (This)->lpVtbl -> Sort(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



HRESULT STDMETHODCALLTYPE IAniEmp_Func1_Proxy( 
    IAniEmp __RPC_FAR * This);


void __RPC_STUB IAniEmp_Func1_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE IAniEmp_Add_Emp_Proxy( 
    IAniEmp __RPC_FAR * This,
    int __MIDL_0015,
    BSTR __MIDL_0016,
    int __MIDL_0017);


void __RPC_STUB IAniEmp_Add_Emp_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE IAniEmp_Del_Emp_Proxy( 
    IAniEmp __RPC_FAR * This,
    int __MIDL_0018);


void __RPC_STUB IAniEmp_Del_Emp_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE IAniEmp_Search_Emp_Proxy( 
    IAniEmp __RPC_FAR * This,
    int __MIDL_0019);


void __RPC_STUB IAniEmp_Search_Emp_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


HRESULT STDMETHODCALLTYPE IAniEmp_Sort_Proxy( 
    IAniEmp __RPC_FAR * This);


void __RPC_STUB IAniEmp_Sort_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IAniEmp_INTERFACE_DEFINED__ */



#ifndef __ANIREGLib_LIBRARY_DEFINED__
#define __ANIREGLib_LIBRARY_DEFINED__

/* library ANIREGLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_ANIREGLib;

EXTERN_C const CLSID CLSID_AniEmp;

#ifdef __cplusplus

class DECLSPEC_UUID("439B55FF-8A5B-4537-9F81-40E680CBA0AA")
AniEmp;
#endif
#endif /* __ANIREGLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long __RPC_FAR *, unsigned long            , BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserMarshal(  unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
unsigned char __RPC_FAR * __RPC_USER  BSTR_UserUnmarshal(unsigned long __RPC_FAR *, unsigned char __RPC_FAR *, BSTR __RPC_FAR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long __RPC_FAR *, BSTR __RPC_FAR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif
