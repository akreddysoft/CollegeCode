Attribute VB_Name = "Module1"
Option Explicit
''''''**********Filedit By Madhur Ahuja***********''''''
'This code should no be changed in any form or another.
'The author is not responsible for any damage caused_
'to a system using this code. Use at your own risk.

Public Declare Function GetWindowsDirectory Lib "kernel32" _
Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, _
ByVal nSize As Long) As Long

Public Declare Function GetPrivateProfileString Lib _
"kernel32" Alias "GetPrivateProfileStringA" _
(ByVal lpApplicationName As String, ByVal lpKeyName As Any, _
ByVal lpdefault As String, _
ByVal lpReturnedString As String, ByVal nSize As Long, _
ByVal lpFileName As String) As Long

Public Declare Function GetProfileSection Lib "kernel32" _
Alias "GetProfileSectionA" (ByVal lpAppName As String, _
ByVal lpReturnedString As String, ByVal nSize As Long) _
As Long

Public Declare Function WritePrivateProfileSection Lib _
"kernel32" Alias "WritePrivateProfileSectionA" _
(ByVal lpAppName As String, ByVal lpString As String, _
ByVal lpFileName As String) As Long

Public Declare Function WritePrivateProfileString Lib _
"kernel32" Alias "WritePrivateProfileStringA" _
(ByVal lpApplicationName As String, ByVal lpKeyName As Any, _
ByVal lpString As Any, ByVal lpFileName As String) _
As Long

Public Declare Function GetComputerName Lib "kernel32" _
Alias "GetComputerNameA" (ByVal lpBuffer As String, _
nSize As Long) As Long

Public Declare Function GetUserName Lib "advapi32.dll" _
Alias "GetUserNameA" (ByVal lpBuffer As String, _
nSize As Long) As Long

Global wind As String
Global windir As String
Global leng As String
Global filename As String

