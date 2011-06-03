VERSION 5.00
Begin VB.Form frmself 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   4875
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4875
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdsend 
      Caption         =   "send"
      Height          =   495
      Left            =   1560
      TabIndex        =   3
      Top             =   3240
      Width           =   1215
   End
   Begin VB.TextBox txtuserarea 
      Height          =   1815
      Left            =   1680
      MultiLine       =   -1  'True
      TabIndex        =   2
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton cmdexit 
      Caption         =   "exit"
      Height          =   495
      Left            =   1680
      TabIndex        =   1
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton cmdbeep 
      Caption         =   "&beep"
      Height          =   495
      Left            =   1680
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "frmself"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdbeep_Click()
Beep
MsgBox "the beep button was clicked"

End Sub

Private Sub cmdexit_Click()
End
End Sub

Private Sub cmdsend_Click()
AppActivate "form1"
SendKeys txtuserarea.Text, True

End Sub

