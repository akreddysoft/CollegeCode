VERSION 5.00
Begin VB.Form frmopt 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options"
   ClientHeight    =   6600
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6705
   Icon            =   "frmopt.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6600
   ScaleWidth      =   6705
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdbrowse 
      Caption         =   "Browse"
      Enabled         =   0   'False
      Height          =   315
      Index           =   3
      Left            =   5280
      TabIndex        =   28
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton cmdbrowse 
      Caption         =   "Browse"
      Enabled         =   0   'False
      Height          =   315
      Index           =   2
      Left            =   5280
      TabIndex        =   27
      Top             =   4620
      Width           =   1215
   End
   Begin VB.CommandButton cmdbrowse 
      Caption         =   "Browse"
      Enabled         =   0   'False
      Height          =   315
      Index           =   1
      Left            =   5280
      TabIndex        =   26
      Top             =   4200
      Width           =   1215
   End
   Begin VB.TextBox txtdir4 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3000
      TabIndex        =   25
      Top             =   5025
      Width           =   2175
   End
   Begin VB.TextBox txtdir3 
      Enabled         =   0   'False
      Height          =   255
      Left            =   3000
      TabIndex        =   24
      Top             =   4620
      Width           =   2175
   End
   Begin VB.TextBox txtdir2 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3000
      TabIndex        =   23
      Top             =   4215
      Width           =   2175
   End
   Begin VB.CommandButton cmdbrowse 
      Caption         =   "Browse"
      Enabled         =   0   'False
      Height          =   315
      Index           =   0
      Left            =   5280
      TabIndex        =   22
      Top             =   3780
      Width           =   1215
   End
   Begin VB.TextBox txtdir1 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3000
      TabIndex        =   21
      Top             =   3825
      Width           =   2175
   End
   Begin VB.CheckBox chksplash 
      Caption         =   "Delayed Splash Screen"
      Enabled         =   0   'False
      Height          =   495
      Left            =   300
      TabIndex        =   20
      Top             =   4140
      Width           =   2115
   End
   Begin VB.CheckBox chksearch 
      Caption         =   "One button Search"
      Enabled         =   0   'False
      Height          =   495
      Left            =   300
      TabIndex        =   19
      Top             =   4860
      Width           =   1875
   End
   Begin VB.Frame Frame6 
      Caption         =   "Dialog Box Folders"
      Enabled         =   0   'False
      Height          =   2055
      Left            =   2880
      TabIndex        =   18
      Top             =   3480
      Width           =   3735
   End
   Begin VB.CheckBox chkflat 
      Caption         =   "Flat Toolbar"
      Enabled         =   0   'False
      Height          =   495
      Left            =   300
      TabIndex        =   17
      Top             =   4500
      Width           =   1215
   End
   Begin VB.CheckBox chkscreen 
      Caption         =   "Show Splash Screen"
      Enabled         =   0   'False
      Height          =   495
      Left            =   300
      TabIndex        =   16
      Top             =   3780
      Width           =   1815
   End
   Begin VB.Frame Frame5 
      Caption         =   "General"
      Enabled         =   0   'False
      Height          =   2055
      Left            =   120
      TabIndex        =   15
      Top             =   3480
      Width           =   2535
   End
   Begin VB.CheckBox chktime 
      Caption         =   "Time"
      Enabled         =   0   'False
      Height          =   495
      Left            =   3000
      TabIndex        =   14
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CheckBox chkfilesize 
      Caption         =   "File Size"
      Enabled         =   0   'False
      Height          =   495
      Left            =   3000
      TabIndex        =   13
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Frame Frame4 
      Caption         =   "Status Bar View"
      Enabled         =   0   'False
      Height          =   1395
      Left            =   2880
      TabIndex        =   12
      Top             =   1920
      Width           =   3735
   End
   Begin VB.ComboBox cbosize 
      Enabled         =   0   'False
      Height          =   315
      Left            =   5760
      Style           =   2  'Dropdown List
      TabIndex        =   11
      Top             =   720
      Width           =   675
   End
   Begin VB.ComboBox cbofont 
      Enabled         =   0   'False
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
      Enabled         =   0   'False
      Height          =   495
      Index           =   1
      Left            =   240
      TabIndex        =   8
      Top             =   2760
      Width           =   2175
   End
   Begin VB.OptionButton optdialog 
      Caption         =   "Standard Dialog Boxes"
      Enabled         =   0   'False
      Height          =   495
      Index           =   0
      Left            =   240
      TabIndex        =   7
      Top             =   2280
      Width           =   2055
   End
   Begin VB.Frame Frame2 
      Caption         =   "Dialog Type"
      Enabled         =   0   'False
      Height          =   1395
      Left            =   120
      TabIndex        =   6
      Top             =   1920
      Width           =   2535
   End
   Begin VB.CheckBox chkstatus 
      Caption         =   "Status Bar"
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CheckBox chkformat 
      Caption         =   "Format Bar"
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   840
      Width           =   1215
   End
   Begin VB.CheckBox chkstandard 
      Caption         =   "Toolbar"
      Enabled         =   0   'False
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
      Top             =   6180
      Width           =   1215
   End
   Begin VB.CommandButton cmdok 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   3360
      TabIndex        =   0
      Top             =   6180
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "View"
      Enabled         =   0   'False
      Height          =   1575
      Left            =   120
      TabIndex        =   5
      Top             =   240
      Width           =   2535
   End
   Begin VB.Frame Frame3 
      Caption         =   "Default Font"
      Enabled         =   0   'False
      Height          =   1575
      Left            =   2880
      TabIndex        =   9
      Top             =   240
      Width           =   3735
   End
   Begin VB.Label Label1 
      Caption         =   "These options are not available in Lite Version of Filedit"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   555
      Left            =   180
      TabIndex        =   31
      Top             =   5820
      Width           =   6375
   End
   Begin VB.Label Label2 
      Caption         =   "Label2"
      Enabled         =   0   'False
      Height          =   495
      Left            =   3240
      TabIndex        =   30
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "Label3"
      Height          =   195
      Left            =   1500
      TabIndex        =   29
      Top             =   1920
      Width           =   675
   End
End
Attribute VB_Name = "frmopt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Command3_Click()

End Sub

Private Sub cmcancel_Click()
Unload Me
End Sub

Private Sub cmdOK_Click()
Unload frmopt
End Sub

Private Sub Form_Initialize()
Dim i, j As Integer
For i = 0 To Screen.FontCount - 1
cbofont.AddItem Screen.Fonts(i)
Next
cbofont.ListIndex = 0
For i = 2 To 72 Step 2
cbosize.AddItem i
Next
cbosize.ListIndex = 5

End Sub

