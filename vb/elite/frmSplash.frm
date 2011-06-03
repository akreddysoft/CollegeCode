VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSplash 
   BackColor       =   &H80000009&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   3690
   ClientLeft      =   255
   ClientTop       =   1410
   ClientWidth     =   5775
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3690
   ScaleWidth      =   5775
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   10
      Left            =   1260
      Top             =   1860
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H80000009&
      Height          =   3555
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   5505
      Begin MSComctlLib.ProgressBar prgbar 
         Height          =   135
         Left            =   1440
         TabIndex        =   1
         Top             =   2760
         Width           =   2775
         _ExtentX        =   4895
         _ExtentY        =   238
         _Version        =   393216
         Appearance      =   1
         Max             =   50
      End
      Begin VB.Label lbluser 
         BackColor       =   &H80000009&
         Caption         =   "User"
         Height          =   195
         Left            =   2760
         TabIndex        =   8
         Top             =   3180
         Width           =   2670
      End
      Begin VB.Label label 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H80000009&
         Caption         =   "Licensed to : "
         Height          =   195
         Index           =   5
         Left            =   1740
         TabIndex        =   7
         Top             =   3180
         Width           =   960
      End
      Begin VB.Label label 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00000000&
         Caption         =   "Filedit Lite"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   510
         Index           =   0
         Left            =   1710
         TabIndex        =   6
         Top             =   240
         Width           =   2190
      End
      Begin VB.Label label 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H80000009&
         Caption         =   "Win 98/Me/2000"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   4
         Left            =   1920
         TabIndex        =   5
         Top             =   2280
         Width           =   1755
      End
      Begin VB.Label label 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H80000009&
         Caption         =   "Version 1.0 Beta 1"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   1
         Left            =   1260
         TabIndex        =   4
         Top             =   960
         Width           =   2055
      End
      Begin VB.Label label 
         AutoSize        =   -1  'True
         BackColor       =   &H80000009&
         Caption         =   "By Madhur Ahuja"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   12
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   2
         Left            =   1800
         TabIndex        =   3
         Top             =   1440
         Width           =   1965
      End
      Begin VB.Label label 
         AutoSize        =   -1  'True
         BackColor       =   &H80000009&
         Caption         =   "For"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   3
         Left            =   2520
         TabIndex        =   2
         Top             =   1920
         Width           =   315
      End
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Initialize()
Dim buffer As String
Dim username As String
Dim user As Long

buffer = Space$(255)
Dim compname As Long
compname = GetComputerName(buffer, 255)
buffer = Left(buffer, Len(buffer))

username = Space$(255)
user = GetUserName(username, 255)
username = Left(username, Len(username))
lbluser.Caption = username
End Sub

Private Sub Form_Load()
Dim i As Long
For i = 0 To 4
label(i).Left = (Frame1.Width - label(i).Width) / 2
Next

End Sub

Private Sub Timer1_Timer()
prgbar.Value = prgbar.Value + 1
If prgbar.Value = 50 Then
Timer1.Enabled = False
Unload frmSplash
frmtext.Show
End If
End Sub
