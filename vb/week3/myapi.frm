VERSION 5.00
Begin VB.Form frmmyapi 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "where is win"
      Height          =   495
      Left            =   1800
      TabIndex        =   1
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton cmdbeep 
      Caption         =   "beep"
      Height          =   495
      Left            =   1800
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "frmmyapi"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdbeep_Click()
Dim dummy
dummy = messagebeep(-1)
End Sub

Private Sub Command1_Click()
Dim result
Dim windir As String
windir = Space(144)
result = getwindowsdirectory(windir, 144)

If result = 0 Then
MsgBox "error"
Else
windir = Trim(windir)
MsgBox "windir:" + windir
End If
End Sub
