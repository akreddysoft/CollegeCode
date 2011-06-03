VERSION 5.00
Begin VB.Form frmpicture2 
   BackColor       =   &H0000FFFF&
   Caption         =   "Picture 2 Child"
   ClientHeight    =   1680
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3555
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   1680
   ScaleWidth      =   3555
   Begin VB.CommandButton cmdclose 
      Caption         =   "Close"
      Height          =   495
      Left            =   1080
      TabIndex        =   0
      Top             =   840
      Width           =   1215
   End
   Begin VB.Image imgcup 
      Height          =   330
      Left            =   600
      Picture         =   "picture2.frx":0000
      Top             =   360
      Width           =   360
   End
End
Attribute VB_Name = "frmpicture2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdclose_Click()
Unload frmpicture2
End Sub
