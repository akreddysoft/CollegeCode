VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmteam 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Team ID Registration"
   ClientHeight    =   4590
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6960
   ControlBox      =   0   'False
   Icon            =   "frmteam.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4590
   ScaleWidth      =   6960
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
      Left            =   3480
      TabIndex        =   8
      Top             =   3840
      Width           =   1695
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
      Left            =   1320
      TabIndex        =   7
      Top             =   3840
      Width           =   1575
   End
   Begin VB.TextBox txtcount 
      Height          =   405
      Left            =   3960
      TabIndex        =   10
      Text            =   "1"
      Top             =   240
      Width           =   495
   End
   Begin MSComCtl2.UpDown UpDown1 
      Height          =   405
      Left            =   3750
      TabIndex        =   9
      Top             =   240
      Width           =   240
      _ExtentX        =   423
      _ExtentY        =   714
      _Version        =   393216
      Value           =   2
      BuddyControl    =   "txtcount"
      BuddyDispid     =   196611
      OrigLeft        =   1920
      OrigTop         =   480
      OrigRight       =   2160
      OrigBottom      =   975
      Max             =   5
      Min             =   1
      SyncBuddy       =   -1  'True
      BuddyProperty   =   65547
      Enabled         =   -1  'True
   End
   Begin VB.CommandButton cmdcancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3480
      TabIndex        =   1
      Top             =   3840
      Width           =   1695
   End
   Begin VB.CommandButton cmdregister 
      Caption         =   "&Register"
      Height          =   375
      Left            =   1320
      TabIndex        =   0
      Top             =   3840
      Width           =   1575
   End
   Begin MSDataListLib.DataCombo cmbStud1 
      Bindings        =   "frmteam.frx":0442
      Height          =   315
      Index           =   0
      Left            =   600
      TabIndex        =   2
      Top             =   1320
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   556
      _Version        =   393216
      Enabled         =   0   'False
      Style           =   2
      ListField       =   "s_id"
      BoundColumn     =   ""
      Text            =   ""
      Object.DataMember      =   "stud"
   End
   Begin MSDataListLib.DataCombo cmbStud1 
      Bindings        =   "frmteam.frx":0484
      DataSource      =   "dataenv"
      Height          =   315
      Index           =   1
      Left            =   1800
      TabIndex        =   3
      Top             =   1320
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   556
      _Version        =   393216
      Enabled         =   0   'False
      Style           =   2
      ListField       =   "s_id"
      Text            =   ""
      Object.DataMember      =   "stud"
   End
   Begin MSDataListLib.DataCombo cmbStud1 
      Bindings        =   "frmteam.frx":04C6
      DataSource      =   "dataenv"
      Height          =   315
      Index           =   2
      Left            =   3000
      TabIndex        =   4
      Top             =   1320
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   556
      _Version        =   393216
      Enabled         =   0   'False
      Style           =   2
      ListField       =   "s_id"
      Text            =   ""
      Object.DataMember      =   "stud"
   End
   Begin MSDataListLib.DataCombo cmbStud1 
      Bindings        =   "frmteam.frx":0508
      DataSource      =   "dataenv"
      Height          =   315
      Index           =   3
      Left            =   4200
      TabIndex        =   5
      Top             =   1320
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   556
      _Version        =   393216
      Enabled         =   0   'False
      Style           =   2
      ListField       =   "s_id"
      Text            =   ""
      Object.DataMember      =   "stud"
   End
   Begin MSDataListLib.DataCombo cmbStud1 
      Bindings        =   "frmteam.frx":054A
      DataSource      =   "dataenv"
      Height          =   315
      Index           =   4
      Left            =   5400
      TabIndex        =   6
      Top             =   1320
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   556
      _Version        =   393216
      Enabled         =   0   'False
      Style           =   2
      ListField       =   "s_id"
      Text            =   ""
      Object.DataMember      =   "stud"
   End
   Begin VB.Label lblstatus 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   15
      Top             =   3120
      Width           =   2895
   End
   Begin VB.Label lblT_id 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      TabIndex        =   14
      Top             =   2640
      Width           =   615
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Team ID"
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
      Left            =   1440
      TabIndex        =   13
      Top             =   2640
      Width           =   705
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Select Student ID"
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
      Left            =   2640
      TabIndex        =   12
      Top             =   960
      Width           =   1410
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Number of Students"
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
      Left            =   1920
      TabIndex        =   11
      Top             =   360
      Width           =   1650
   End
End
Attribute VB_Name = "frmteam"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmbStud1_Click(Index As Integer, Area As Integer)
Dim result As Boolean
result = checkcombos

If (result) Then
    cmdregister.Enabled = True
Else
    cmdregister.Enabled = False
End If
    
End Sub

Private Sub cmdadd_Click()
Dim count As Integer
Dim j As Integer
Dim i As Integer
Dim enab As Integer
Dim dupflag As Boolean

''''''''''
Call enable 'should be first statement,cannot retreive values from disabled controls
Call clear
''''''''''

lblstatus.Caption = "New Registration"

txtcount.Text = 2
count = val(txtcount.Text)
For j = 0 To count - 1
    cmbStud1(j).Enabled = True
Next

'On Error GoTo operror
dataenv.rsteam.AddNew
Exit Sub

operror:
lblstatus.Caption = Err.Description
MsgBox "Error:" + Err.Description
End Sub

Private Sub cmdcancel_Click()
On Error GoTo cerr
dataenv.rsteam.CancelUpdate

'''clean up''
Call clear
Call disable
''''''''''''

lblstatus.Caption = "Registration was canceled"
Exit Sub

cerr:
    lblstatus.Caption = Err.Description
    MsgBox "Cannot cancel because" + Err.Description
End Sub

Private Sub cmdclose_Click()
Unload Me

End Sub

Private Sub cmdregister_Click()
Dim i, j As Integer
Dim enab As Integer
Dim dupflag As Boolean
Dim temp(4)
Dim temp1 As Integer
Dim count As Integer
Dim flag As Boolean
Dim rs As New Recordset
Dim str1 As String

On Error GoTo uerr

'prepare temp array with student ids
For i = 0 To maxteam - 1
    If cmbStud1(i).Enabled = False Then
        temp(i) = Null
    Else
        temp(i) = val(cmbStud1(i).Text)
    End If
Next

'sort the temp array
 For i = 0 To maxteam - 1
     flag = 0
     For j = 0 To maxteam - 1 - i - 1
        If temp(j) > temp(j + 1) Then
            temp1 = temp(j)
            temp(j) = temp(j + 1)
             temp(j + 1) = temp1
            flag = 1
        End If
    Next
Next

'count the null items
i = 0
count = 0
While i <= maxteam - 1
    If IsNull(temp(i)) Then
        count = count + 1
    End If
    i = i + 1
Wend

'str1 = "select t_id from team where s_id1=" + Str(temp(0)) + " and s_id2=" + Str(temp(1)) + " and s_id3=" + Str(temp(2)) + " and s_id4=" + Str(temp(3)) + " and s_id5=" + Str(temp(4))
'str1 = "select t_id from team where s_id1=" + temp(0) + " and s_id2=" + temp(1) + " and s_id3=" + temp(2) + " and s_id4=" + temp(3) + " and s_id5=" + temp(4)
Select Case count
    Case 0
        str1 = "select t_id from team where s_id1=" + Str(temp(0)) + " and s_id2=" + Str(temp(1)) + " and s_id3=" + Str(temp(2)) + " and s_id4=" + Str(temp(3)) + " and s_id5=" + Str(temp(4))
    Case 1
        str1 = "select t_id from team where s_id1=" + Str(temp(0)) + " and s_id2=" + Str(temp(1)) + " and s_id3=" + Str(temp(2)) + " and s_id4=" + Str(temp(3)) + " "
    Case 2
        str1 = "select t_id from team where s_id1=" + Str(temp(0)) + " and s_id2=" + Str(temp(1)) + " and s_id3=" + Str(temp(2)) + ""
    Case 3
        str1 = "select t_id from team where s_id1=" + Str(temp(0)) + " and s_id2=" + Str(temp(1)) + " "
    Case 4
        str1 = "select t_id from team where s_id1=" + Str(temp(0)) + " "
End Select


rs.Open str1, dataenv.cn
If rs.RecordCount = 0 Then
On Error GoTo uerr
    For i = 0 To maxteam - 1
        If IsNull(temp(i)) Then
            dataenv.rsteam(i + 1) = Null
        Else
            dataenv.rsteam(i + 1) = temp(i)
        End If
    Next
    dataenv.rsteam.Update
    rs.Close
    
    lblT_id.Caption = dataenv.rsteam!t_id
    teamid = dataenv.rsteam!t_id
Else
    dataenv.rsteam.CancelUpdate
    lblT_id.Caption = rs.Fields(0).Value
    teamid = rs.Fields(0).Value
End If

'''''''''''''
nullcount = count
'''''''''''''

lblstatus.Caption = "Successfully Registered"
Call disable
Unload Me

Exit Sub

uerr:
    lblstatus.Caption = Err.Description
    MsgBox "Error:" + Err.Description, vbCritical, "Error"
End Sub

Private Sub Form_Load()
Call disable

lblstatus.Caption = "Click Add to Register"
lblT_id.Caption = ""

End Sub

Private Sub txtcount_Change()
UpDown1_Change
End Sub

Private Sub UpDown1_Change()
Dim count As Integer
Dim j As Integer
Dim result As Boolean

On Error GoTo err1

If txtcount.Text = "" Then
    Exit Sub
End If

count = val(txtcount.Text)  'enable combo boxes
For j = 0 To count - 1
    cmbStud1(j).Enabled = True
Next

For j = count To maxteam - 1    'disable extra controls
    cmbStud1(j).Enabled = False
Next

result = checkcombos
If result Then
    cmdregister.Enabled = True
Else
    cmdregister.Enabled = False
End If

Exit Sub

err1:
MsgBox "Invalid Value", vbExclamation, "Genesis"
Exit Sub

End Sub

Private Sub enable()

UpDown1.Enabled = True
txtcount.Enabled = True

cmdregister.Visible = True
cmdadd.Visible = False
cmdclose.Visible = False
cmdcancel.Visible = True

End Sub

Private Sub disable()
Dim i As Integer

For i = 0 To maxteam - 1
    cmbStud1(i).Enabled = False
Next
UpDown1.Enabled = False
txtcount.Enabled = False

cmdregister.Enabled = False
cmdregister.Visible = False
cmdadd.Visible = True
cmdclose.Visible = True
cmdcancel.Visible = False

End Sub
Private Sub clear()
Dim i As Integer

lblT_id.Caption = ""
For i = 0 To maxteam - 1
    cmbStud1(i).Text = ""
Next


End Sub

Private Function checkcombos()
Dim enab As Integer
Dim flag As Boolean
Dim i As Integer
Dim j As Integer
Dim dupflag As Integer


'check if all combo boxes has student id, if yes then enable register button
'count number of enabled combos
For i = 0 To maxteam - 1
    If cmbStud1(i).Enabled = True Then
        enab = enab + 1
    End If
Next

'check for empty text in combos
For i = 0 To enab - 1
    If cmbStud1(i).Text <> "" Then
        flag = True
    Else
        flag = False
        Exit For
    End If
Next

'check for duplicate text in combos
For i = 0 To enab - 1
    For j = i + 1 To enab - 1
        If cmbStud1(i).Text = cmbStud1(j).Text Then
            dupflag = 1
            Exit For
        Else
            dupflag = 0
        End If
    Next
    
    If (dupflag) Then
        Exit For
    End If
Next


'return true or false
If (flag) And dupflag = 0 Then
   checkcombos = True
Else
    checkcombos = False
End If


End Function
