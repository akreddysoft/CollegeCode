VERSION 5.00
Begin VB.Form frmfind 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Find"
   ClientHeight    =   2970
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5175
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2970
   ScaleWidth      =   5175
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdreplace1 
      Cancel          =   -1  'True
      Caption         =   "Replace"
      Height          =   345
      Left            =   3840
      TabIndex        =   9
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox txtreplace 
      Height          =   300
      Left            =   1320
      TabIndex        =   8
      Top             =   2280
      Width           =   2355
   End
   Begin VB.CommandButton cmdreplace 
      Caption         =   "Replace >>"
      Height          =   345
      Left            =   3825
      TabIndex        =   6
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdnext 
      Caption         =   "Find Next"
      Height          =   345
      Left            =   3825
      TabIndex        =   5
      Top             =   225
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CheckBox chkmatch 
      Caption         =   "Match  case"
      Height          =   495
      Left            =   300
      TabIndex        =   4
      Top             =   900
      Width           =   1215
   End
   Begin VB.CommandButton cmdcancel 
      Caption         =   "Cancel"
      Height          =   345
      Left            =   3825
      TabIndex        =   3
      Top             =   705
      Width           =   1215
   End
   Begin VB.CommandButton cmdfind 
      Caption         =   "Find"
      Default         =   -1  'True
      Height          =   345
      Left            =   3810
      TabIndex        =   2
      Top             =   210
      Width           =   1215
   End
   Begin VB.TextBox txtfind 
      Height          =   300
      Left            =   1095
      TabIndex        =   1
      Top             =   225
      Width           =   2535
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Replace With : "
      Height          =   195
      Left            =   120
      TabIndex        =   7
      Top             =   2280
      Width           =   1110
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Find What:"
      Height          =   195
      Left            =   150
      TabIndex        =   0
      Top             =   255
      Width           =   780
   End
End
Attribute VB_Name = "frmfind"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim search As String
Private Sub cmdcancel_Click()
Unload frmfind
End Sub

Private Sub cmdfind_Click()
search = txtfind.Text
lookup (search)
End Sub

Private Sub cmdnext_Click()
Const conBtns = vbOKOnly + vbInformation + vbDefaultButton1 + vbApplicationModal
Const conMsg As String = "The search string was not found."
Dim result, begsearch As Integer

begsearch = frmtext.txtext.SelStart + 2
result = InStr(begsearch, frmtext.txtext.Text, search, 1)

If result <> 0 Then
frmtext.txtext.SelStart = result - 1
frmtext.txtext.SelLength = Len(search)
Else
MsgBox conMsg, conBtns, "Filedit"
End If
End Sub

Private Sub cmdreplace_Click()
If cmdreplace.Caption = "Replace >>" Then
frmfind.Height = 3300
cmdreplace.Caption = "Replace <<"
Else
cmdreplace.Caption = "Replace >>"
frmfind.Height = 2010
End If
End Sub

Private Sub cmdreplace1_Click()
Dim replace As Variant
replace = txtreplace.Text
lookup (search)
If frmtext.txtext.SelLength = 0 Then
MsgBox txtfind.Text + "not found", vbInformation, "Filedit"
Else
frmtext.txtext.SelText = replace
End If
End Sub

Private Sub Form_Load()
frmfind.Height = 2010
If txtfind.Text = "" Then
cmdfind.Enabled = False
End If
End Sub

Private Sub txtfind_Change()
If txtfind.Text = "" Then
cmdfind.Enabled = False
Else
cmdfind.Enabled = True
End If
End Sub

Private Sub txtreplace_Change()
If txtreplace.Text = "" Then
cmdreplace1.Enabled = False
End If
End Sub

Private Sub lookup(search As Variant)
Const conBtns = vbOKOnly + vbInformation + vbDefaultButton1 + vbApplicationModal
Const conMsg As String = "The search string was not found."
Dim result As Integer

result = InStr(1, frmtext.txtext.Text, search, vbTextCompare)
If result <> 0 Then
frmtext.txtext.SelStart = result - 1
frmtext.txtext.SelLength = Len(search)
cmdfind.Visible = False
cmdnext.Visible = True
'cmdfind.Caption = "Find Next" '''''search at one click
Else
frmfind.Hide
Unload frmfind
MsgBox conMsg, conBtns, "Filedit"
End If

End Sub

Private Sub lookup1(search As Variant)
Do Until frmtext.txtext.SelStart = Len(frmtext.txtext.Text)
frmtext.txtext.SelLength = Len(search)
If frmtext.txtext.SelText = search Then Exit Sub
frmtext.txtext.SelStart = frmtext.txtext.SelStart + 1
Loop

If frmtext.txtext.SelLength = 0 Then
MsgBox search + "not found", vbInformation, "Filedit"
End If

End Sub
