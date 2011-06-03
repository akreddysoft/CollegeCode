// Set LANANUM and LOCALNAME as appropriate for your system
#include"windows.h"
#include"stdio.h"
#define LANANUM     2
#define LOCALNAME   "madhur"
#define NBCheck(x)  if (NRC_GOODRET != x.ncb_retcode) { \
				    printf("Line %d: Got 0x%x from NetBios()\n", \
                               __LINE__, x.ncb_retcode); \
                    }

void MakeNetbiosName (char *, LPCSTR);
BOOL NBAddName (int, LPCSTR);
BOOL NBReset (int, int, int);
BOOL NBListNames (int, LPCSTR);
BOOL NBAdapterStatus (int, PVOID, int, LPCSTR);

void main ()
{
    if (!NBReset (LANANUM, 20, 30)) return;

    if (!NBAddName (LANANUM, LOCALNAME)) return;

    if (!NBListNames (LANANUM, LOCALNAME)) return;

    printf ("Succeeded.\n");
}

BOOL NBReset (int nLana, int nSessions, int nNames)
{
    NCB ncb;

    memset (&ncb, 0, sizeof (ncb));
    ncb.ncb_command = NCBRESET;
    ncb.ncb_lsn = 0;                // Allocate new lana_num resources 
    ncb.ncb_lana_num = nLana;
    ncb.ncb_callname[0] = nSessions;  // maximum sessions 
    ncb.ncb_callname[2] = nNames;   // maximum names 

    Netbios (&ncb);
    NBCheck (ncb);

    return (NRC_GOODRET == ncb.ncb_retcode);
}

BOOL NBAddName (int nLana, LPCSTR szName)
{
    NCB ncb;
	char str[100];

	strcpy(str,(char *)ncb.ncb_name);


    memset (&ncb, 0, sizeof (ncb));
    ncb.ncb_command = NCBADDNAME;
    ncb.ncb_lana_num = nLana;

    MakeNetbiosName (str, szName);

    Netbios (&ncb);
    NBCheck (ncb);

    return (NRC_GOODRET == ncb.ncb_retcode);
}

// Build a name of length NCBNAMSZ, padding with spaces.
void MakeNetbiosName (char *achDest, LPCSTR szSrc)
{
    int cchSrc;

    cchSrc = lstrlen (szSrc);
    if (cchSrc > NCBNAMSZ)
        cchSrc = NCBNAMSZ;

    memset (achDest, ' ', NCBNAMSZ);
    memcpy (achDest, szSrc, cchSrc);
}

BOOL NBListNames (int nLana, LPCSTR szName)
{
    int cbBuffer;
    ADAPTER_STATUS *pStatus;
    NAME_BUFFER *pNames;
    int i;
    HANDLE hHeap;

    hHeap = GetProcessHeap();

    // Allocate the largest buffer that might be needed. 
    cbBuffer = sizeof (ADAPTER_STATUS) + 255 * sizeof (NAME_BUFFER);
    pStatus = (ADAPTER_STATUS *) HeapAlloc (hHeap, 0, cbBuffer);
    if (NULL == pStatus)
        return FALSE;

    if (!NBAdapterStatus (nLana, (PVOID) pStatus, cbBuffer, szName))
    {
        HeapFree (hHeap, 0, pStatus);
        return FALSE;
    }

    // The list of names follows the adapter status structure.
    pNames = (NAME_BUFFER *) (pStatus + 1);

    for (i = 0; i < pStatus->name_count; i++)
        printf ("\t%.*s\n", NCBNAMSZ, pNames[i].name);

    HeapFree (hHeap, 0, pStatus);

    return TRUE;
}
BOOL NBAdapterStatus (int nLana, PVOID pBuffer, int cbBuffer, LPCSTR szName)
{
    NCB ncb;
	char str[100];

	strcpy(str,(char *)ncb.ncb_callname);

    memset (&ncb, 0, sizeof (ncb));
    ncb.ncb_command = NCBASTAT;
    ncb.ncb_lana_num = nLana;

    ncb.ncb_buffer = (PUCHAR) pBuffer;
    ncb.ncb_length = cbBuffer;

    MakeNetbiosName (str, szName);

    Netbios (&ncb);
    NBCheck (ncb);

    return (NRC_GOODRET == ncb.ncb_retcode);
}