Attribute VB_Name = "Module1"
Public Const title0 As String = "Folder Guard: Disabling Protection"
Public Const title1 As String = "Folder Guard: Enabling Protection"
Public Const pass As String = "gold"
Public Const clas As String = "#32770"
Public Const edclass As String = "Edit"
Public Const btclass As String = "Button"
Public Const WM_SETTEXT As Long = &HC
Public Const WM_COMMAND As Long = &H111
Public Const EN_CLICKED As Integer = 0
Public Const password As String = "goldi"

Public Declare Function FindWindow Lib "user32" Alias _
"FindWindowA" (ByVal lpClassName As String, _
ByVal lpWindowName As String) As Long

Public Declare Function FindWindowEx Lib "user32" Alias _
"FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, _
ByVal lpsz1 As String, ByVal lpsz2 As String) As Long

Public Declare Function GetDlgCtrlID Lib "user32" _
(ByVal hwnd As Long) As Long

Public Declare Function SendMessage Lib "user32" Alias _
"SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, _
ByVal wparam As Long, ByVal lParam As String) As Long
