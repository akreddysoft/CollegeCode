VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmmaindata 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Enter current game data"
   ClientHeight    =   4995
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6315
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4995
   ScaleWidth      =   6315
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtgame 
      BackColor       =   &H80000004&
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
      Left            =   360
      Locked          =   -1  'True
      TabIndex        =   20
      Text            =   "Text1"
      Top             =   480
      Width           =   2295
   End
   Begin VB.CommandButton cmdclose 
      Caption         =   "&Close"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2280
      TabIndex        =   19
      Top             =   4440
      Width           =   1455
   End
   Begin VB.TextBox Text2 
      DataField       =   "STUDENTID"
      DataSource      =   "adomain"
      Height          =   495
      Left            =   3480
      TabIndex        =   18
      Text            =   "Text2"
      Top             =   3480
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.TextBox Text1 
      DataField       =   "GAME"
      DataSource      =   "adogames"
      Height          =   495
      Left            =   3360
      TabIndex        =   17
      Text            =   "Text1"
      Top             =   2640
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txtscore 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1800
      TabIndex        =   16
      Text            =   "100"
      Top             =   2880
      Width           =   735
   End
   Begin MSAdodcLib.Adodc adogames 
      Height          =   330
      Left            =   4560
      Top             =   480
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   582
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
      Caption         =   "games"
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
   Begin MSComCtl2.UpDown udrange 
      Height          =   375
      Left            =   1560
      TabIndex        =   15
      Top             =   2880
      Width           =   240
      _ExtentX        =   423
      _ExtentY        =   661
      _Version        =   393216
      Value           =   100
      Alignment       =   0
      BuddyControl    =   "txtscore"
      BuddyDispid     =   196613
      OrigLeft        =   1680
      OrigTop         =   3120
      OrigRight       =   1920
      OrigBottom      =   3615
      Max             =   200
      Min             =   100
      SyncBuddy       =   -1  'True
      Wrap            =   -1  'True
      BuddyProperty   =   0
      Enabled         =   -1  'True
   End
   Begin VB.ComboBox cbostudentid 
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
      ItemData        =   "frmmaindata.frx":0000
      Left            =   1800
      List            =   "frmmaindata.frx":0002
      Style           =   2  'Dropdown List
      TabIndex        =   14
      Top             =   1560
      Width           =   1335
   End
   Begin VB.TextBox txtround 
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1800
      MaxLength       =   2
      TabIndex        =   13
      Text            =   "1"
      Top             =   2160
      Width           =   375
   End
   Begin MSAdodcLib.Adodc adomain 
      Height          =   330
      Left            =   4440
      Top             =   0
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   582
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
      Caption         =   "main"
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
   Begin VB.TextBox txtgameid 
      BackColor       =   &H80000004&
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
      Left            =   2880
      Locked          =   -1  'True
      MaxLength       =   4
      TabIndex        =   12
      Text            =   "Text1"
      Top             =   480
      Width           =   735
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "&Add Record"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4440
      TabIndex        =   4
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton cmdel 
      Caption         =   "&Delete"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4440
      TabIndex        =   3
      Top             =   4200
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.CommandButton cmdupdate 
      Caption         =   "&Update"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4440
      TabIndex        =   2
      Top             =   2040
      Width           =   1455
   End
   Begin VB.TextBox txtcount 
      BackColor       =   &H80000004&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1800
      Locked          =   -1  'True
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   3600
      Width           =   495
   End
   Begin VB.CommandButton cmdmodify 
      Caption         =   "&Modify"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4440
      TabIndex        =   0
      Top             =   3360
      Visible         =   0   'False
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Height          =   1575
      Left            =   4200
      TabIndex        =   5
      Top             =   1080
      Width           =   1935
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Game"
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
      Left            =   360
      TabIndex        =   11
      Top             =   120
      Width           =   510
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Game ID"
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
      Left            =   3120
      TabIndex        =   10
      Top             =   120
      Width           =   735
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Student ID"
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
      TabIndex        =   9
      Top             =   1560
      Width           =   855
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Score"
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
      TabIndex        =   8
      Top             =   3000
      Width           =   480
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "Round No"
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
      TabIndex        =   7
      Top             =   2280
      Width           =   840
   End
   Begin VB.Label n 
      AutoSize        =   -1  'True
      Caption         =   "No. of records."
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
      TabIndex        =   6
      Top             =   3720
      Width           =   1200
   End
End
Attribute VB_Name = "frmmaindata"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Dim id As String
Dim i As Integer
Dim flag As Boolean
Dim cmd As New ADODB.Command
Dim rs As New ADODB.Recordset
Dim addnew As Boolean
Dim exist As Integer

Private Sub cmdadd_Click()
On Error GoTo err1
Dim round As Integer
Dim playersinround As Integer
Dim cheksid As Integer
Dim chekdataex As Integer

Call getround
cheksid = teststudid

If cheksid = -1 Then
    MsgBox "Student data already entered", vbInformation, app
    Exit Sub
End If

If cbostudentid.ListCount = 0 Then
    MsgBox "No Data available to add", vbInformation, app
    Exit Sub
End If

exist = checkdataexist(frmdata.adogen)
If exist = 0 Then
    MsgBox "No Data available to add", vbInformation, app
    Exit Sub
End If

addnew = True
cmdupdate.Enabled = True
txtcount.Text = adomain.Recordset.RecordCount
cmdadd.Enabled = False
cmdel.Enabled = False
cmdmodify.Enabled = False
Exit Sub

err1:
MsgBox "cannot add because eithere some field is empty or: " + Err.Description, vbCritical, app
End Sub

Private Sub cmdclose_Click()
Unload Me
frmain.Show
Call reflabels
End Sub

Private Sub cmdupdate_Click()
On Error GoTo err1

Dim sid As String
Dim round As Integer

txtgame.Text = frmain.lblcgame.Caption
cmdel.Enabled = True
cmdadd.Enabled = True
cmdupdate.Enabled = False
cmdmodify.Enabled = True

If txtround.Text = "" Or txtscore.Text = "" Then
    MsgBox "One or more field is blank", vbInformation, app
    Exit Sub
End If

If addnew = True Then
    Dim cn As New ADODB.Connection
    cn = "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
    cn.Open
    cmd.ActiveConnection = cn
    cmd.CommandText = "insert into maindata values('" _
    & cbostudentid.Text & "','" & txtgameid.Text & "'," _
    & txtscore.Text & "," & txtround.Text & ")"
    cmd.Execute
    adomain.Refresh
    cn.Close
Else
    MsgBox "Nothing to Update", vbInformation, app
End If

If addnew = True Then
    MsgBox "record added"
    addnew = False
    txtcount.Text = adomain.Recordset.RecordCount
End If

err1:
If addnew = True Then
    MsgBox "Cannot add because either student id exist or " + Err.Description, vbCritical, app
End If
End Sub

Private Sub Form_Load()
On Error GoTo err1

Call getround          'initialize round box
txtgame.Text = currentgame
Call calscorerange 'initialize score boxex

exist = checkdataexist(frmdata.adogen)
If exist <> 0 Then 'process only if data exist on table
    frmdata.adogen.Recordset.MoveFirst
    For i = 1 To frmdata.adogen.Recordset.RecordCount
        cbostudentid.AddItem frmdata.adogen.Recordset.Fields(0).Value
        frmdata.adogen.Recordset.MoveNext
    Next
    cbostudentid.ListIndex = 0
End If

cmdupdate.Enabled = False
txtcount.Text = adomain.Recordset.RecordCount 'init record
'count box
Exit Sub

err1:
MsgBox "Error occured: " + Err.Description, vbCritical, app
'Unload Me
End Sub

Public Sub getround()
Dim rcount As Integer
Dim plcount As Integer
Dim curround As Integer
Dim exist As Integer
plcount = 0

exist = checkdataexist(adomain)
If exist = 0 Then
    'MsgBox "first record"
    curround = 1
    txtround.Text = Str(curround)
    Exit Sub
End If

rcount = adomain.Recordset.RecordCount
adomain.Recordset.MoveFirst
adomain.Recordset.Move (rcount - 1)

curround = adomain.Recordset.Fields(3).Value

Do While Not adomain.Recordset.BOF
    If curround = adomain.Recordset.Fields(3).Value Then
         plcount = plcount + 1
    If plcount = 8 Then
        curround = curround + 1
    End If
    End If
    adomain.Recordset.MovePrevious
Loop

txtround.Text = Str(curround)
End Sub

Public Function teststudid()
Dim currgameid As String
Dim sid As String
Dim rcount As Integer
Dim exist As Integer
Dim curround As Integer

exist = checkdataexist(adomain)
If exist = 0 Then
    Exit Function  'no need to check for duplicate sid
End If

rcount = adomain.Recordset.RecordCount
frmdata.adogen.Recordset.MoveFirst
adomain.Recordset.MoveFirst

adomain.Recordset.Move (rcount - 1)
currgameid = adomain.Recordset.Fields(1).Value
Do While Not adomain.Recordset.BOF
    If cbostudentid.Text = adomain.Recordset.Fields(0) Then
        exist = 1     'if he has played then exit
        teststudid = -1
        Exit Function
    End If
    If currgameid = adomain.Recordset.Fields(1).Value Then
        ' player cannot play the same game again
        adomain.Recordset.MovePrevious
    Else
        Exit Do      'executed only once
    End If
Loop
   
teststudid = 1
End Function

Private Sub calscorerange()
Select Case txtgame.Text
Case game6
    txtgameid.Text = "NFS5"
    udrange.Min = 100
    udrange.Max = 500
    udrange.Value = (udrange.Min + udrange.Max) / 2
Case game4
    txtgameid.Text = "NFS3"
    udrange.Min = 100
    udrange.Max = 500
    udrange.Value = (udrange.Min + udrange.Max) / 2
Case game3
    txtgameid.Text = "UT01"
    udrange.Min = 0
    udrange.Max = 100
    udrange.Value = (udrange.Min + udrange.Max) / 2
Case game5
    txtgameid.Text = "MTR2"
    udrange.Min = 100
    udrange.Max = 500
    udrange.Value = (udrange.Min + udrange.Max) / 2
Case game7
    txtgameid.Text = "AOE2"
    udrange.Min = 10000
    udrange.Max = 100000
    udrange.Value = (udrange.Min + udrange.Max) / 2
Case game2
    txtgameid.Text = "SBK2"
    udrange.Min = 100
    udrange.Max = 500
    udrange.Value = (udrange.Min + udrange.Max) / 2
Case game1
    txtgameid.Text = "QUK3"
    udrange.Min = 0
    udrange.Max = 100
    udrange.Value = (udrange.Min + udrange.Max) / 2
End Select
End Sub


