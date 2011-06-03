#include<windows.h>

SERVICE_STATUS          MyServiceStatus; 
SERVICE_STATUS_HANDLE   MyServiceStatusHandle; 

VOID  MyServiceStart (DWORD argc, LPTSTR *argv); 
VOID  MyServiceCtrlHandler (DWORD opcode); 
DWORD MyServiceInitialization (DWORD argc, LPTSTR *argv, 
        DWORD *specificError); 

int main(int argc,char **argv)
{

	SERVICE_TABLE_ENTRY   DispatchTable[] = 
    { 
        { "Telnet Server", MyServiceStart      }, 
        { NULL,              NULL          } 
    }; 


	if (!StartServiceCtrlDispatcher( DispatchTable)) 
    { 
        SvcDebugOut(" [MY_SERVICE] StartServiceCtrlDispatcher error = 
            %d\n", GetLastError()); 
    } 

}


VOID SvcDebugOut(LPSTR String, DWORD Status) 
{ 
    CHAR  Buffer[1024]; 
    if (strlen(String) < 1000) 
    { 
        sprintf(Buffer, String, Status); 
        OutputDebugStringA(Buffer); 
    } 
} 
 
