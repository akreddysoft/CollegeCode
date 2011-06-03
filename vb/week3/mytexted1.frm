VERSION 5.00
Begin VB.MDIForm frmtext 
   BackColor       =   &H80000009&
   Caption         =   "Text Editor"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture2 
      Align           =   2  'Align Bottom
      Height          =   615
      Left            =   0
      ScaleHeight     =   555
      ScaleWidth      =   4620
      TabIndex        =   1
      Top             =   2580
      Width           =   4680
      Begin VB.Image Image1 
         Height          =   480
         Left            =   0
         Picture         =   "mytexted1.frx":0000
         Stretch         =   -1  'True
         Top             =   0
         Width           =   480
      End
   End
   Begin VB.PictureBox Picture1 
      Align           =   1  'Align Top
      Height          =   615
      Left            =   0
      ScaleHeight     =   555
      ScaleWidth      =   4620
      TabIndex        =   0
      Top             =   0
      Width           =   4680
      Begin VB.CommandButton cmdexit 
         Caption         =   "Exit"
         Height          =   375
         Left            =   3480
         TabIndex        =   2
         Top             =   120
         Width           =   495
      End
      Begin VB.Image imgsave 
         Height          =   480
         Left            =   120
         Picture         =   "mytexted1.frx":0442
         Stretch         =   -1  'True
         Top             =   0
         Width           =   480
      End
   End
   Begin VB.Menu mnifile 
      Caption         =   "File"
      Begin VB.Menu mnunew 
         Caption         =   "New"
      End
      Begin VB.Menu mnuclose 
         Caption         =   "Close"
      End
      Begin VB.Menu mnuassign 
         Caption         =   "Assign name"
      End
   End
End
Attribute VB_Name = "frmtext"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdexit_Click()
End
End Sub

Private Sub mnuassign_Click()
Dim documentname As String
documentname = InputBox("document name:", "Assign Name")
frmtext.ActiveForm.Caption = documentname
End Sub

Private Sub mnunew_Click()
Dim frmnewform As New frmtemplate
frmnewform.Show
End Sub

