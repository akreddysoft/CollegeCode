VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Color Mixer"
   ClientHeight    =   5130
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5595
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5130
   ScaleWidth      =   5595
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Enabled         =   0   'False
      Height          =   1935
      Left            =   240
      TabIndex        =   3
      Top             =   2040
      Width           =   2535
   End
   Begin VB.VScrollBar VScroll3 
      Height          =   2295
      Left            =   4800
      TabIndex        =   2
      Top             =   1920
      Width           =   375
   End
   Begin VB.VScrollBar VScroll2 
      Height          =   2295
      Left            =   3960
      TabIndex        =   1
      Top             =   1920
      Width           =   375
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   2295
      Left            =   3000
      TabIndex        =   0
      Top             =   1920
      Width           =   375
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "Blue"
      Height          =   195
      Left            =   4800
      TabIndex        =   10
      Top             =   1560
      Width           =   315
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Green"
      Height          =   195
      Left            =   3840
      TabIndex        =   9
      Top             =   1560
      Width           =   435
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Red"
      Height          =   195
      Left            =   3000
      TabIndex        =   8
      Top             =   1560
      Width           =   300
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Color Mixer Application"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   480
      TabIndex        =   7
      Top             =   360
      Width           =   4815
   End
   Begin VB.Label Label3 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "12"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   4680
      TabIndex        =   6
      Top             =   4440
      Width           =   645
   End
   Begin VB.Label Label2 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "12"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   3840
      TabIndex        =   5
      Top             =   4440
      Width           =   645
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "12"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   2880
      TabIndex        =   4
      Top             =   4440
      Width           =   555
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Initialize()
VScroll1.Min = 0
VScroll2.Min = 0
VScroll3.Min = 0
VScroll1.Max = 255
VScroll2.Max = 255
VScroll3.Max = 255
Text1.Text = ""
Label1.Caption = 0
Label2.Caption = 0
Label3.Caption = 0
End Sub

Private Sub changescroll()
Dim col As Double
Label1.Caption = VScroll1.Value
Label2.Caption = VScroll2.Value
Label3.Caption = VScroll3.Value
col = RGB(VScroll1.Value, VScroll2.Value, VScroll3.Value)
Text1.BackColor = col
End Sub

Private Sub VScroll1_Change()
Call changescroll
End Sub

Private Sub VScroll1_Scroll()
Call changescroll
End Sub

Private Sub VScroll2_Change()
Call changescroll
End Sub

Private Sub VScroll2_Scroll()
Call changescroll
End Sub

Private Sub VScroll3_Change()
Call changescroll
End Sub

Private Sub VScroll3_Scroll()
Call changescroll
End Sub
