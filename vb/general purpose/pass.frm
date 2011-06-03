VERSION 5.00
Begin VB.Form frmpassword 
   Caption         =   "Authorisation"
   ClientHeight    =   3480
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6150
   ControlBox      =   0   'False
   Icon            =   "pass.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3480
   ScaleWidth      =   6150
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   120
      Picture         =   "pass.frx":0442
      ScaleHeight     =   495
      ScaleWidth      =   495
      TabIndex        =   4
      Top             =   360
      Width           =   495
   End
   Begin VB.CommandButton cmdexit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   3240
      TabIndex        =   3
      Top             =   1560
      Width           =   1215
   End
   Begin VB.CommandButton cmdtest 
      Caption         =   "OK"
      Height          =   495
      Left            =   1440
      TabIndex        =   2
      Top             =   1560
      Width           =   1215
   End
   Begin VB.TextBox txtpassword 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1080
      TabIndex        =   1
      Top             =   960
      Width           =   3975
   End
   Begin VB.Label lblprompt 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   840
      TabIndex        =   5
      Top             =   2520
      Width           =   4335
   End
   Begin VB.Label Label1 
      Caption         =   "Enter your password or registration number to continue."
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   840
      TabIndex        =   0
      Top             =   480
      Width           =   5175
   End
End
Attribute VB_Name = "frmpassword"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Text1_Change()

End Sub

Private Sub cmdexit_Click()
End
End Sub

Private Sub Image1_Click()

End Sub

Private Sub cmdtest_Click()
If txtpassword.Text = "serial" Then
'lblprompt.Caption = "success - thank you for trying Madhur's software"
Else
lblprompt.Caption = "Wrong Password - Try Again"
txtpassword.Text = ""
txtpassword.SetFocus
End If

End Sub

