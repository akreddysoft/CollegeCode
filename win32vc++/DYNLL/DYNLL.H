
// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the DYNLL_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// DYNLL_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
#ifdef DYNLL_EXPORTS
#define DYNLL_API __declspec(dllexport)
#else
#define DYNLL_API __declspec(dllimport)
#endif

// This class is exported from the dynll.dll
class DYNLL_API CDynll {
public:
	CDynll(void);
	// TODO: add your methods here.
};

extern DYNLL_API int nDynll;

DYNLL_API int fnDynll(void);

