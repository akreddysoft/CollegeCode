VERSION 5.00
Begin VB.UserControl ctlmyactx 
   BackColor       =   &H008080FF&
   ClientHeight    =   2250
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3090
   ScaleHeight     =   2250
   ScaleWidth      =   3090
   Begin VB.TextBox txthello 
      Height          =   975
      Left            =   240
      TabIndex        =   2
      Top             =   240
      Width           =   2415
   End
   Begin VB.CommandButton cmdclear 
      Caption         =   "clear"
      Height          =   375
      Left            =   1560
      TabIndex        =   1
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton cmdsayhello 
      Caption         =   "Say hello"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   1440
      Width           =   1215
   End
End
Attribute VB_Name = "ctlmyactx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Sub cmdclear_Click()
txthello.Text = ""
End Sub

Private Sub cmdsayhello_Click()
txthello.Text = "hello"
End Sub

Private Sub UserControl_Resize()
Static iwasresized As Integer
iwasresized = iwasresized + 1
Debug.Print "iwasresized=" + Str(iwasresized)
End Sub
