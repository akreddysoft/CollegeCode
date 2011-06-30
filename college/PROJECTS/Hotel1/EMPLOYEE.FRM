VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form employee 
   Caption         =   "Form1"
   ClientHeight    =   6360
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7680
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6360
   ScaleWidth      =   7680
   Begin VB.TextBox txtemployeeID 
      Height          =   495
      Left            =   1560
      TabIndex        =   9
      Text            =   " "
      Top             =   120
      Width           =   5775
   End
   Begin VB.CommandButton cmdfirst 
      Caption         =   "&First"
      Height          =   495
      Left            =   1560
      TabIndex        =   26
      Top             =   6000
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "&Previous"
      Height          =   495
      Left            =   3120
      TabIndex        =   25
      Top             =   6000
      Width           =   1215
   End
   Begin VB.CommandButton cmdnext 
      Caption         =   "&Next"
      Height          =   495
      Left            =   4680
      TabIndex        =   24
      Top             =   6000
      Width           =   1215
   End
   Begin VB.CommandButton cmdlast 
      Caption         =   "&Last"
      Height          =   495
      Left            =   6240
      TabIndex        =   23
      Top             =   6000
      Width           =   1215
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "&Add"
      Height          =   495
      Left            =   1560
      TabIndex        =   22
      Top             =   6720
      Width           =   1215
   End
   Begin VB.CommandButton cmddelete 
      Caption         =   "&Delete"
      Height          =   495
      Left            =   3120
      TabIndex        =   21
      Top             =   6720
      Width           =   1215
   End
   Begin VB.CommandButton cmdsave 
      Caption         =   "&Save"
      Height          =   495
      Left            =   4680
      TabIndex        =   20
      Top             =   6720
      Width           =   1215
   End
   Begin VB.CommandButton cmdmodify 
      Caption         =   "&Modify"
      Height          =   495
      Left            =   6240
      TabIndex        =   19
      Top             =   6720
      Width           =   1215
   End
   Begin VB.CommandButton exitbttn 
      Caption         =   "&Exit"
      Height          =   495
      Left            =   3960
      TabIndex        =   18
      Top             =   7440
      Width           =   1215
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   240
      Top             =   8040
      Visible         =   0   'False
      Width           =   7335
      _ExtentX        =   12938
      _ExtentY        =   661
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   8
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
      RecordSource    =   ""
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.TextBox txtempdeptt 
      Height          =   495
      Left            =   1560
      TabIndex        =   17
      Text            =   " "
      Top             =   5280
      Width           =   5775
   End
   Begin VB.TextBox txtemppost 
      Height          =   495
      Left            =   1560
      TabIndex        =   16
      Text            =   " "
      Top             =   4560
      Width           =   5775
   End
   Begin VB.TextBox txtsalary 
      Height          =   495
      Left            =   1560
      TabIndex        =   15
      Text            =   " "
      Top             =   3840
      Width           =   5775
   End
   Begin VB.TextBox txtdepttid 
      Height          =   495
      Left            =   1560
      TabIndex        =   14
      Text            =   " "
      Top             =   3120
      Width           =   5775
   End
   Begin VB.TextBox txtage 
      Height          =   495
      Left            =   1560
      TabIndex        =   13
      Text            =   " "
      Top             =   2520
      Width           =   5775
   End
   Begin VB.TextBox txtcity 
      Height          =   495
      Left            =   1560
      TabIndex        =   12
      Text            =   " "
      Top             =   1920
      Width           =   5775
   End
   Begin VB.TextBox txtstreet 
      Height          =   495
      Left            =   1560
      TabIndex        =   11
      Text            =   " "
      Top             =   1320
      Width           =   5775
   End
   Begin VB.TextBox txtempname 
      Height          =   495
      Left            =   1560
      TabIndex        =   10
      Text            =   " "
      Top             =   720
      Width           =   5775
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      Caption         =   "Department"
      Height          =   495
      Left            =   240
      TabIndex        =   8
      Top             =   5280
      Width           =   1215
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      Caption         =   "Post"
      Height          =   495
      Left            =   240
      TabIndex        =   7
      Top             =   4560
      Width           =   1215
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "Salary"
      Height          =   495
      Left            =   240
      TabIndex        =   6
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "Department ID"
      Height          =   495
      Left            =   240
      TabIndex        =   5
      Top             =   3240
      Width           =   1215
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Age"
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "City"
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Street Name"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Employee Name"
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Employee ID"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "employee"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset

Private Sub cmdadd_Click()
    
    txtemployeeID.Text = ""
    txtempname.Text = ""
    txtstreet.Text = ""
    txtcity.Text = ""
    txtage.Text = ""
    txtdepttid.Text = ""
    txtsalary.Text = ""
    txtemppost.Text = ""
    txtempdeptt.Text = ""
   
   cmdadd.Enabled = False
    cmddelete.Enabled = False
    cmdfirst.Enabled = False
    cmdlast.Enabled = False
    cmdnext.Enabled = False
    cmdPrev.Enabled = False
    cmdmodify.Enabled = False
    cmdsave.Enabled = True
    
End Sub

Private Sub cmddelete_Click()
    cn.Execute "DELETE from h_employee where empid=" + txtemployeeID.Text + ""
    rs.Requery
    UpdateTextBoxes
End Sub

Private Sub cmdfirst_Click()
rs.MoveFirst
UpdateTextBoxes
End Sub

Private Sub cmdlast_Click()
    rs.MoveLast
    UpdateTextBoxes
    
End Sub

Private Sub cmdmodify_Click()
On Error GoTo er2
    cn.Execute "UPDATE H_employee SET ename='" + txtempname.Text + "',estreet='" + txtstreet.Text + "',ecity='" + txtcity.Text + "',e_age=" + txtage.Text + ",e_salary=" + txtsalary.Text + ",e_post='" + txtemppost.Text + "' WHERE EMPID=" + txtemployeeID.Text + " AND DEPTT_ID=" + txtdepttid.Text + " AND E_DEPTT='" + txtempdeptt.Text + "' "
    rs.Requery
    UpdateTextBoxes
    Exit Sub
er2:
    MsgBox "Error in saving the record" + Err.Description

End Sub

Private Sub cmdnext_Click()
    rs.MoveNext
    If rs.EOF Then rs.MoveLast
    UpdateTextBoxes
    
End Sub

Private Sub cmdPrev_Click()
    rs.MovePrevious
    If rs.BOF Then rs.MoveFirst
    UpdateTextBoxes
End Sub

Private Sub cmdsave_Click()
On Error GoTo er1
    cn.Execute "insert into h_employee values (" + txtemployeeID.Text + ",'" + txtempname.Text + "','" + txtstreet.Text + "','" + txtcity.Text + "'," + txtage.Text + "," + txtdepttid.Text + "," + txtsalary.Text + ",'" + txtemppost.Text + "','" + txtempdeptt.Text + "')"
    cmdadd.Enabled = True
    cmddelete.Enabled = True
    cmdfirst.Enabled = True
    cmdlast.Enabled = True
    cmdnext.Enabled = True
    cmdPrev.Enabled = True
    cmdmodify.Enabled = True
    UpdateTextBoxes
    rs.Requery
    
    Exit Sub
er1:
    MsgBox "Error in saving the record" + Err.Description


End Sub

Private Sub exitbttn_Click()
End
End Sub

Private Sub Form_Load()
    rs.Open "Select * from h_employee", cn, adOpenDynamic, adLockOptimistic
    rs.MoveFirst
    UpdateTextBoxes
End Sub




Private Sub UpdateTextBoxes()
    txtemployeeID.Text = rs("empid")
    txtempname.Text = rs("ename")
    txtstreet.Text = rs("estreet")
    txtcity.Text = rs("ecity")
    txtage.Text = rs("e_age")
    txtdepttid.Text = rs("deptt_id")
    txtsalary.Text = rs("e_salary")
    txtemppost.Text = rs("e_post")
    txtempdeptt.Text = rs("e_deptt")
    End Sub

