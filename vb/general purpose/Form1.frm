VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Validation"
   ClientHeight    =   2700
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3345
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2700
   ScaleWidth      =   3345
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "set text and press button"
      Height          =   375
      Left            =   480
      TabIndex        =   3
      Top             =   1920
      Width           =   2295
   End
   Begin VB.CommandButton Command1 
      Caption         =   "ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   840
      TabIndex        =   2
      Top             =   1320
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      IMEMode         =   3  'DISABLE
      Left            =   360
      PasswordChar    =   "."
      TabIndex        =   0
      Top             =   600
      Width           =   2655
   End
   Begin VB.Label Label1 
      Caption         =   "Enter password"
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   120
      Width           =   3015
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim hdisable As Long
Dim henable As Long
Dim edhwnd As Long
Dim ctrlid As Long
Dim buthwndok As Long
Dim buthwndyes As Long
Dim butyesid As Long
Dim butokid As Long
Dim buthwndcancel As Long
Private Sub Command1_Click()
If Text1.Text = "gold" Then
    Shell ("c:\program files\winability\folder guard\fgkey.exe")
    Command2.Enabled = True
    Command2_Click
    Unload Me
Else
    Unload Me
End If
End Sub

Private Sub Command2_Click()
Dim test As Long
Dim test1 As Long
Dim wparam As Long
wparam = 1 'lowword identifier is 1 and highword notif=0
hdisable = FindWindow(clas, title0)
If hdisable = 0 Then
    henable = FindWindow(clas, title1)
    buthwndyes = FindWindowEx(henable, 0, btclass, "&Yes")
    test = SendMessage(henable, WM_COMMAND, wparam, buthwndyes)
    Unload Me
Else
    edhwnd = FindWindowEx(hdisable, 0, edclass, vbNullString)
    buthwndok = FindWindowEx(hdisable, 0, btclass, "OK")
    If edhwnd = 0 Or buthwndok = 0 Then
        MsgBox "child window not found", vbCritical
        Unload Me
    Else
        butokid = GetDlgCtrlID(buthwndok)
        If butokid = 0 Then
            MsgBox "ctrl id not found"
            Unload Me
        Else
            test = SendMessage(edhwnd, WM_SETTEXT, 0, password)
            test = SendMessage(hdisable, WM_COMMAND, wparam, buthwndok)
        End If
    End If
End If
End Sub

Private Sub Form_Load()
Command2.Enabled = False
End Sub
