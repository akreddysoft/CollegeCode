VERSION 5.00
Begin VB.Form frmsize 
   BackColor       =   &H00C0C0C0&
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
   Begin VB.CommandButton cmdopen 
      Caption         =   "Open"
      Height          =   375
      Left            =   2040
      TabIndex        =   13
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton cmdok 
      Caption         =   "Save"
      Default         =   -1  'True
      Height          =   375
      Left            =   2040
      TabIndex        =   10
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton cmdcancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   360
      Left            =   4200
      TabIndex        =   9
      Top             =   4200
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
      Height          =   1890
      Left            =   3840
      TabIndex        =   7
      Top             =   1065
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
      Width           =   1800
   End
   Begin VB.Line Line2 
      BorderColor     =   &H8000000E&
      BorderWidth     =   2
      X1              =   1485
      X2              =   1485
      Y1              =   135
      Y2              =   4920
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      BorderStyle     =   6  'Inside Solid
      X1              =   1440
      X2              =   1440
      Y1              =   15
      Y2              =   4785
   End
   Begin VB.Image picdesk 
      Height          =   720
      Left            =   420
      Picture         =   "select1.frx":0000
      Top             =   3675
      Width           =   720
   End
   Begin VB.Image picroot 
      Height          =   720
      Left            =   390
      Picture         =   "select1.frx":0ECA
      Top             =   2520
      Width           =   720
   End
   Begin VB.Image picwin 
      Height          =   720
      Left            =   405
      Picture         =   "select1.frx":1D94
      Top             =   1410
      Width           =   720
   End
   Begin VB.Image picdoc 
      Height          =   720
      Left            =   360
      Picture         =   "select1.frx":2C5E
      Top             =   135
      Width           =   720
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Desktop"
      Height          =   255
      Left            =   105
      TabIndex        =   17
      Top             =   4425
      Width           =   1335
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "C:\"
      Height          =   255
      Left            =   120
      TabIndex        =   16
      Top             =   3360
      Width           =   1215
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "c:\windows"
      Height          =   255
      Left            =   120
      TabIndex        =   15
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "My Documents"
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   960
      Width           =   1335
   End
   Begin VB.Label lbldirname 
      Height          =   735
      Left            =   3840
      TabIndex        =   11
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
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Height          =   4845
      Left            =   60
      TabIndex        =   12
      Top             =   -60
      Width           =   1335
   End
End
Attribute VB_Name = "frmsize"
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
Unload frmsize
End Sub
Private Sub cmdOK_Click()

Dim path As String
path = dirdirectory.path
If Right(filfiles.path, 1) <> "\" Then
path = filfiles.path + "\"
Else
path = filfiles.path
End If
filename = path + txtname.Text
'path +filename shud be given here
'otherwise file would be saved in the startup dir
'of filfiles.path or dir.path
Unload frmsize

Call frmtext.savefile(filename)

End Sub
Private Sub cmdopen_Click()
'On Error GoTo error
Dim path As String
path = dirdirectory.path
If Right(filfiles.path, 1) <> "\" Then
path = filfiles.path + "\"
Else
path = filfiles.path
End If
filename = path + filfiles.filename
Unload frmsize

Call frmtext.openfile(filename)

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
Private Sub Form_Load()
cbofiletype.AddItem "all files(*.*)"
cbofiletype.AddItem "text files(*.txt)"
cbofiletype.AddItem "doc files(*.doc)"
cbofiletype.ListIndex = 1
lbldirname.Caption = dirdirectory.path
Line1.Y1 = 0
Line2.Y1 = 0

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
dirdirectory.path = windir
drvdrive.Drive = dirdirectory.path

End Sub

Private Sub picwin_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
picwin.BorderStyle = 1
End Sub

Private Sub picwin_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
picwin.BorderStyle = 0
End Sub

