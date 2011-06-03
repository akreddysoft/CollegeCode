VERSION 5.00
Begin VB.Form roominf 
   Caption         =   "ROOM INFORMATION"
   ClientHeight    =   6030
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9090
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6030
   ScaleWidth      =   9090
   Begin VB.CommandButton cmdfirst 
      Caption         =   "&First"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1080
      TabIndex        =   14
      Top             =   3960
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "&Previous"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2640
      TabIndex        =   13
      Top             =   3960
      Width           =   1215
   End
   Begin VB.CommandButton cmdnext 
      Caption         =   "&Next"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4200
      TabIndex        =   12
      Top             =   3960
      Width           =   1215
   End
   Begin VB.CommandButton cmdlast 
      Caption         =   "&Last"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5760
      TabIndex        =   11
      Top             =   3960
      Width           =   1215
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "&Add"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1080
      TabIndex        =   10
      Top             =   4680
      Width           =   1215
   End
   Begin VB.CommandButton cmddelete 
      Caption         =   "&Delete"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2640
      TabIndex        =   9
      Top             =   4680
      Width           =   1215
   End
   Begin VB.CommandButton cmdsave 
      Caption         =   "&Save"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   4200
      TabIndex        =   8
      Top             =   4680
      Width           =   1215
   End
   Begin VB.CommandButton cmdmodify 
      Caption         =   "&Modify"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5760
      TabIndex        =   7
      Top             =   4680
      Width           =   1215
   End
   Begin VB.CommandButton exitbttn 
      Caption         =   "&Exit"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   3480
      TabIndex        =   6
      Top             =   5400
      Width           =   1215
   End
   Begin VB.TextBox txtroomtypeid 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   5
      Text            =   " "
      Top             =   3120
      Width           =   5655
   End
   Begin VB.TextBox txtroomstat 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   4
      Top             =   2160
      Width           =   5655
   End
   Begin VB.TextBox txtroomnumber 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1800
      TabIndex        =   3
      Text            =   " "
      Top             =   1080
      Width           =   5655
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Room Type ID"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   3120
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Room Status"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Room Number"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   1080
      Width           =   1215
   End
End
Attribute VB_Name = "roominf"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset

Private Sub cmdadd_Click()
    txtroomnumber.Text = ""
    txtroomstat.Text = ""
    txtroomid.Text = ""
    
    
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
cn.Execute "DELETE from h_roominfo where room_no=" + txtroomnumber.Text + ""
    rs.Requery
    UpdateTextBoxes
End Sub

Private Sub cmdfirst_Click()
    
    rs.MoveFirst
    UpdateTextBoxes
    
End Sub
Private Sub UpdateTextBoxes()
    txtroomnumber.Text = rs("room_no")
    txtroomstat.Text = rs("room_status")
    txtroomtypeid.Text = rs("r_typeid")
    
    End Sub

Private Sub cmdlast_Click()
    
    rs.MoveLast
    UpdateTextBoxes
    
    
End Sub

Private Sub cmdmodify_Click()
    On Error GoTo er2
    cn.Execute "UPDATE H_roominfo SET room_status='" + txtroomstat.Text + "',r_typeid='" + txtroomtypeid.Text + "'WHERE ROOM_NO=" + txtroomnumber.Text + ""
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
    cn.Execute "insert into h_ROOMINFO values (" + txtroomnumber.Text + ",'" + txtroomstat.Text + "'," + txtroomtypeid.Text + ")"
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
    rs.Open "Select * from h_ROOMINFO", cn, adOpenDynamic, adLockOptimistic
    rs.MoveFirst
    UpdateTextBoxes
End Sub

