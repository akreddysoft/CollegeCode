VERSION 5.00
Begin VB.Form frmsize 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Form1"
   ClientHeight    =   4785
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6195
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4785
   ScaleWidth      =   6195
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picwin 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   720
      Left            =   360
      ScaleHeight     =   720
      ScaleWidth      =   720
      TabIndex        =   16
      Top             =   1320
      Width           =   720
   End
   Begin VB.PictureBox picdoc 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   720
      Left            =   360
      ScaleHeight     =   720
      ScaleWidth      =   720
      TabIndex        =   15
      Top             =   120
      Width           =   720
   End
   Begin VB.PictureBox picdesk 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   720
      Left            =   360
      ScaleHeight     =   720
      ScaleWidth      =   720
      TabIndex        =   14
      Top             =   3720
      Width           =   720
   End
   Begin VB.PictureBox picroot 
      AutoSize        =   -1  'True
      BackColor       =   &H8000000A&
      BorderStyle     =   0  'None
      Height          =   720
      Left            =   360
      ScaleHeight     =   720
      ScaleWidth      =   720
      TabIndex        =   13
      Top             =   2520
      Width           =   720
   End
   Begin VB.CommandButton cmdopen 
      Caption         =   "Open"
      Height          =   495
      Left            =   4440
      TabIndex        =   12
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton cmdcancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   495
      Left            =   1680
      TabIndex        =   9
      Top             =   4095
      Width           =   1215
   End
   Begin VB.DriveListBox drvdrive 
      Height          =   315
      Left            =   3840
      TabIndex        =   8
      Top             =   3480
      Width           =   1935
   End
   Begin VB.DirListBox dirdirectory 
      Height          =   1665
      Left            =   3840
      TabIndex        =   7
      Top             =   1200
      Width           =   1935
   End
   Begin VB.ComboBox cbofiletype 
      Height          =   315
      Left            =   1800
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   3480
      Width           =   1815
   End
   Begin VB.FileListBox filfiles 
      Height          =   1845
      Left            =   1800
      TabIndex        =   5
      Top             =   1080
      Width           =   1815
   End
   Begin VB.TextBox txtname 
      Height          =   375
      Left            =   1800
      TabIndex        =   4
      Top             =   600
      Width           =   1815
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Desktop"
      Height          =   255
      Left            =   120
      TabIndex        =   20
      Top             =   4560
      Width           =   1335
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "C:\"
      Height          =   255
      Left            =   120
      TabIndex        =   19
      Top             =   3360
      Width           =   1215
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "c:\windows"
      Height          =   255
      Left            =   120
      TabIndex        =   18
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "My Documents"
      Height          =   255
      Left            =   120
      TabIndex        =   17
      Top             =   960
      Width           =   1335
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Height          =   4815
      Left            =   0
      TabIndex        =   11
      Top             =   0
      Width           =   1575
   End
   Begin VB.Line Line1 
      X1              =   1560
      X2              =   1560
      Y1              =   0
      Y2              =   4800
   End
   Begin VB.Label lbldirname 
      Height          =   735
      Left            =   3840
      TabIndex        =   10
      Top             =   360
      Width           =   1935
   End
   Begin VB.Label lbldrive 
      Caption         =   "Drive"
      Height          =   255
      Left            =   3840
      TabIndex        =   3
      Top             =   3120
      Width           =   1815
   End
   Begin VB.Label lblfiletype 
      Caption         =   "File Type"
      Height          =   255
      Left            =   1800
      TabIndex        =   2
      Top             =   3120
      Width           =   855
   End
   Begin VB.Label lbldirectory 
      Caption         =   "Directories"
      Height          =   255
      Left            =   3960
      TabIndex        =   1
      Top             =   120
      Width           =   1095
   End
   Begin VB.Label lblfilename 
      Caption         =   "File Name"
      Height          =   255
      Left            =   1800
      TabIndex        =   0
      Top             =   120
      Width           =   855
   End
End
Attribute VB_Name = "frmsize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cbofiletype_Click()
Dim patternpos1 As Integer
Dim patternpos2 As Integer
Dim patternlen As Integer
Dim pattern As String

'find the start pos of pattern
patternpos1 = InStr(1, cbofiletype.Text, "(") + 1
'find the end position of pattern
patternpos2 = InStr(1, cbofiletype.Text, ")") - 1
'calculate teh eln
patternlen = patternpos2 = patternpos1 + 1
'extract teh pattern portion of cbofiletype
pattern = Mid(cbofiletype.Text, patternpos1, patternlen)

'set the pattern of filefiles
filfiles.pattern = pattern




'Select Case cbofiletype.ListIndex
'Case 0:
'filfiles.pattern = "*.*"
'Case 1:
'filfiles.pattern = "*.txt"
'Case 2:
'filfiles.pattern = "*.doc"
'End Select
End Sub

Private Sub cmdcancel_Click()
frmsize.Hide
End Sub
Private Sub cmdok_Click()




End Sub

Private Sub Data1_Validate(Action As Integer, Save As Integer)

End Sub

Private Sub cmdopen_Click()
Dim filenum
filenum = FreeFile
Dim content As String
Dim filename As String
Dim path As String

path = dirdirectory.path
'content = frmtext.txtext.text

'If Right(filfiles.path, 1) <> "\" Then
'path = filfiles.path + "\"
'Else
'path = filfiles.path
'End If

'extract the path and name of file
'If txtname.Text = filfiles.filename Then
filename = txtname.Text
filenum = FreeFile
Open filename For Input As filenum
frmtext.txtext.Text = Input(LOF(filenum), filenum)
Close filenum
frmsize.Hide

End Sub

Private Sub Command1_Click()

End Sub

Private Sub dirdirectory_Change()
filfiles.path = dirdirectory.path
lbldirname.Caption = dirdirectory.path


End Sub

Private Sub drvdrive_Change()
On Error GoTo error
dirdirectory.path = drvdrive.Drive
Exit Sub

error:
MsgBox "drive error"
Exit Sub
End Sub

Private Sub filfiles_Click()
txtname.Text = filfiles.filename

End Sub

Private Sub filfiles_DblClick()
txtname.Text = filfiles.filename
cmdok_Click
End Sub

Private Sub Form_Load()
cbofiletype.AddItem "all files(*.*)"
cbofiletype.AddItem "text files(*.txt)"
cbofiletype.AddItem "doc files(*.doc)"
cbofiletype.ListIndex = 0
lbldirname.Caption = dirdirectory.path
End Sub

Private Sub Image1_Click()

End Sub

Private Sub picdesk_Click()
dirdirectory.path = "c:\windows\desktop"
drvdrive.Drive = dirdirectory.path

End Sub

Private Sub picdesk_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picdesk.BorderStyle = 1
End Sub

Private Sub picdesk_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picdesk.BorderStyle = 0
End Sub

Private Sub picdoc_Click()
dirdirectory.path = "c:\my documents"
drvdrive.Drive = dirdirectory.path
End Sub

Private Sub picdoc_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picdoc.BorderStyle = 1

End Sub

Private Sub picdoc_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picdoc.BorderStyle = 0
End Sub

Private Sub picroot_Click()
dirdirectory.path = "c:\"
drvdrive.Drive = dirdirectory.path

End Sub

Private Sub picroot_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picroot.BorderStyle = 1
End Sub

Private Sub picroot_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picroot.BorderStyle = 0
End Sub

Private Sub picwin_Click()
dirdirectory.path = "c:\windows"
drvdrive.Drive = dirdirectory.path

End Sub

Private Sub picwin_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picwin.BorderStyle = 1
End Sub

Private Sub picwin_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picwin.BorderStyle = 0
End Sub
