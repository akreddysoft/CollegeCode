VERSION 5.00
Begin VB.Form frmgame 
   AutoRedraw      =   -1  'True
   Caption         =   "Form1"
   ClientHeight    =   6450
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7665
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6450
   ScaleWidth      =   7665
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   3240
      Top             =   3000
   End
   Begin VB.PictureBox picico 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000A&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   500
      Left            =   2280
      Picture         =   "game.frx":0000
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   0
      Top             =   3840
      Width           =   500
   End
   Begin VB.Label lbly 
      Height          =   495
      Left            =   6240
      TabIndex        =   2
      Top             =   840
      Width           =   1215
   End
   Begin VB.Label lblx 
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   735
   End
End
Attribute VB_Name = "frmgame"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim a, b As Integer

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
'If x >= picico.Left And x <= (picico.Left + 500) And y >= picico.Top And y <= (picico.Top + 500) Then
'picico.Left = Rnd * frmgame.Width
'picico.Top = Rnd * frmgame.Height
'End If
'lblx.Caption = x
'lbly.Caption = y
a = x
b = y

End Sub

Private Sub Timer1_Timer()
If a >= picico.Left And a <= (picico.Left + 500) And b >= picico.Top And b <= (picico.Top + 500) Then
picico.Left = Rnd * frmgame.Width
picico.Top = Rnd * frmgame.Height
End If
lblx.Caption = a
lbly.Caption = b

End Sub
