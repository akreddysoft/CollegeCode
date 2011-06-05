VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmstudent 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Student ID Registration"
   ClientHeight    =   6165
   ClientLeft      =   1095
   ClientTop       =   330
   ClientWidth     =   6705
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6165
   ScaleWidth      =   6705
   Begin MSDataListLib.DataCombo cbocity 
      Bindings        =   "frmstudent.frx":0000
      DataMember      =   "city"
      DataSource      =   "dataenv"
      Height          =   315
      Left            =   2640
      TabIndex        =   10
      Top             =   2520
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   556
      _Version        =   393216
      ListField       =   "s_city"
      BoundColumn     =   ""
      Text            =   ""
      Object.DataMember      =   "city"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.CommandButton cmdcancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3720
      TabIndex        =   20
      Top             =   5400
      Width           =   1215
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "&Add New"
      Height          =   375
      Left            =   1200
      TabIndex        =   19
      Top             =   5400
      Width           =   1695
   End
   Begin MSDataListLib.DataCombo cboBranch 
      Bindings        =   "frmstudent.frx":001B
      DataSource      =   "dataenv"
      Height          =   315
      Left            =   2640
      TabIndex        =   12
      Top             =   3240
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   556
      _Version        =   393216
      ListField       =   "s_branch"
      BoundColumn     =   ""
      Text            =   ""
      Object.DataMember      =   "Branch"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSDataListLib.DataCombo cboCollege 
      Bindings        =   "frmstudent.frx":0032
      DataMember      =   "College"
      DataSource      =   "dataenv"
      Height          =   315
      Left            =   2640
      TabIndex        =   9
      Top             =   1920
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   556
      _Version        =   393216
      ListField       =   "s_college"
      BoundColumn     =   ""
      Text            =   ""
      Object.DataMember      =   "College"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.ComboBox cboYear 
      DataSource      =   "dataenv"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "frmstudent.frx":0050
      Left            =   2640
      List            =   "frmstudent.frx":0063
      Style           =   2  'Dropdown List
      TabIndex        =   14
      Top             =   3720
      Width           =   1215
   End
   Begin VB.TextBox txtEmail 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   2640
      TabIndex        =   6
      Top             =   1440
      Width           =   3375
   End
   Begin VB.TextBox txtStudentName 
      DataMember      =   "s"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   2640
      TabIndex        =   2
      Top             =   360
      Width           =   3375
   End
   Begin VB.CommandButton cmdclose 
      Caption         =   "&Close"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3720
      TabIndex        =   16
      Top             =   5400
      Width           =   1215
   End
   Begin VB.CommandButton cmdregister 
      Caption         =   "&Register"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1200
      TabIndex        =   15
      Top             =   5400
      Width           =   1695
   End
   Begin VB.ComboBox cbosex 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "frmstudent.frx":0076
      Left            =   2640
      List            =   "frmstudent.frx":0080
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   990
      Width           =   855
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&City"
      Height          =   225
      Index           =   7
      Left            =   720
      TabIndex        =   8
      Top             =   2625
      Width           =   300
   End
   Begin VB.Label lblstatus 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1680
      TabIndex        =   18
      Top             =   4800
      Width           =   3255
   End
   Begin VB.Label lblstudid 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2640
      TabIndex        =   17
      Top             =   4200
      Width           =   1695
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Year of study"
      Height          =   225
      Index           =   6
      Left            =   720
      TabIndex        =   13
      Top             =   3750
      Width           =   1050
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Branch"
      Height          =   225
      Index           =   5
      Left            =   720
      TabIndex        =   11
      Top             =   3195
      Width           =   585
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Co&llege"
      Height          =   225
      Index           =   4
      Left            =   720
      TabIndex        =   7
      Top             =   2070
      Width           =   645
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "E-&Mail"
      Height          =   225
      Index           =   3
      Left            =   720
      TabIndex        =   5
      Top             =   1500
      Width           =   510
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Gender"
      Height          =   225
      Index           =   2
      Left            =   720
      TabIndex        =   3
      Top             =   945
      Width           =   615
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Student Name"
      Height          =   225
      Index           =   1
      Left            =   720
      TabIndex        =   1
      Top             =   375
      Width           =   1185
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Student ID"
      Height          =   225
      Index           =   0
      Left            =   720
      TabIndex        =   0
      Top             =   4320
      Width           =   855
   End
End
Attribute VB_Name = "frmstudent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdadd_Click()
lblstatus.Caption = "New Registration"
On Error GoTo adderror
dataenv.rsstud.AddNew
Call enable
Call clear
Exit Sub

adderror:
lblstatus.Caption = Err.Description
MsgBox "Error:" + Err.Description

End Sub

Private Sub cmdcancel_Click()
dataenv.rsstud.CancelUpdate
lblstatus.Caption = "Registration was canceled"
Call disable

End Sub

Private Sub cmdclose_Click()
    Unload Me
    frmmain.Show
End Sub

Private Sub cmdregister_Click()
dataenv.cn.BeginTrans
dataenv.rsstud!s_name = txtStudentName.Text
dataenv.rsstud!gender = cbosex.Text
dataenv.rsstud!s_email = txtEmail.Text
dataenv.rsstud!s_college = cboCollege.Text
dataenv.rsstud!s_branch = cboBranch.Text
dataenv.rsstud!s_year = cboYear.Text
dataenv.rsstud!s_city = cbocity.Text

On Error GoTo uerr
dataenv.rsstud.Update
lblstudid.Caption = dataenv.rsstud!s_id
lblstatus.Caption = "Successfully Registered"

dataenv.cn.CommitTrans
''PRINTING CODE

On Error GoTo printerr

dataenv.rsstud.Filter = "s_id= " + lblstudid.Caption
If Module1.prevreport = True Then
    rptstud.Show 1 '1 =absolute neccesary
End If


If studprint = True Then
    If showprntdlg = False Then
        rptstud.PrintReport False
    Else
        rptstud.PrintReport True
    End If
End If



dataenv.rsstud.Filter = 0

dataenv.rsCollege.Close
dataenv.rsCollege.Open
dataenv.rsBranch.Close
dataenv.rsBranch.Open
dataenv.rscity.Close
dataenv.rscity.Open

cbocity.ReFill
cboCollege.ReFill
cboBranch.ReFill
cbocity.Refresh
cboCollege.Refresh
cboBranch.Refresh
Set cbocity.DataSource = dataenv
Set cbocity.RowSource = dataenv
Set cboBranch.DataSource = dataenv
Set cboBranch.RowSource = dataenv
Set cboCollege.DataSource = dataenv
Set cboCollege.RowSource = dataenv
Call disable

Exit Sub

printerr:
MsgBox "Printing error:" + Err.Description
Resume Next


uerr:
lblstatus.Caption = Err.Description
MsgBox "Failed to Register due to :" + Err.Description

End Sub

Private Sub Command1_Click()
dataenv.rsloc_slot.Requery
dataenv.rsstud.Requery
dataenv.rsBranch.Requery

While Not dataenv.rsstud.BOF
    Print dataenv.rsBranch(0)
    dataenv.rsBranch.MoveNext
Wend

dataenv.rsstud.Requery
dataenv.rsloc_slot.Requery
End Sub
Private Sub Form_Load()
cbosex.ListIndex = 0
cboYear.ListIndex = 0
lblstatus.Caption = "Click Add to Register"
Call disable
End Sub

Private Sub clear()
txtStudentName.Text = ""
cbosex.ListIndex = 0
txtEmail.Text = ""
cboCollege.Text = ""
cboBranch.Text = ""
Me.lblstudid.Caption = ""
End Sub


Private Sub disable()
cmdregister.Visible = False
cmdadd.Visible = True
cmdcancel.Visible = False

Me.txtEmail.Enabled = False
Me.txtStudentName.Enabled = False
Me.cboBranch.Enabled = False
Me.cbocity.Enabled = False
Me.cboCollege.Enabled = False
Me.cbosex.Enabled = False
Me.cboYear.Enabled = False

End Sub

Private Sub enable()
cmdregister.Visible = True
cmdadd.Visible = False
cmdcancel.Visible = True

Me.txtEmail.Enabled = True
Me.txtStudentName.Enabled = True
Me.cboBranch.Enabled = True
Me.cbocity.Enabled = True
Me.cboCollege.Enabled = True
Me.cbosex.Enabled = True
Me.cboYear.Enabled = True


End Sub

Private Sub Form_Unload(Cancel As Integer)
Me.Hide
frmmain.Show
End Sub
