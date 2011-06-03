VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form frmain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gamestation"
   ClientHeight    =   7920
   ClientLeft      =   45
   ClientTop       =   615
   ClientWidth     =   6540
   Icon            =   "frmain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7920
   ScaleWidth      =   6540
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdquery 
      Caption         =   "&Query Analyser"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   24
      Top             =   5040
      Width           =   2295
   End
   Begin VB.ComboBox cbogame 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   2880
      Style           =   2  'Dropdown List
      TabIndex        =   22
      Top             =   720
      Width           =   2295
   End
   Begin VB.ComboBox cboday 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   240
      Style           =   2  'Dropdown List
      TabIndex        =   20
      Top             =   1560
      Width           =   1575
   End
   Begin VB.TextBox Text3 
      DataField       =   "SCORE"
      DataSource      =   "adomain"
      Height          =   855
      Left            =   360
      TabIndex        =   18
      Text            =   "Text3"
      Top             =   2520
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.TextBox Text2 
      DataField       =   "COLLEGE"
      DataSource      =   "adogen"
      Height          =   735
      Left            =   5640
      TabIndex        =   17
      Text            =   "Text2"
      Top             =   4680
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox Text1 
      DataField       =   "GAMEID"
      DataSource      =   "adogames"
      Height          =   495
      Left            =   5520
      TabIndex        =   16
      Text            =   "Text1"
      Top             =   3840
      Visible         =   0   'False
      Width           =   615
   End
   Begin MSAdodcLib.Adodc adogen 
      Height          =   375
      Left            =   0
      Top             =   4680
      Visible         =   0   'False
      Width           =   1215
      _ExtentX        =   2143
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
      OLEDBString     =   "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "STUDENTS"
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin MSAdodcLib.Adodc adogames 
      Height          =   375
      Left            =   5160
      Top             =   2160
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
      OLEDBString     =   "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "GAMESTATION"
      Caption         =   "Adodc2"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin MSAdodcLib.Adodc adomain 
      Height          =   375
      Left            =   4920
      Top             =   3240
      Visible         =   0   'False
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
      OLEDBString     =   "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "MAINDATA"
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.CommandButton cmdwhole 
      Caption         =   "See whole &database"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   10
      Top             =   4440
      Width           =   2295
   End
   Begin VB.ComboBox cbotime 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   2160
      Style           =   2  'Dropdown List
      TabIndex        =   8
      Top             =   1560
      Width           =   1695
   End
   Begin VB.CommandButton cmexit 
      Caption         =   "&Close database and exit"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   4
      Top             =   5760
      Width           =   2295
   End
   Begin VB.CommandButton cmdcurrent 
      Caption         =   "&Enter data of current game"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1620
      TabIndex        =   3
      Top             =   3000
      Width           =   2655
   End
   Begin VB.CommandButton cmdwinners 
      Caption         =   "See &Winners"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   2
      Top             =   3720
      Width           =   2295
   End
   Begin VB.CommandButton cmdlist 
      Caption         =   "&Manage list of students"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1620
      TabIndex        =   0
      Top             =   2280
      Width           =   2655
   End
   Begin VB.Frame Frame1 
      Height          =   4455
      Left            =   1320
      TabIndex        =   5
      Top             =   1920
      Width           =   3135
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000009&
      BorderStyle     =   6  'Inside Solid
      X1              =   45
      X2              =   6585
      Y1              =   45
      Y2              =   45
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000003&
      X1              =   0
      X2              =   6480
      Y1              =   30
      Y2              =   30
   End
   Begin VB.Label lblctime 
      Alignment       =   2  'Center
      BackColor       =   &H80000012&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0100"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   300
      Left            =   5640
      TabIndex        =   30
      Top             =   6960
      Width           =   735
   End
   Begin VB.Label Label10 
      AutoSize        =   -1  'True
      Caption         =   "Time"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3360
      TabIndex        =   29
      Top             =   6960
      Width           =   420
   End
   Begin VB.Label lblcday 
      Alignment       =   2  'Center
      BackColor       =   &H80000012&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "22"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   300
      Left            =   2520
      TabIndex        =   28
      Top             =   6480
      Width           =   495
   End
   Begin VB.Label Label11 
      AutoSize        =   -1  'True
      Caption         =   "Game played"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3360
      TabIndex        =   27
      Top             =   6480
      Width           =   1155
   End
   Begin VB.Label lblcgame 
      BackColor       =   &H80000012&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Game being played"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   300
      Left            =   4680
      TabIndex        =   26
      Top             =   6480
      Width           =   1740
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      Caption         =   "Day"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   240
      TabIndex        =   25
      Top             =   6480
      Width           =   345
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "List of games"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   1320
      TabIndex        =   23
      Top             =   720
      Width           =   1170
   End
   Begin VB.Label lblgplayed 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Game being played"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   3960
      TabIndex        =   21
      Top             =   1560
      Width           =   2340
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "Day"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   720
      TabIndex        =   19
      Top             =   1200
      Width           =   345
   End
   Begin VB.Label lblplayed 
      Alignment       =   2  'Center
      BackColor       =   &H80000012&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "22"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   300
      Left            =   5640
      TabIndex        =   15
      Top             =   7440
      Width           =   495
   End
   Begin VB.Label lblround 
      Alignment       =   2  'Center
      BackColor       =   &H80000012&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "22"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   300
      Left            =   2520
      TabIndex        =   14
      Top             =   7380
      Width           =   495
   End
   Begin VB.Label lblq 
      Alignment       =   2  'Center
      BackColor       =   &H80000012&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "22"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   300
      Left            =   2520
      TabIndex        =   13
      Top             =   6960
      Width           =   495
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Current Round no"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   240
      TabIndex        =   12
      Top             =   7440
      Width           =   1470
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Players who have played"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3360
      TabIndex        =   11
      Top             =   7440
      Width           =   2025
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Gamestation"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   26.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   600
      Left            =   1800
      TabIndex        =   9
      Top             =   120
      Width           =   2655
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Time"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2760
      TabIndex        =   7
      Top             =   1200
      Width           =   420
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Game"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4800
      TabIndex        =   6
      Top             =   1200
      Width           =   525
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "No of players in queue"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   240
      TabIndex        =   1
      Top             =   6960
      Width           =   1845
   End
   Begin VB.Menu mnfile 
      Caption         =   "File"
      Begin VB.Menu mnucreate 
         Caption         =   "Create Database"
      End
      Begin VB.Menu mnuexit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnabout 
      Caption         =   "About"
   End
End
Attribute VB_Name = "frmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim i As Integer
Dim cmd As New ADODB.Command
Dim rs As New ADODB.Recordset

Private Sub cboday_Change()
Call getgame
End Sub

Private Sub cboday_Click()
Call getgame
End Sub

Private Sub cbotime_Change()
Call getgame
End Sub

Private Sub cbotime_Click()
Call getgame
End Sub

Private Sub cmdcurrent_Click()
currentgame = lblcgame.Caption
Me.Hide
frmmaindata.Show
End Sub

Private Sub cmdlist_Click()
Me.Hide 'doesnt unloads, the values are saved
        'even if called load frmain, form_load
        'is not called
frmdata.Show
End Sub

Private Sub cmdquery_Click()
Me.Hide
frmquery.Show
End Sub

Private Sub cmdwhole_Click()
Me.Hide
frmwhole.Show
End Sub

Private Sub cmdwinners_Click()
Me.Hide
frmwinners.Show
End Sub

Private Sub cmexit_Click()
End
End Sub
Private Sub Form_Load()
On Error GoTo err1

adogames.Recordset.MoveFirst
For i = 0 To adogames.Recordset.RecordCount - 1
    cbogame.AddItem adogames.Recordset.Fields(1).Value
    adogames.Recordset.MoveNext
Next

cbogame.ListIndex = 0
cboday.AddItem "1"
cboday.AddItem "2"
cboday.AddItem "3"
cbotime.AddItem time1
cbotime.AddItem time2
cbotime.AddItem time3
cboday.ListIndex = 0
cbotime.ListIndex = 0

Call reflabels 'refresh the labels
Call getgame 'handle combo box changes
Exit Sub

err1:
MsgBox "Error loading: " + Err.Description, vbCritical, app
Exit Sub
End Sub
Private Sub getgame()
Select Case cboday.Text
Case "1"
    Select Case cbotime.Text
    Case time1
        lblgplayed.Caption = cbogame.List(0)
    Case time2
        lblgplayed.Caption = cbogame.List(1)
    Case time3
        lblgplayed.Caption = cbogame.List(2)
    End Select

Case "2"
    Select Case cbotime.Text
    Case time1
        lblgplayed.Caption = cbogame.List(3)
    Case time2
        lblgplayed.Caption = cbogame.List(4)
    Case time3
        lblgplayed.Caption = cbogame.List(5)
    End Select
    
Case "3"
    Select Case cbotime.Text
    Case time1
        lblgplayed.Caption = cbogame.List(0)
    Case time2
        lblgplayed.Caption = cbogame.List(2)
    Case time3
        lblgplayed.Caption = cbogame.List(6)
    End Select
End Select

End Sub


Private Sub mnabout_Click()
frmAbout.Show
End Sub
