VERSION 5.00
Object = "{D4E209DE-5380-11D5-8CD8-9F7F27D74C1B}#1.0#0"; "myactocx.ocx"
Begin VB.Form frmtestocx 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin myactocx.ctlmyactx ctlmyactx1 
      Height          =   2055
      Left            =   720
      TabIndex        =   3
      Top             =   240
      Width           =   3015
      _ExtentX        =   5318
      _ExtentY        =   3625
   End
   Begin VB.CommandButton Command3 
      Caption         =   "decrease"
      Height          =   495
      Left            =   3240
      TabIndex        =   2
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "increase"
      Height          =   495
      Left            =   1680
      TabIndex        =   1
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "exit"
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   2520
      Width           =   1215
   End
End
Attribute VB_Name = "frmtestocx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
End
End Sub

Private Sub Command2_Click()
ctlmyactx1.Height = ctlmyactx1.Height * 2
End Sub

Private Sub Command3_Click()
ctlmyactx1.Height = ctlmyactx1.Height / 2
End Sub

