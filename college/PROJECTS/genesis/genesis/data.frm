VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form frmdata 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Data Entry"
   ClientHeight    =   6705
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6675
   ControlBox      =   0   'False
   Icon            =   "data.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6705
   ScaleWidth      =   6675
   StartUpPosition =   2  'CenterScreen
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
      Left            =   4800
      TabIndex        =   20
      Top             =   1800
      Width           =   1455
   End
   Begin VB.CommandButton cmdprev 
      Caption         =   "Move &Previous"
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
      Left            =   1680
      TabIndex        =   17
      Top             =   5520
      Width           =   1455
   End
   Begin VB.CommandButton cmdlast 
      Caption         =   "Move &Last"
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
      Left            =   4560
      TabIndex        =   16
      Top             =   5520
      Width           =   1455
   End
   Begin VB.CommandButton cmdfirst 
      Caption         =   "Move &First"
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
      Left            =   240
      TabIndex        =   15
      Top             =   5520
      Width           =   1455
   End
   Begin VB.CommandButton cmdnext 
      Caption         =   "Move &Next"
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
      TabIndex        =   14
      Top             =   5520
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
      Left            =   4800
      TabIndex        =   13
      Top             =   2400
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
      Left            =   4800
      TabIndex        =   12
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "&Add New"
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
      Left            =   4800
      TabIndex        =   11
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtphone 
      DataField       =   "PHONE"
      DataSource      =   "adogen"
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
      Left            =   1920
      MaxLength       =   10
      TabIndex        =   4
      Text            =   "Text5"
      Top             =   2760
      Width           =   2295
   End
   Begin VB.TextBox txtmail 
      DataField       =   "EMAILID"
      DataSource      =   "adogen"
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
      Left            =   1920
      TabIndex        =   3
      Text            =   "Text3"
      Top             =   2115
      Width           =   2295
   End
   Begin VB.ComboBox cbocollege 
      DataField       =   "COLLEGE"
      DataSource      =   "adogen"
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
      ItemData        =   "data.frx":000C
      Left            =   1920
      List            =   "data.frx":000E
      TabIndex        =   2
      Text            =   "Combo1"
      Top             =   1515
      Width           =   2295
   End
   Begin VB.TextBox txtstudid 
      DataField       =   "STUDENTID"
      DataSource      =   "adogen"
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
      Left            =   1920
      MaxLength       =   5
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   240
      Width           =   2295
   End
   Begin VB.TextBox txtname 
      DataField       =   "STUDENT"
      DataSource      =   "adogen"
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
      Left            =   1920
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   870
      Width           =   2295
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
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
      Left            =   2520
      TabIndex        =   5
      Top             =   6120
      Width           =   1455
   End
   Begin MSAdodcLib.Adodc adogen 
      Height          =   375
      Left            =   4680
      Top             =   4680
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
      RecordSource    =   "STUDENTS"
      Caption         =   "Data"
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
   Begin VB.Frame Frame1 
      Height          =   2775
      Left            =   4560
      TabIndex        =   19
      Top             =   240
      Width           =   1935
   End
   Begin VB.Frame Frame2 
      Height          =   735
      Left            =   120
      TabIndex        =   21
      Top             =   5280
      Width           =   6015
   End
   Begin VB.Label lblday 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      DataField       =   "DAYALLOCATED"
      DataSource      =   "adogen"
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
      Left            =   4680
      TabIndex        =   30
      Top             =   3720
      Width           =   615
   End
   Begin VB.Label Label10 
      AutoSize        =   -1  'True
      Caption         =   "on day"
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
      Left            =   3840
      TabIndex        =   29
      Top             =   3840
      Width           =   540
   End
   Begin VB.Label lblgame 
      BorderStyle     =   1  'Fixed Single
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
      Left            =   1920
      TabIndex        =   28
      Top             =   3720
      Width           =   1695
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "Game to be played"
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
      TabIndex        =   27
      Top             =   3840
      Width           =   1545
   End
   Begin VB.Label lbltime 
      BorderStyle     =   1  'Fixed Single
      DataField       =   "TIMEALLOCATED"
      DataSource      =   "adogen"
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
      Left            =   1920
      TabIndex        =   26
      Top             =   3240
      Width           =   615
   End
   Begin VB.Label txtcount 
      BorderStyle     =   1  'Fixed Single
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
      Left            =   3480
      TabIndex        =   25
      Top             =   4680
      Width           =   495
   End
   Begin VB.Label lblrecno 
      BorderStyle     =   1  'Fixed Single
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
      Left            =   1440
      TabIndex        =   24
      Top             =   4680
      Width           =   495
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Record no"
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
      TabIndex        =   23
      Top             =   4800
      Width           =   855
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Time Allocated"
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
      TabIndex        =   22
      Top             =   3360
      Width           =   1215
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
      Left            =   2160
      TabIndex        =   18
      Top             =   4800
      Width           =   1200
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "Phone No."
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
      TabIndex        =   10
      Top             =   2880
      Width           =   870
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Email ID"
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
      Top             =   2250
      Width           =   705
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "College"
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
      Top             =   1620
      Width           =   645
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Name"
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
      Top             =   990
      Width           =   510
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
      TabIndex        =   6
      Top             =   360
      Width           =   855
   End
End
Attribute VB_Name = "frmdata"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim flag As Boolean
Dim addnew As Boolean
Dim modify As Boolean
Dim exist As Integer
Private Sub cmdadd_Click()
On Error GoTo err1

addnew = True
adogen.Recordset.addnew
cbocollege.ListIndex = 0

Call calgame
'get the appropriate game
Call calday
'get the appropriate day
Call caltime
'get the appropriate time

cmdupdate.Enabled = True
cmdadd.Enabled = False
cmdfirst.Enabled = False
cmdlast.Enabled = False
cmdnext.Enabled = False
cmdprev.Enabled = False
cmdel.Enabled = False
cmdmodify.Enabled = False
Exit Sub

err1:
MsgBox "Cannot Add because " + Err.Description, vbCritical, app
End Sub

Private Sub cmdel_Click()
On Error GoTo err1
If Not adogen.Recordset.EOF Or adogen.Recordset.BOF Then
    Dim ans As Integer
    ans = MsgBox("Are you sure you want to delete the current record", vbYesNo + vbExclamation, app)
    If ans = vbYes Then
        adogen.Recordset.Delete
        MsgBox "Record deleted", vbInformation, app
        adogen.Refresh
        txtcount.Caption = adogen.Recordset.RecordCount
        lblrecno.Caption = adogen.Recordset.AbsolutePosition
    End If
End If
Exit Sub

err1:
MsgBox "Cannot Delete because " & Err.Description, vbCritical, app
adogen.Recordset.CancelUpdate
End Sub

Private Sub cmdFirst_Click()
On Error GoTo err1

exist = checkdataexist(adogen)
If exist = 0 Then
    MsgBox "No data", vbInformation, app
    Exit Sub
End If

adogen.Recordset.MoveFirst
lblrecno.Caption = adogen.Recordset.AbsolutePosition
Exit Sub

err1:
MsgBox "Error occured: " + Err.Description, vbCritical, app
Exit Sub
End Sub

Private Sub cmdLast_Click()
On Error GoTo err1

exist = checkdataexist(adogen)
If exist = 0 Then
    MsgBox "No data", vbInformation, app
    Exit Sub
End If

adogen.Recordset.MoveLast
lblrecno.Caption = adogen.Recordset.AbsolutePosition
Exit Sub

err1:
MsgBox "Error occured: " + Err.Description, vbCritical, app
Exit Sub

End Sub

Private Sub cmdmodify_Click()
modify = True
cmdupdate_Click
End Sub

Private Sub cmdNext_Click()
On Error GoTo err1

If Not adogen.Recordset.EOF Then
    adogen.Recordset.MoveNext
    lblrecno.Caption = adogen.Recordset.AbsolutePosition
End If
Exit Sub

err1:
MsgBox "Error occured: " & Err.Description, vbCritical, app
End Sub

Private Sub cmdprev_Click()
On Error GoTo err1

If Not adogen.Recordset.BOF Then
adogen.Recordset.MovePrevious
lblrecno.Caption = adogen.Recordset.AbsolutePosition
End If
Exit Sub

err1:
MsgBox "Error occured: " & Err.Description, vbCritical, app
End Sub
Private Sub cmdupdate_Click()
On Error GoTo err1

cmdel.Enabled = True
cmdfirst.Enabled = True
cmdlast.Enabled = True
cmdnext.Enabled = True
cmdprev.Enabled = True
cmdadd.Enabled = True
cmdupdate.Enabled = False
cmdmodify.Enabled = True

If Str(Left$(txtstudid.Text, 1) <> "S") Or Len(txtstudid.Text) <> 5 Then
    MsgBox "Invalid Student ID", vbCritical, app
    adogen.Recordset.CancelUpdate ' cancel the update process'adogen.Refresh
    adogen.Refresh
    txtcount.Caption = adogen.Recordset.RecordCount
    Exit Sub
End If

If txtname.Text = "" Or txtstudid.Text = "" Then
    MsgBox "One or more field is blank", vbOKOnly + vbExclamation, app
    adogen.Recordset.CancelUpdate
    adogen.Refresh
    txtcount.Caption = adogen.Recordset.RecordCount
    Exit Sub
End If
 
If addnew = True Or modify = True Then
    adogen.Recordset.Update
    txtcount.Caption = adogen.Recordset.RecordCount
Else
    MsgBox "Nothing to Update", vbOKOnly, app
End If

If addnew = True Then
    MsgBox "record added", vbOKOnly + vbInformation, app
    addnew = False
End If

If modify = True Then
    MsgBox "Record Modified", vbInformation, app
    modify = False
    End If
Exit Sub

err1:
If addnew = True Then
    MsgBox "Cannot add because either student id exist or " + Err.Description, vbCritical, app
    adogen.Refresh
End If
End Sub
Private Sub cmdwinners_Click()
frmwinners.Show
End Sub
Private Sub Command1_Click()
Unload Me
'Load frmain ' reinitialise the values of time and day combo
'unless the form is loaded, form_load will not occur
'even if called
frmain.Show
Call reflabels
End Sub

Private Sub Form_Load()
Dim exist As Integer
addnew = modify = False
flag = True

txtcount.Caption = adogen.Recordset.RecordCount
cbocollege.AddItem "Bharati Vidyapeeth"
cbocollege.AddItem "AIT"
cbocollege.AddItem "PICT"
cbocollege.AddItem "Govt College of Engineering"
cbocollege.AddItem "Singhad College"
cbocollege.ListIndex = 0
cmdupdate.Enabled = False

exist = checkdataexist(adogen)
If exist = 0 Then
    lblrecno.Caption = 0
    Exit Sub
End If
adogen.Recordset.MoveFirst
lblrecno.Caption = adogen.Recordset.AbsolutePosition
End Sub
Private Sub caltime()
Dim rcount As Integer

exist = checkdataexist(adogen)
If exist = 0 Then
    lblgame.Caption = frmain.cbogame.List(0)
Else
    rcount = adogen.Recordset.RecordCount
    If rcount > 32 Then
        rcount = rcount Mod 32
    End If
        
    If rcount > 0 And rcount <= 8 Then
        lbltime.Caption = basetime
    ElseIf rcount > 8 And rcount <= 16 Then
        lbltime.Caption = basetime + 30
    ElseIf rcount > 16 And rcount <= 24 Then
        lbltime.Caption = basetime + 60
    ElseIf rcount > 24 And rcount <= 32 Then
        lbltime.Caption = basetime + 90
    End If
End If

Select Case basetime
    Case time1
        Select Case lbltime.Caption
            Case time1 + 60
            lbltime.Caption = "1200"
            Case time1 + 90
            lbltime.Caption = "1230"
            Case time1 + 120
            lbltime.Caption = time2
        End Select
    
    Case time2
        Select Case lbltime.Caption
            Case time2 + 60
            lbltime.Caption = "1400"
            Case time2 + 90
            lbltime.Caption = "1430"
            Case time2 + 120
            lbltime.Caption = time3
        End Select
    
    Case time2
        Select Case lbltime.Caption
            Case time3 + 60
            lbltime.Caption = "1600"
            Case time3 + 90
            lbltime.Caption = "1630"
            Case time3 + 120
            lbltime.Caption = "1700"
        End Select
    

End Select
End Sub

Private Sub calgame()
Dim rcount As Integer
exist = checkdataexist(frmain.adogen)
If exist = 0 Then
    frmain.lblcgame.Caption = frmain.cbogame.List(0)
Else
    rcount = frmain.adogen.Recordset.RecordCount
    If rcount > 0 And rcount < 32 Then
        lblgame.Caption = frmain.cbogame.List(0)
    ElseIf rcount >= 32 And rcount < 64 Then
        lblgame.Caption = frmain.cbogame.List(1)
    ElseIf rcount >= 64 And rcount < 96 Then
        lblgame.Caption = frmain.cbogame.List(2)
    ElseIf rcount >= 96 And rcount < 128 Then
        lblgame.Caption = frmain.cbogame.List(3)
    ElseIf rcount >= 128 And rcount < 160 Then
        lblgame.Caption = frmain.cbogame.List(4)
    ElseIf rcount >= 160 And rcount < 192 Then
        lblgame.Caption = frmain.cbogame.List(5)
    End If
End If
End Sub

Private Sub calday()
Dim rcount As Integer

exist = checkdataexist(adogen)
If exist = 0 Then
    lblday.Caption = frmain.cboday.List(0)
    frmain.lblcday.Caption = lblday.Caption
Else
    rcount = adogen.Recordset.RecordCount
    If rcount > 0 And rcount <= 96 Then
         lblday.Caption = frmain.cboday.List(0)
    ElseIf rcount > 96 And rcount <= 128 Then
        lblday.Caption = frmain.cboday.List(1)
    ElseIf rcount > 128 And rcount <= 150 Then
         lblday.Caption = frmain.cboday.List(2)
    End If
End If
End Sub

