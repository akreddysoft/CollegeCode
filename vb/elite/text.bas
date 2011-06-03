Attribute VB_Name = "Module1"
Option Explicit
''''''**********Filedit Lite By Madhur Ahuja***********''''''
'This code should no be changed in any form or another.
'The author is not responsible for any damage caused_
'to a system using this code. Use at your own risk.
'email your comments to madhur_ahuja@vsnl.net"

Public Declare Function GetWindowsDirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Public Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Public Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Public Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Global dummy As Long
Global windir As String
Global leng As String
Global filename As Variant

