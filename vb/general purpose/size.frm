VERSION 5.00
Begin VB.Form drvdrive 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   4785
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6195
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4785
   ScaleWidth      =   6195
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdok 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   495
      Left            =   3120
      TabIndex        =   10
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton cmdcancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   495
      Left            =   1320
      TabIndex        =   9
      Top             =   4080
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
      Height          =   1440
      Left            =   3840
      TabIndex        =   7
      Top             =   1440
      Width           =   1815
   End
   Begin VB.ComboBox cbofiletype 
      Height          =   315
      Left            =   240
      Style           =   2  'Dropdown List
      TabIndex        =   6
      Top             =   3480
      Width           =   1935
   End
   Begin VB.FileListBox filfiles 
      Height          =   1260
      Left            =   240
      TabIndex        =   5
      Top             =   1560
      Width           =   1815
   End
   Begin VB.TextBox txtname 
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   960
      Width           =   1815
   End
   Begin VB.Label lbldirname 
      Height          =   735
      Left            =   3840
      TabIndex        =   11
      Top             =   720
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
      Left            =   240
      TabIndex        =   2
      Top             =   3120
      Width           =   855
   End
   Begin VB.Label lbldirectory 
      Caption         =   "Directories"
      Height          =   255
      Left            =   3960
      TabIndex        =   1
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label lblfilename 
      Caption         =   "File Name"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   855
   End
End
Attribute VB_Name = "drvdrive"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cbofiletype_Click()
Select Case cbofiletype.ListIndex
Case 0:
filfiles.Pattern = "*.*"
Case 1:
filfiles.Pattern = "*.txt"
Case 2:
filfiles.Pattern = "*.doc"
End Select
End Sub

Private Sub cmdcancel_Click()
End
End Sub


Private Sub cmdok_Click()
Dim pathandname As String
Dim filesize As String
Dim path As String

'sizeof = Len(filfiles.FileName)
'if no file is selected,tell the user and exit
If txtname.Text = "" Then
MsgBox "you must first select a file!"
Exit Sub
End If

'make sure that the path ends with backslash
If Right(filfiles.path, 1) <> "\" Then
path = filfiles.path + "\"
Else
path = filfiles.path
End If

'extract the path and name of file
If txtname.Text = filfiles.FileName Then
pathandname = path + filfiles.FileName
Else
pathandname = txtname.Text
End If

'the next state may cause error,so set error trap
On Error GoTo filelenerror

filesize = Str(FileLen(pathandname))

'display the size offile
MsgBox "Size of" + pathandname + ":" + filesize + "bytes"
Exit Sub

filelenerror:
MsgBox "cannot find size of" + pathandname
Exit Sub

End Sub

Private Sub Data1_Validate(Action As Integer, Save As Integer)

End Sub

Private Sub dirdirectory_Change()
filfiles.path = dirdirectory.path
lbldirname.Caption = dirdirectory.path
'txtname.Text = filfiles.FileName

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
txtname.Text = filfiles.FileName

End Sub

Private Sub filfiles_DblClick()
txtname.Text = filfiles.FileName
cmdok_Click
End Sub

Private Sub Form_Load()
cbofiletype.AddItem "all files(*.*)"
cbofiletype.AddItem "text files(*.txt)"
cbofiletype.AddItem "doc files(*.doc)"
cbofiletype.ListIndex = 0
lbldirname.Caption = dirdirectory.path
End Sub

