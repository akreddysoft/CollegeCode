VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmwinners 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Current Winners"
   ClientHeight    =   6870
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7395
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6870
   ScaleWidth      =   7395
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox chkdetails 
      Caption         =   "See details"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   600
      TabIndex        =   8
      Top             =   4080
      Width           =   1455
   End
   Begin VB.CommandButton cmdrefresh 
      Caption         =   "Re&fresh"
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
      Left            =   3120
      TabIndex        =   3
      Top             =   5640
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      DataField       =   "STUDENTID"
      DataSource      =   "adomain"
      Height          =   615
      Left            =   6240
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   4440
      Visible         =   0   'False
      Width           =   495
   End
   Begin MSAdodcLib.Adodc adoquery 
      Height          =   375
      Left            =   960
      Top             =   6360
      Visible         =   0   'False
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   1
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
      RecordSource    =   "select * from winners"
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
   Begin MSAdodcLib.Adodc adomain 
      Height          =   375
      Left            =   4920
      Top             =   5640
      Visible         =   0   'False
      Width           =   1695
      _ExtentX        =   2990
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
      Left            =   3120
      TabIndex        =   1
      Top             =   6240
      Width           =   1215
   End
   Begin MSDataGridLib.DataGrid gridwinners 
      Bindings        =   "frmgames.frx":0000
      Height          =   3375
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   5953
      _Version        =   393216
      AllowUpdate     =   0   'False
      HeadLines       =   1
      RowHeight       =   18
      RowDividerStyle =   3
      FormatLocked    =   -1  'True
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   3
      BeginProperty Column00 
         DataField       =   "STUDENTID"
         Caption         =   "STUDENTID"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   "GAMEID"
         Caption         =   "GAMEID"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column02 
         DataField       =   "SCORE"
         Caption         =   "SCORE"
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         AllowRowSizing  =   0   'False
         AllowSizing     =   0   'False
         BeginProperty Column00 
            ColumnWidth     =   1049.953
         EndProperty
         BeginProperty Column01 
            ColumnWidth     =   689.953
         EndProperty
         BeginProperty Column02 
            ColumnWidth     =   915.024
         EndProperty
      EndProperty
   End
   Begin MSAdodcLib.Adodc adowinner 
      Height          =   375
      Left            =   720
      Top             =   5640
      Visible         =   0   'False
      Width           =   1815
      _ExtentX        =   3201
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
      RecordSource    =   "WINNERS"
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
   Begin VB.Label lblrprog 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "3"
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
      Left            =   3960
      TabIndex        =   7
      Top             =   5040
      Width           =   375
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Current round in progress"
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
      Left            =   600
      TabIndex        =   6
      Top             =   5040
      Width           =   2190
   End
   Begin VB.Label lblrcomp 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "3"
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
      Left            =   3960
      TabIndex        =   5
      Top             =   4560
      Width           =   375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Rounds completed of current game"
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
      Left            =   600
      TabIndex        =   4
      Top             =   4560
      Width           =   3030
   End
End
Attribute VB_Name = "frmwinners"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim i As Integer
Dim query As String
Dim cn As String
Dim errorflag As Integer
Dim defquery As String

Private Sub cmdclose_Click()
Unload Me
frmain.Show
End Sub

Private Sub cmdrefresh_Click()
Dim chekdata As Integer
Dim highscore As Integer
Dim count As Integer
Dim cmd As New ADODB.Command
Dim sid As String
Dim gid As String

Call emptytable

cmd.ActiveConnection = "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
Set gridwinners.DataSource = adowinner

chekdata = checkdataexist(adomain)
If chekdata = 0 Then
    MsgBox "No data exists", vbInformation, app
    Exit Sub
    frmain.Show
End If

adomain.Recordset.MoveFirst
For count = 0 To adomain.Recordset.RecordCount - 1
    highscore = 0
    For i = 0 To 7
        If highscore < adomain.Recordset.Fields(2).Value Then
            highscore = adomain.Recordset.Fields(2).Value
            sid = adomain.Recordset.Fields(0).Value
            gid = adomain.Recordset.Fields(1).Value
        End If
        adomain.Recordset.MoveNext
                
        If adomain.Recordset.EOF Then    'for inner loop
            Exit For
        End If
    Next

If adomain.Recordset.EOF Then    'for outer loop
    cmd.CommandText = "Insert Into winners values('" & sid & "'" _
    & ",'" & gid & "'," & highscore & ")"
    cmd.Execute
    Exit For
End If

cmd.CommandText = "Insert Into winners values('" & sid & "'" _
& ",'" & gid & "'," & highscore & ")"
cmd.Execute
Next

Call getremround

adowinner.Refresh
gridwinners.ClearFields
gridwinners.ReBind
gridwinners.Refresh

If chkdetails.Value = 1 Then
    Call details
End If
End Sub

Private Sub emptytable()
On Error GoTo err1
Dim rcount As Integer
Dim i As Integer
For i = 0 To adowinner.Recordset.RecordCount - 1
    adowinner.Recordset.Delete
    adowinner.Refresh
Next
Exit Sub

err1:
MsgBox "Error occured: " + Err.Description, vbCritical, app
End Sub

Private Sub getremround()
Dim cround As Integer
Dim remround As Integer
Dim rcount As Integer
Dim plcount As Integer
Dim curround As Integer
Dim i As Integer
i = 0

rcount = adomain.Recordset.RecordCount
adomain.Recordset.MoveFirst
adomain.Recordset.Move (rcount - 1)

curround = adomain.Recordset.Fields(3).Value

Do While Not adomain.Recordset.BOF And i < playersperround 'BUG
    If curround = adomain.Recordset.Fields(3).Value Then
         plcount = plcount + 1
    End If
    adomain.Recordset.MovePrevious
    i = i + 1 'check we dont go pass the whole round
Loop

If plcount < 8 Then
    lblrcomp.Caption = curround - 1
    lblrprog.Caption = curround
Else
    lblrcomp.Caption = curround
    lblrprog.Caption = "N/A"
End If


End Sub

Private Sub Form_Load()
cn = "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
End Sub

Private Sub details()
On Error GoTo err1
Dim query As String
errorflag = 0
defquery = "Select * from winners"
query = "select maindata.roundno,students.student,winners.studentid,gamestation.game,winners.score from students,winners,gamestation,maindata where students.studentid=winners.studentid and gamestation.gameid=winners.gameid and maindata.score=winners.score"

Set gridwinners.DataSource = adoquery
adoquery.Recordset.Close
adoquery.Recordset.Open query, cn, adOpenDynamic, adLockOptimistic
If errorflag <> 1 Then
    adoquery.Recordset.Update
    gridwinners.ClearFields
    gridwinners.ReBind
    gridwinners.Refresh
Else
    adoquery.Recordset.Open defquery, cn, adOpenDynamic, adLockOptimistic
    gridwinners.ClearFields
    gridwinners.ReBind
    gridwinners.Refresh
End If

Exit Sub

err1:
MsgBox "Error occured: " + Err.Description, vbCritical, app
errorflag = 1 'check if object opened or not
Resume Next

End Sub

