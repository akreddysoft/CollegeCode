VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Animated ScoreBoard"
   ClientHeight    =   8625
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7155
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8625
   ScaleWidth      =   7155
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frameleft 
      BackColor       =   &H8000000C&
      BorderStyle     =   0  'None
      Caption         =   "Frame"
      Height          =   1500
      Index           =   1
      Left            =   60
      TabIndex        =   31
      Top             =   4140
      Width           =   1500
   End
   Begin VB.Frame Frameleft 
      BackColor       =   &H8000000C&
      BorderStyle     =   0  'None
      Caption         =   "Frame"
      Height          =   1500
      Index           =   0
      Left            =   0
      TabIndex        =   30
      Top             =   600
      Width           =   1500
   End
   Begin VB.PictureBox dline2 
      Height          =   135
      Left            =   120
      ScaleHeight     =   75
      ScaleWidth      =   6855
      TabIndex        =   32
      Top             =   7680
      Width           =   6915
   End
   Begin VB.PictureBox dline1 
      Height          =   135
      Left            =   120
      ScaleHeight     =   75
      ScaleWidth      =   6855
      TabIndex        =   33
      Top             =   600
      Width           =   6915
   End
   Begin VB.Frame Frameright 
      BackColor       =   &H8000000C&
      BorderStyle     =   0  'None
      Caption         =   "Frame"
      Height          =   1500
      Index           =   0
      Left            =   5520
      TabIndex        =   29
      Top             =   1020
      Width           =   1500
   End
   Begin VB.Frame Frameright 
      BackColor       =   &H8000000C&
      BorderStyle     =   0  'None
      Caption         =   "Frame"
      Height          =   1500
      Index           =   1
      Left            =   5280
      TabIndex        =   28
      Top             =   3900
      Width           =   1500
   End
   Begin VB.Timer tmrtimer1 
      Interval        =   1000
      Left            =   2760
      Top             =   4560
   End
   Begin VB.CommandButton cmdreset 
      Caption         =   "Reset"
      Height          =   375
      Left            =   2760
      TabIndex        =   24
      Top             =   8100
      Width           =   1215
   End
   Begin VB.Timer tmrtimer 
      Interval        =   1000
      Left            =   5460
      Top             =   3240
   End
   Begin VB.CommandButton cmdstart 
      Caption         =   "Start"
      Height          =   375
      Left            =   4260
      TabIndex        =   13
      Top             =   8100
      Width           =   1215
   End
   Begin VB.CommandButton cmdset 
      Caption         =   "Initialise + Align"
      Default         =   -1  'True
      Height          =   375
      Left            =   1200
      TabIndex        =   12
      Top             =   8100
      Width           =   1455
   End
   Begin VB.Label lbltopright 
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Left            =   3360
      TabIndex        =   27
      Top             =   1080
      Width           =   1500
   End
   Begin VB.Label lbltopleft 
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Left            =   960
      TabIndex        =   26
      Top             =   1080
      Width           =   1500
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      AutoSize        =   -1  'True
      Caption         =   "Demonstration of Animated Scoreboard By Madhur Ahuja"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   285
      Left            =   240
      TabIndex        =   25
      Top             =   120
      Width           =   6555
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   9
      Left            =   5340
      TabIndex        =   23
      Top             =   6000
      Width           =   1500
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   8
      Left            =   5400
      TabIndex        =   22
      Top             =   5940
      Width           =   1500
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   7
      Left            =   5220
      TabIndex        =   21
      Top             =   6180
      Width           =   1500
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   6
      Left            =   5280
      TabIndex        =   20
      Top             =   6120
      Width           =   1500
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   5
      Left            =   5340
      TabIndex        =   19
      Top             =   5820
      Width           =   1500
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   4
      Left            =   5400
      TabIndex        =   18
      Top             =   5700
      Width           =   1500
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   3
      Left            =   5340
      TabIndex        =   17
      Top             =   6060
      Width           =   1500
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   2
      Left            =   5220
      TabIndex        =   16
      Top             =   6000
      Width           =   1500
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   1
      Left            =   5040
      TabIndex        =   15
      Top             =   5760
      Width           =   1500
   End
   Begin VB.Label lblnumr 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   0
      Left            =   3360
      TabIndex        =   14
      Top             =   3960
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   9
      Left            =   420
      TabIndex        =   11
      Top             =   6000
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   8
      Left            =   360
      TabIndex        =   10
      Top             =   6000
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   7
      Left            =   300
      TabIndex        =   9
      Top             =   5940
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   6
      Left            =   420
      TabIndex        =   8
      Top             =   5760
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   5
      Left            =   240
      TabIndex        =   7
      Top             =   5760
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   4
      Left            =   420
      TabIndex        =   6
      Top             =   5880
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   3
      Left            =   360
      TabIndex        =   5
      Top             =   5940
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   2
      Left            =   180
      TabIndex        =   4
      Top             =   6060
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   1
      Left            =   -60
      TabIndex        =   3
      Top             =   6000
      Width           =   1500
   End
   Begin VB.Label lbleft 
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Left            =   960
      TabIndex        =   2
      Top             =   2520
      Width           =   1500
   End
   Begin VB.Label lblnuml 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Index           =   0
      Left            =   960
      TabIndex        =   1
      Top             =   3960
      Width           =   1500
   End
   Begin VB.Label lbright 
      BackStyle       =   0  'Transparent
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1500
      Left            =   3360
      TabIndex        =   0
      Top             =   2520
      Width           =   1500
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim start As Boolean
Dim i, j As Integer

Private Sub cmdset_Click()
init
End Sub
Private Sub init()
Dim i, j As Integer
For i = 0 To 9
lblnuml(i).Caption = i
lblnumr(i).Caption = i
lblnuml(i).Left = lbleft.Left
lblnumr(i).Left = lbright.Left
lblnuml(i).Top = lblnuml(0).Top
lblnumr(i).Top = lblnumr(0).Top
lblnuml(i).BorderStyle = 0
lblnumr(i).BorderStyle = 0
Next

For i = 0 To 1
Frameright(i).Left = lbright.Left
Frameright(i).BackColor = &H8000000F
Frameleft(i).BackColor = &H8000000F
Frameleft(i).Left = lbleft.Left
Next

Frameright(0).Top = lbltopright.Top
Frameright(1).Top = lblnumr(0).Top
Frameleft(0).Top = lbltopleft.Top
Frameleft(1).Top = lblnuml(0).Top
lbleft.BorderStyle = 0
lbltopleft.BorderStyle = 0
lbright.BorderStyle = 0
lbltopright.BorderStyle = 0

End Sub

Private Sub cmdstart_Click()
If start = False Then
start = True
cmdstart.Caption = "Stop"
Else
start = False
cmdstart.Caption = "Start"
End If

End Sub

Private Sub Form_Initialize()
start = False
i = 0
j = 0
End Sub

Private Sub tmrtimer_Timer()
'Do While i < 10
If start = True Then
Do While lblnumr(i).Top >= lbright.Top And i < 10
lblnumr(i).Top = lblnumr(i).Top - 1
lblnumr(i).BorderStyle = 1
If i >= 1 Then
lblnumr(i - 1).Top = lblnumr(i - 1).Top - 1
End If
'If lblnumr(9).Top = lbright.Top Then 'dfdffd
'lblnuml(i).Top = lblnuml(i).Top - 1   'fdfdfd
'End If                                'ffdfddf
Loop
i = i + 1
'Loop
End If

If i = 10 Then
tmrtimer.Enabled = False
'i = 0
'init
'tmrtimer_Timer
End If
'End If
End Sub

Private Sub tmrtimer1_Timer()
Dim i As Integer
If start = True Then
If lblnumr(9).Top <= lbright.Top Then
Do While lblnuml(i).Top >= lbleft.Top
lblnuml(i).Top = lblnuml(i).Top - 1
lblnuml(i).BorderStyle = 1
If i >= 1 Then
lblnuml(i - 1).Top = lblnuml(i - 1).Top - 1
End If
Loop
i = i + 1
End If
End If
End Sub
