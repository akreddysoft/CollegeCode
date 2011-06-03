VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   2205
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6795
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2205
   ScaleWidth      =   6795
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   0  'None
      FillColor       =   &H80000004&
      FillStyle       =   0  'Solid
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   1200
      Picture         =   "fake.frx":0000
      ScaleHeight     =   735
      ScaleWidth      =   1575
      TabIndex        =   1
      Top             =   480
      Width           =   1575
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   2760
      Top             =   840
   End
   Begin ComctlLib.ProgressBar prgbar 
      Height          =   255
      Left            =   360
      TabIndex        =   0
      Top             =   1680
      Width           =   5295
      _ExtentX        =   9340
      _ExtentY        =   450
      _Version        =   327682
      Appearance      =   1
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   5040
      Picture         =   "fake.frx":08CA
      Top             =   480
      Width           =   480
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()

End Sub

Private Sub Form_Terminate()

End Sub

Private Sub Form_Unload(Cancel As Integer)
If prgbar.Value = 100 Then
Unload Me
Else
Cancel = 1
End If

End Sub

Private Sub Timer1_Timer()
prgbar.Value = prgbar.Value + 1
If prgbar.Value = 100 Then
Unload Me
End If

End Sub
