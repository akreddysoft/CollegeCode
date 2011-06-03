/* this file contains the actual definitions of */
/* the IIDs and CLSIDs */

/* link this file in with the server and any clients */


/* File created by MIDL compiler version 5.01.0164 */
/* at Thu Mar 24 15:53:59 2005
 */
/* Compiler settings for D:\Documents and Settings\madhur.MADHUR.000\Desktop\AniReg\AniReg.idl:
    Oicf (OptLev=i2), W1, Zp8, env=Win32, ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
*/
//@@MIDL_FILE_HEADING(  )
#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

const IID IID_IAniEmp = {0xC9265561,0x1922,0x426D,{0xAA,0x6A,0x02,0x72,0x86,0x6A,0x6C,0x59}};


const IID LIBID_ANIREGLib = {0xE000165D,0x8FA6,0x4517,{0xB7,0x60,0xA4,0x3B,0xA3,0x64,0xB8,0x5E}};


const CLSID CLSID_AniEmp = {0x439B55FF,0x8A5B,0x4537,{0x9F,0x81,0x40,0xE6,0x80,0xCB,0xA0,0xAA}};


#ifdef __cplusplus
}
#endif

