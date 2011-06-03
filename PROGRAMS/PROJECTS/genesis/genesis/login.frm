VERSION 5.00
Begin VB.Form frmlogin 
   BackColor       =   &H80000004&
   Caption         =   "Login"
   ClientHeight    =   3285
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5745
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3285
   ScaleWidth      =   5745
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdexit 
      Caption         =   "E&xit"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3120
      TabIndex        =   6
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton cmdenter 
      Caption         =   "&Enter"
      Default         =   -1  'True
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1440
      TabIndex        =   5
      Top             =   2640
      Width           =   1215
   End
   Begin VB.TextBox txtpass 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   2760
      MaxLength       =   8
      PasswordChar    =   "."
      TabIndex        =   3
      Top             =   1800
      Width           =   1815
   End
   Begin VB.TextBox txtuser 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2760
      MaxLength       =   20
      TabIndex        =   0
      Top             =   1200
      Width           =   1815
   End
   Begin VB.Label Label3 
      BackColor       =   &H80000000&
      Caption         =   "Genesis 2004 Database Login"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000006&
      Height          =   615
      Left            =   360
      TabIndex        =   4
      Top             =   240
      Width           =   5055
   End
   Begin VB.Label Label2 
      Caption         =   "Password :"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1080
      TabIndex        =   2
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "UserName :"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1080
      TabIndex        =   1
      Top             =   1200
      Width           =   1215
   End
End
Attribute VB_Name = "frmlogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdenter_Click()
If txtuser.Text = "madhur" And txtpass.Text = "pass" Then
frmlogin.Hide
frmain.Show
Else
MsgBox "Invalid Password, try again!", , "Login"
txtpass.SetFocus
SendKeys "{Home}+{End}"
End If

End Sub

Private Sub cmdexit_Click()
End
End Sub

Private Sub txtpass_Change()
If Len(txtuser.Text) = 0 Then
cmdenter.Enabled = False
Else
cmdenter.Enabled = True
End If
End Sub
