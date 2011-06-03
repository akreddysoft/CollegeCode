VERSION 5.00
Begin VB.Form frmtemplate 
   Caption         =   "Untitled"
   ClientHeight    =   3420
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4950
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   3420
   ScaleWidth      =   4950
   Begin VB.TextBox txtext 
      Height          =   3255
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   0
      Width           =   4695
   End
End
Attribute VB_Name = "frmtemplate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Resize()
txtext.Height = frmtemplate.Height
txtext.Width = frmtemplate.Width

End Sub

