VERSION 5.00
Begin VB.Form frmpicture1 
   BackColor       =   &H0000FFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Picture 1 Child"
   ClientHeight    =   1485
   ClientLeft      =   45
   ClientTop       =   615
   ClientWidth     =   3645
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1485
   ScaleWidth      =   3645
   Begin VB.CommandButton cmdclose 
      Caption         =   "Close"
      Height          =   495
      Left            =   1080
      TabIndex        =   0
      Top             =   720
      Width           =   1215
   End
   Begin VB.Image imgclub 
      Height          =   330
      Left            =   480
      Picture         =   "picture1.frx":0000
      Top             =   240
      Width           =   360
   End
   Begin VB.Menu mnufile 
      Caption         =   "file"
      Begin VB.Menu mnuclose 
         Caption         =   "close"
      End
   End
   Begin VB.Menu mnubeep 
      Caption         =   "beep"
      Begin VB.Menu mnuonce 
         Caption         =   "beep once"
      End
      Begin VB.Menu mnutwice 
         Caption         =   "twice"
      End
   End
End
Attribute VB_Name = "frmpicture1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdclose_Click()
Unload frmpicture1

End Sub

Private Sub mnuclose_Click()
Unload frmpicture1
End Sub

Private Sub mnuonce_Click()
Beep
End Sub

Private Sub mnutwice_Click()
Beep
MsgBox "beep again"
Beep

End Sub
