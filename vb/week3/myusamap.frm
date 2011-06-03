VERSION 5.00
Object = "{9126A2C3-402E-101C-96E6-0020AF38F4BB}#1.0#0"; "TEGOUSA3.OCX"
Object = "{E881B563-E2F4-101B-96E6-0020AF38F4BB}#1.0#0"; "TEGOMM32.OCX"
Begin VB.Form frmyusamap 
   Caption         =   "The My USA Map Program"
   ClientHeight    =   5925
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7695
   LinkTopic       =   "Form1"
   ScaleHeight     =   5925
   ScaleWidth      =   7695
   StartUpPosition =   3  'Windows Default
   Begin TegommLibCtl.Tegomm Tegomm1 
      Height          =   495
      Left            =   2040
      TabIndex        =   4
      Top             =   2760
      Visible         =   0   'False
      Width           =   3510
      _Version        =   65536
      _ExtentX        =   6191
      _ExtentY        =   873
      _StockProps     =   64
   End
   Begin VB.PictureBox picstatusbar 
      Align           =   2  'Align Bottom
      Height          =   675
      Left            =   0
      ScaleHeight     =   615
      ScaleWidth      =   7635
      TabIndex        =   1
      Top             =   5250
      Width           =   7695
      Begin VB.CheckBox chkanthem 
         Caption         =   "&Anthem"
         Height          =   195
         Left            =   5640
         TabIndex        =   3
         Top             =   360
         Value           =   1  'Checked
         Width           =   975
      End
      Begin VB.CommandButton cmdexit 
         Caption         =   "E&xit"
         Height          =   375
         Left            =   6720
         TabIndex        =   2
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblpop 
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   3720
         TabIndex        =   8
         Top             =   120
         Width           =   975
      End
      Begin VB.Label lblyear 
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   2520
         TabIndex        =   7
         Top             =   120
         Width           =   1095
      End
      Begin VB.Label lblcapital 
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   1080
         TabIndex        =   6
         Top             =   120
         Width           =   1215
      End
      Begin VB.Label lblstate 
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   120
         TabIndex        =   5
         Top             =   120
         Width           =   975
      End
      Begin VB.Image imgcurrent 
         Height          =   495
         Left            =   4680
         Top             =   120
         Width           =   735
      End
      Begin VB.Image imgflag2 
         Height          =   495
         Left            =   4680
         Top             =   120
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.Image imgflag1 
         Height          =   495
         Left            =   4680
         Top             =   120
         Visible         =   0   'False
         Width           =   735
      End
      Begin VB.Image imgmap 
         Height          =   480
         Left            =   4800
         Picture         =   "myusamap.frx":0000
         Top             =   120
         Visible         =   0   'False
         Width           =   480
      End
   End
   Begin TegousaLibCtl.TegoUSA TegoUSA1 
      Height          =   5280
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7695
      _Version        =   65536
      _ExtentX        =   13573
      _ExtentY        =   9313
      _StockProps     =   64
   End
End
Attribute VB_Name = "frmyusamap"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim capital(50) As String
Dim year(50) As String
Dim pop(50) As String

Private Sub chkanthem_Click()
If chkanthem.Value = 0 Then
Tegomm1.Command = "stop"
End If
If Tegomm1.Value = 1 Then
If Tegomm1.Position = 0 Then
Tegomm1.From = 3000
End If
Tegomm1.Command = "play"
End If

End Sub

Private Sub cmdexit_Click()
Unload Me
End Sub

Private Sub Form_Load()
Dim dirpath
Tegomm1.DeviceType = "sequencer"
dirpath = App.Path
If Right(dirpath, 1) <> "\" Then
dirpath = dirpath + "\"
End If
Tegomm1.FileName = dirpath + "usaanth.mid"
Tegomm1.Command = "open"
If chkanthem.Value = 1 Then
Tegomm1.TimeFormat = "milliseconds"
Tegomm1.From = 3000
Tegomm1.Command = "play"
End If
updatearrays

End Sub

Private Sub Form_Resize()
TegoUSA1.Width = Me.Width
If Me.Height > picstatusbar.Height Then
TegoUSA1.Height = Me.Height - picstatusbar.Height
End If
End Sub

Private Sub Tegomm1_Done()
If chkanthem.Value = 1 Then
If Tegomm1.Position = Tegomm1.Length Then
Tegomm1.Command = "prev"
'''tegomm1.from=3000
Tegomm1.Command = "play"
End If
End If


End Sub

Private Sub TegoUSA1_MouseMoveOnMap(ByVal StateId As Integer, ByVal x As Integer, ByVal y As Integer, ByVal Button As Integer)

End Sub

Public Sub updatearrays()
'store inf about state
capital(0) = ""
year(0) = ""
pop(5) = ""

capital(1) = "montogomery"

End Sub
