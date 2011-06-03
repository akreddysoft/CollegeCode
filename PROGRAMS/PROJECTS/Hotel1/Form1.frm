VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form department 
   Caption         =   "Department Information"
   ClientHeight    =   6765
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7320
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
   ScaleHeight     =   6765
   ScaleWidth      =   7320
   Begin VB.CommandButton exitbttn 
      Caption         =   "&Exit"
      Height          =   495
      Left            =   3360
      TabIndex        =   18
      Top             =   6240
      Width           =   1215
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   495
      Left            =   960
      Top             =   4200
      Visible         =   0   'False
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   873
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
   Begin VB.CommandButton cmdmodify 
      Caption         =   "&Modify"
      Height          =   495
      Left            =   5640
      TabIndex        =   17
      Top             =   5520
      Width           =   1215
   End
   Begin VB.CommandButton cmdsave 
      Caption         =   "&Save"
      Height          =   495
      Left            =   4080
      TabIndex        =   16
      Top             =   5520
      Width           =   1215
   End
   Begin VB.CommandButton cmddelete 
      Caption         =   "&Delete"
      Height          =   495
      Left            =   2520
      TabIndex        =   15
      Top             =   5520
      Width           =   1215
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "&Add"
      Height          =   495
      Left            =   960
      TabIndex        =   14
      Top             =   5520
      Width           =   1215
   End
   Begin VB.CommandButton cmdlast 
      Caption         =   "&Last"
      Height          =   495
      Left            =   5640
      TabIndex        =   13
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CommandButton cmdnext 
      Caption         =   "&Next"
      Height          =   495
      Left            =   4080
      TabIndex        =   12
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "&Previous"
      Height          =   495
      Left            =   2520
      TabIndex        =   11
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CommandButton cmdfirst 
      Caption         =   "&First"
      Height          =   495
      Left            =   960
      TabIndex        =   10
      Top             =   4800
      Width           =   1215
   End
   Begin VB.TextBox txtdepttdesc 
      Height          =   495
      Left            =   1680
      TabIndex        =   9
      Text            =   " "
      Top             =   3120
      Width           =   5055
   End
   Begin VB.TextBox txtdepttincharge 
      Height          =   495
      Left            =   1680
      TabIndex        =   8
      Text            =   " "
      Top             =   2400
      Width           =   5055
   End
   Begin VB.TextBox txtnoppl 
      Height          =   495
      Left            =   1680
      TabIndex        =   7
      Text            =   " "
      Top             =   1680
      Width           =   5055
   End
   Begin VB.TextBox txtdepttstatus 
      Height          =   495
      Left            =   1680
      TabIndex        =   6
      Text            =   " "
      Top             =   960
      Width           =   5055
   End
   Begin VB.TextBox txtdepttid 
      Height          =   495
      Left            =   1680
      TabIndex        =   5
      Text            =   " "
      Top             =   240
      Width           =   5055
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Department Description"
      Height          =   495
      Left            =   240
      TabIndex        =   4
      Top             =   3120
      Width           =   1215
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "Department Incharge"
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "No. of Personnel"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   1680
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Department Status"
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Department ID"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "department"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset

Private Sub cmdadd_Click()
    txtdepttid.Text = ""
    txtdepttstatus.Text = ""
    txtnoppl.Text = ""
    txtdepttincharge.Text = ""
    txtdepttdesc.Text = ""
    
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
cn.Execute "DELETE from h_department where deptt_id=" + txtdepttid.Text + ""
    rs.Requery
    UpdateTextBoxes
End Sub

Private Sub cmdfirst_Click()
    
    rs.MoveFirst
    UpdateTextBoxes
    
End Sub
Private Sub UpdateTextBoxes()
    txtdepttid.Text = rs("deptt_id")
    txtdepttstatus.Text = rs("deptt_status")
    txtnoppl.Text = rs("deptt_noppl")
    txtdepttincharge.Text = rs("deptt_incharge")
    txtdepttdesc.Text = rs("deptt_desc")
    End Sub

Private Sub cmdlast_Click()
    
    rs.MoveLast
    UpdateTextBoxes
    
    
End Sub

Private Sub cmdmodify_Click()
    On Error GoTo er2
    cn.Execute "UPDATE H_DEPARTMENT SET DEPTT_STATUS=" + txtdepttstatus.Text + ",DEPTT_NOPPL=" + txtnoppl.Text + ",DEPTT_INCHARGE='" + txtdepttincharge.Text + "',DEPTT_DESC='" + txtdepttdesc.Text + "' WHERE DEPTT_ID=" + txtdepttid.Text + ""
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
    cn.Execute "insert into h_department values (" + txtdepttid.Text + "," + txtdepttstatus.Text + "," + txtnoppl.Text + ",'" + txtdepttincharge.Text + "','" + txtdepttdesc.Text + "')"
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
    rs.Open "Select * from h_department", cn, adOpenDynamic, adLockOptimistic
    rs.MoveFirst
    UpdateTextBoxes
End Sub
