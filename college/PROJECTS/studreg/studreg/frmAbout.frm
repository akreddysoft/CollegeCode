VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About"
   ClientHeight    =   2595
   ClientLeft      =   2340
   ClientTop       =   1935
   ClientWidth     =   4695
   ClipControls    =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1791.115
   ScaleMode       =   0  'User
   ScaleWidth      =   4408.848
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      ClipControls    =   0   'False
      Height          =   540
      Left            =   240
      Picture         =   "frmAbout.frx":0000
      ScaleHeight     =   337.12
      ScaleMode       =   0  'User
      ScaleWidth      =   337.12
      TabIndex        =   4
      Top             =   240
      Width           =   540
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   3240
      TabIndex        =   0
      Top             =   2040
      Width           =   1260
   End
   Begin VB.Label Label4 
      Caption         =   "darth_ash23@yahoo.com"
      ForeColor       =   &H00000000&
      Height          =   330
      Left            =   1200
      TabIndex        =   6
      Top             =   1920
      Width           =   2085
   End
   Begin VB.Label Label3 
      Caption         =   "madhur_ahuja@yahoo.com"
      ForeColor       =   &H00000000&
      Height          =   330
      Left            =   1200
      TabIndex        =   5
      Top             =   960
      Width           =   2085
   End
   Begin VB.Label Label2 
      Caption         =   "Ashit (TE - COMP2)"
      ForeColor       =   &H00000000&
      Height          =   330
      Left            =   1200
      TabIndex        =   3
      Top             =   1560
      Width           =   1845
   End
   Begin VB.Label Label1 
      Caption         =   "Madhur Ahuja (TE - IT)"
      ForeColor       =   &H00000000&
      Height          =   330
      Left            =   1200
      TabIndex        =   2
      Top             =   600
      Width           =   1845
   End
   Begin VB.Label lblDescription 
      Caption         =   "Developed for Genesis 2k4 By :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   330
      Left            =   1200
      TabIndex        =   1
      Top             =   165
      Width           =   2445
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdOK_Click()
Unload Me
End Sub

