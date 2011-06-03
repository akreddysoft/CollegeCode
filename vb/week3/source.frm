VERSION 5.00
Begin VB.Form frmsource 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   4815
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4260
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4815
   ScaleWidth      =   4260
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdexit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   1320
      TabIndex        =   2
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton cmdsend 
      Caption         =   "Send"
      Height          =   495
      Left            =   1320
      TabIndex        =   1
      Top             =   3360
      Width           =   1215
   End
   Begin VB.TextBox txtuserarea 
      Height          =   2055
      Left            =   600
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   720
      Width           =   2655
   End
End
Attribute VB_Name = "frmsource"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdexit_Click()
End
End Sub

Private Sub cmdsend_Click()
'make the destination prog active
AppActivate "the dest program"

'send characters to the dest prog
SendKeys txtuserarea.Text, True

End Sub

Private Sub Form_Load()
Dim id
'execute the dest prog
id = Shell("dest.exe", 1)
End Sub
