VERSION 5.00
Begin VB.Form frmopt 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Options"
   ClientHeight    =   6600
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6705
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6600
   ScaleWidth      =   6705
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdbrowse 
      Caption         =   "Browse"
      Height          =   315
      Index           =   3
      Left            =   5280
      TabIndex        =   29
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton cmdbrowse 
      Caption         =   "Browse"
      Height          =   315
      Index           =   2
      Left            =   5280
      TabIndex        =   28
      Top             =   4620
      Width           =   1215
   End
   Begin VB.CommandButton cmdbrowse 
      Caption         =   "Browse"
      Height          =   315
      Index           =   1
      Left            =   5280
      TabIndex        =   27
      Top             =   4200
      Width           =   1215
   End
   Begin VB.TextBox txtdir4 
      Height          =   285
      Left            =   3000
      TabIndex        =   26
      Top             =   5025
      Width           =   2175
   End
   Begin VB.TextBox txtdir3 
      Height          =   255
      Left            =   3000
      TabIndex        =   25
      Top             =   4620
      Width           =   2175
   End
   Begin VB.TextBox txtdir2 
      Height          =   285
      Left            =   3000
      TabIndex        =   24
      Top             =   4215
      Width           =   2175
   End
   Begin VB.CommandButton cmdbrowse 
      Caption         =   "Browse"
      Height          =   315
      Index           =   0
      Left            =   5280
      TabIndex        =   23
      Top             =   3780
      Width           =   1215
   End
   Begin VB.TextBox txtdir1 
      Height          =   285
      Left            =   3000
      TabIndex        =   22
      Top             =   3825
      Width           =   2175
   End
   Begin VB.CheckBox chksplash 
      Caption         =   "Delayed Splash Screen"
      Height          =   495
      Left            =   300
      TabIndex        =   21
      Top             =   4140
      Width           =   2115
   End
   Begin VB.CheckBox chksearch 
      Caption         =   "One button Search"
      Height          =   495
      Left            =   300
      TabIndex        =   20
      Top             =   4860
      Width           =   1875
   End
   Begin VB.Frame Frame6 
      Caption         =   "Dialog Box Folders"
      Height          =   2055
      Left            =   2880
      TabIndex        =   19
      Top             =   3480
      Width           =   3735
   End
   Begin VB.CheckBox chkflat 
      Caption         =   "Flat Toolbar"
      Height          =   495
      Left            =   300
      TabIndex        =   18
      Top             =   4500
      Width           =   1215
   End
   Begin VB.CheckBox chkscreen 
      Caption         =   "Show Splash Screen"
      Height          =   495
      Left            =   300
      TabIndex        =   17
      Top             =   3780
      Width           =   1815
   End
   Begin VB.Frame Frame5 
      Caption         =   "General"
      Height          =   2055
      Left            =   120
      TabIndex        =   16
      Top             =   3480
      Width           =   2535
   End
   Begin VB.CheckBox chktime 
      Caption         =   "Time"
      Height          =   495
      Left            =   3000
      TabIndex        =   15
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CheckBox chkfilesize 
      Caption         =   "File Size"
      Height          =   495
      Left            =   3000
      TabIndex        =   14
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Frame Frame4 
      Caption         =   "Status Bar View"
      Height          =   1395
      Left            =   2880
      TabIndex        =   13
      Top             =   1920
      Width           =   3735
   End
   Begin VB.ComboBox cbosize 
      Height          =   315
      Left            =   5760
      Style           =   2  'Dropdown List
      TabIndex        =   11
      Top             =   720
      Width           =   675
   End
   Begin VB.ComboBox cbofont 
      Height          =   315
      Left            =   3000
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   10
      Top             =   720
      Width           =   2565
   End
   Begin VB.OptionButton optdialog 
      Caption         =   "Customised Dialog Boxes"
      Height          =   495
      Index           =   1
      Left            =   240
      TabIndex        =   8
      Top             =   2760
      Width           =   2175
   End
   Begin VB.OptionButton optdialog 
      Caption         =   "Standard Dialog Boxes"
      Height          =   495
      Index           =   0
      Left            =   240
      TabIndex        =   7
      Top             =   2280
      Width           =   2055
   End
   Begin VB.Frame Frame2 
      Caption         =   "Dialog Type"
      Height          =   1395
      Left            =   120
      TabIndex        =   6
      Top             =   1920
      Width           =   2535
   End
   Begin VB.CheckBox chkstatus 
      Caption         =   "Status Bar"
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CheckBox chkformat 
      Caption         =   "Format Bar"
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   840
      Width           =   1215
   End
   Begin VB.CheckBox chkstandard 
      Caption         =   "Toolbar"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   480
      Width           =   1215
   End
   Begin VB.CommandButton cmcancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   345
      Left            =   1740
      TabIndex        =   1
      Top             =   6000
      Width           =   1215
   End
   Begin VB.CommandButton cmdok 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   3360
      TabIndex        =   0
      Top             =   6000
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "View"
      Height          =   1575
      Left            =   120
      TabIndex        =   5
      Top             =   240
      Width           =   2535
   End
   Begin VB.Frame Frame3 
      Caption         =   "Default Font"
      Height          =   1575
      Left            =   2880
      TabIndex        =   9
      Top             =   240
      Width           =   3735
   End
   Begin VB.Label Label2 
      Caption         =   "Label2"
      Height          =   495
      Left            =   3240
      TabIndex        =   12
      Top             =   960
      Width           =   1215
   End
End
Attribute VB_Name = "frmopt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim flatval As String
Dim flatkey As String
Dim lpAppName As String
Dim lpFileName As String
Dim lonstatus As String
Dim getstatus As Long
Dim vol, file As String
Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Command3_Click()

End Sub

Private Sub cmcancel_Click()
Unload Me
End Sub

Private Sub cmdOK_Click()
file = "c:\filedit.ini"
lpAppName = "Filedit"
flatval = chkflat.Value
flatkey = "FlatTool"
lpFileName = file
lonstatus = WritePrivateProfileString(lpAppName, flatkey, flatval, lpFileName)
Unload frmopt
End Sub

Private Sub Form_Initialize()
Dim i, j As Integer
For i = 0 To Screen.FontCount - 1
cbofont.AddItem Screen.fonts(i)
Next
cbofont.ListIndex = 0
For i = 2 To 72 Step 2
cbosize.AddItem i
Next
cbosize.ListIndex = 5

End Sub

Private Sub Form_Load()
Dim getflat As Long
Dim temp As String * 50
Dim flat As String
Dim lpdefault As String

lpdefault = 0
file = "c:\filedit.ini"
lpAppName = "Filedit"
flatkey = "Show Splash"
lpFileName = file
getflat = GetPrivateProfileString(lpAppName, flat, lpdefault, temp, Len(temp), lpFileName)
chkscreen.Value = Val(temp)

If chkscreen.Value = 1 Then
frmtext.pictool.Style = tbrFlat
frmtext.pictool1.Style = tbrFlat
Else
frmtext.pictool.Style = tbrStandard
frmtext.pictool1.Style = tbrStandard
End If
End Sub

