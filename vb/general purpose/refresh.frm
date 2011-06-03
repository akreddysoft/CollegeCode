VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.FileListBox File1 
      Height          =   1455
      Left            =   1080
      TabIndex        =   0
      Top             =   960
      Width           =   1935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Form_Click()
   ' Declare variables.
   Dim FilName, Msg As String, I As Integer
   File1.Pattern = "TestFile.*"   ' Set file pattern.
   For I = 1 To 8   ' Do eight times.
      FilName = "TESTFILE." & I
      ' Create empty file.
      Open FilName For Output As FreeFile
      File1.Refresh   ' Refresh file list box.
      Close   ' Close file.
   Next I
   Msg = "Choose OK to remove the created test files."
   MsgBox Msg   ' Display message.
   Kill "TESTFILE.*"   ' Remove test files.
   File1.Refresh   ' Update file list box.
End Sub


