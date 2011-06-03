VERSION 5.00
Begin VB.Form frmpicture3 
   BackColor       =   &H0000FFFF&
   Caption         =   "Picture 3 Chld"
   ClientHeight    =   1545
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3300
   LinkTopic       =   "Form3"
   MDIChild        =   -1  'True
   ScaleHeight     =   1545
   ScaleWidth      =   3300
   Begin VB.CommandButton cmdclose 
      Caption         =   "Close"
      Height          =   495
      Left            =   1200
      TabIndex        =   0
      Top             =   840
      Width           =   1215
   End
   Begin VB.Image Image1 
      Height          =   330
      Left            =   720
      Picture         =   "picture3.frx":0000
      Top             =   480
      Width           =   360
   End
End
Attribute VB_Name = "frmpicture3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdclose_Click()
Unload frmpicture3
End Sub
