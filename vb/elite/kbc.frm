VERSION 5.00
Object = "{C1A8AF28-1257-101B-8FB0-0020AF039CA3}#1.1#0"; "MCI32.OCX"
Begin VB.Form frmform 
   BackColor       =   &H80000007&
   BorderStyle     =   0  'None
   Caption         =   "Credits"
   ClientHeight    =   6735
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6990
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   24
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00FFFF00&
   Icon            =   "kbc.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6735
   ScaleWidth      =   6990
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin MCI.MMControl multi 
      Height          =   495
      Left            =   2655
      TabIndex        =   13
      Top             =   3345
      Visible         =   0   'False
      Width           =   1170
      _ExtentX        =   2064
      _ExtentY        =   873
      _Version        =   393216
      BorderStyle     =   0
      RecordMode      =   0
      PrevVisible     =   0   'False
      NextVisible     =   0   'False
      BackVisible     =   0   'False
      StepVisible     =   0   'False
      RecordVisible   =   0   'False
      EjectVisible    =   0   'False
      DeviceType      =   ""
      FileName        =   "E:\programming\vb\kbc\sound.wav"
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   1230
      Top             =   3960
   End
   Begin VB.Timer tmrtimer 
      Interval        =   1
      Left            =   5175
      Top             =   3840
   End
   Begin VB.Line lnline 
      BorderColor     =   &H0000FFFF&
      BorderWidth     =   6
      Index           =   3
      X1              =   1575
      X2              =   5730
      Y1              =   6090
      Y2              =   6120
   End
   Begin VB.Line lnline 
      BorderColor     =   &H0000FFFF&
      BorderStyle     =   6  'Inside Solid
      BorderWidth     =   6
      Index           =   2
      X1              =   690
      X2              =   5700
      Y1              =   735
      Y2              =   675
   End
   Begin VB.Line lnline 
      BorderColor     =   &H0000FFFF&
      BorderStyle     =   6  'Inside Solid
      BorderWidth     =   6
      Index           =   1
      X1              =   525
      X2              =   585
      Y1              =   630
      Y2              =   6120
   End
   Begin VB.Line lnline 
      BorderColor     =   &H0000FFFF&
      BorderWidth     =   6
      Index           =   0
      X1              =   6630
      X2              =   6495
      Y1              =   915
      Y2              =   6270
   End
   Begin VB.Label lblclose 
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   "Close"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   330
      Left            =   5700
      TabIndex        =   12
      Top             =   5955
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "DIGIT (www.thinkdigit.com)"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   420
      Index           =   11
      Left            =   1140
      TabIndex        =   11
      Top             =   7170
      Visible         =   0   'False
      Width           =   4335
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Main Coverage"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   360
      Index           =   10
      Left            =   2055
      TabIndex        =   10
      Top             =   6690
      Visible         =   0   'False
      Width           =   2295
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Deepak Sah"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   420
      Index           =   9
      Left            =   2430
      TabIndex        =   9
      Top             =   5940
      Width           =   1815
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Shubhanshu Aggarwal"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   420
      Index           =   8
      Left            =   1650
      TabIndex        =   8
      Top             =   5340
      Width           =   3405
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Nitin Khurana"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   420
      Index           =   7
      Left            =   2160
      TabIndex        =   7
      Top             =   4785
      Width           =   2205
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Mayank Aggarwal"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   420
      Index           =   6
      Left            =   1935
      TabIndex        =   6
      Top             =   4170
      Width           =   2775
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Sonia"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   420
      Index           =   5
      Left            =   2730
      TabIndex        =   5
      Top             =   3645
      Width           =   885
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Vishal Mehendiratta"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   420
      Index           =   4
      Left            =   1695
      TabIndex        =   4
      Top             =   3090
      Width           =   3075
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "With Help and encouragement from"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   360
      Index           =   3
      Left            =   600
      TabIndex        =   3
      Top             =   2490
      Width           =   5385
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Madhur Ahuja"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   465
      Index           =   2
      Left            =   1950
      TabIndex        =   2
      Top             =   1635
      Width           =   2565
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Programming, Designing and Source Code"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF8080&
      Height          =   360
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   1170
      Width           =   6495
   End
   Begin VB.Label label 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Credits"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   26.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFF00&
      Height          =   615
      Index           =   0
      Left            =   2235
      TabIndex        =   0
      Top             =   150
      Width           =   1800
   End
End
Attribute VB_Name = "frmform"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim i, j
Private Sub Form_Load()
'Randomize
For i = 0 To 11
label(i).Left = (frmform.ScaleWidth - label(i).Width) / 2
label(i).Top = label(i).Top + frmform.ScaleHeight
Next
'''''''''''''''''''????????????????
lnline(0).X1 = frmform.ScaleWidth - 45
lnline(0).Y1 = 0
lnline(0).X2 = frmform.ScaleWidth - 45
lnline(0).Y2 = frmform.ScaleHeight

lnline(1).X1 = 50
lnline(1).Y1 = 0
lnline(1).X2 = 50
lnline(1).Y2 = frmform.ScaleHeight

lnline(2).X1 = 0
lnline(2).Y1 = 30
lnline(2).X2 = frmform.ScaleWidth
lnline(2).Y2 = 30

lnline(3).X1 = 0
lnline(3).Y1 = frmform.ScaleHeight - 45
lnline(3).X2 = frmform.ScaleWidth - 45
lnline(3).Y2 = frmform.ScaleHeight - 45

multi.Command = "Open"
'sound.FileNumber = 1
'ChDir ("E:\programming\vb\kbc")
multi.filename = "E:\programming\vb\kbc\sound.wav"
multi.Command = "play"

End Sub
Private Sub Form_Unload(Cancel As Integer)
multi.Command = "Close"
End Sub

Private Sub lblclose_Click()
frmform.Hide
Unload frmform

End Sub

Private Sub lblclose_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BorderStyle = 1
End Sub
Private Sub lblclose_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblclose.BorderStyle = 0
End Sub
Private Sub Timer1_Timer()
For j = 0 To 3
lnline(j).BorderColor = RGB(Rnd * 255, Rnd * 255, Rnd * 255)
Next
End Sub

Private Sub tmrtimer_Timer()
For i = 0 To 11
label(i).Top = label(i).Top - 50
If label(0).Top < 180 Then
tmrtimer.Enabled = False
Timer1.Enabled = False
lblclose.Visible = True
End If
Next
End Sub
