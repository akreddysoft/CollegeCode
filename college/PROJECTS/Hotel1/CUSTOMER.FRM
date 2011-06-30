VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form customer 
   Caption         =   "CUSTOMER DETAILS"
   ClientHeight    =   6165
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7665
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
   ScaleHeight     =   6165
   ScaleWidth      =   7665
   Begin VB.TextBox txtnoppl 
      Height          =   375
      Left            =   3480
      TabIndex        =   30
      Text            =   " "
      Top             =   5880
      Width           =   3735
   End
   Begin VB.TextBox txtdepdate 
      Height          =   375
      Left            =   3480
      TabIndex        =   29
      Text            =   " "
      Top             =   7320
      Width           =   3735
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   240
      Top             =   8040
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
   Begin VB.CommandButton cmdfirst 
      Caption         =   "&First"
      Height          =   375
      Left            =   7800
      TabIndex        =   26
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "&Previous"
      Height          =   375
      Left            =   7800
      TabIndex        =   25
      Top             =   2595
      Width           =   1095
   End
   Begin VB.CommandButton cmdnext 
      Caption         =   "&Next"
      Height          =   375
      Left            =   7800
      TabIndex        =   24
      Top             =   3165
      Width           =   1095
   End
   Begin VB.CommandButton cmdlast 
      Caption         =   "&Last"
      Height          =   375
      Left            =   7800
      TabIndex        =   23
      Top             =   3720
      Width           =   1095
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "&Add"
      Height          =   375
      Left            =   9240
      TabIndex        =   22
      Top             =   2040
      Width           =   1095
   End
   Begin VB.CommandButton cmddelete 
      Caption         =   "&Delete"
      Height          =   375
      Left            =   9240
      TabIndex        =   21
      Top             =   3160
      Width           =   1095
   End
   Begin VB.CommandButton cmdsave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   9240
      TabIndex        =   20
      Top             =   2600
      Width           =   1095
   End
   Begin VB.CommandButton cmdmodify 
      Caption         =   "&Modify"
      Height          =   375
      Left            =   9240
      TabIndex        =   19
      Top             =   3720
      Width           =   1095
   End
   Begin VB.CommandButton exitbttn 
      Caption         =   "&Exit"
      Height          =   495
      Left            =   8520
      TabIndex        =   18
      Top             =   4440
      Width           =   1215
   End
   Begin VB.TextBox txtarrdate 
      BeginProperty DataFormat 
         Type            =   1
         Format          =   "MM/dd/yy"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1033
         SubFormatType   =   3
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   17
      Text            =   " "
      Top             =   6600
      Width           =   3735
   End
   Begin VB.TextBox Txtcustpov 
      Height          =   375
      Left            =   3480
      TabIndex        =   16
      Text            =   " "
      Top             =   5160
      Width           =   3735
   End
   Begin VB.TextBox txtcustroomno 
      Height          =   375
      Left            =   3480
      TabIndex        =   15
      Text            =   " "
      Top             =   4440
      Width           =   3735
   End
   Begin VB.TextBox txtage 
      Height          =   375
      Left            =   3480
      TabIndex        =   14
      Text            =   " "
      Top             =   3720
      Width           =   3735
   End
   Begin VB.TextBox txtzipcode 
      Height          =   375
      Left            =   3480
      TabIndex        =   13
      Text            =   " "
      Top             =   3000
      Width           =   3735
   End
   Begin VB.TextBox txtcity 
      Height          =   375
      Left            =   3480
      TabIndex        =   12
      Text            =   " "
      Top             =   2280
      Width           =   3735
   End
   Begin VB.TextBox txtstreet 
      Height          =   375
      Left            =   3480
      TabIndex        =   11
      Text            =   " "
      Top             =   1560
      Width           =   3735
   End
   Begin VB.TextBox txtcustname 
      Height          =   375
      Left            =   3480
      TabIndex        =   10
      Text            =   " "
      Top             =   840
      Width           =   3735
   End
   Begin VB.TextBox txtcustregno 
      Height          =   375
      Left            =   3480
      MaxLength       =   6
      TabIndex        =   9
      Text            =   " "
      Top             =   120
      Width           =   3735
   End
   Begin VB.Label Label11 
      Alignment       =   2  'Center
      Caption         =   "No. of People"
      Height          =   495
      Left            =   120
      TabIndex        =   28
      Top             =   5880
      Width           =   3015
   End
   Begin VB.Label Label10 
      Alignment       =   2  'Center
      Caption         =   "Check-Out Date"
      Height          =   495
      Left            =   120
      TabIndex        =   27
      Top             =   7200
      Width           =   3015
   End
   Begin VB.Label Label9 
      Alignment       =   2  'Center
      Caption         =   "Check-In Date"
      Height          =   495
      Left            =   120
      TabIndex        =   8
      Top             =   6540
      Width           =   3015
   End
   Begin VB.Label Label8 
      Alignment       =   2  'Center
      Caption         =   "Purpose of Visit"
      Height          =   495
      Left            =   120
      TabIndex        =   7
      Top             =   5160
      Width           =   3015
   End
   Begin VB.Label Label7 
      Alignment       =   2  'Center
      Caption         =   "Customer ROOM NUMBER"
      Height          =   495
      Left            =   120
      TabIndex        =   6
      Top             =   4440
      Width           =   3015
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "Age"
      Height          =   495
      Left            =   120
      TabIndex        =   5
      Top             =   3720
      Width           =   3015
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Postal ZIP code"
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   3000
      Width           =   3015
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "City"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   2280
      Width           =   3015
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Street Address"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   1560
      Width           =   3015
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Customer Name"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   3015
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Customer Registration Number"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3015
   End
End
Attribute VB_Name = "customer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim rs As New ADODB.Recordset

Private Sub cmdadd_Click()
    txtcustregno.Text = ""
    txtcustname.Text = ""
    txtstreet.Text = ""
    txtcity.Text = ""
    txtzipcode.Text = ""
    txtage.Text = ""
    txtcustroomno.Text = ""
    txtnoppl.Text = ""
    Txtcustpov.Text = ""
    txtarrdate.Text = ""
    txtdepdate.Text = ""
    
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
cn.Execute "DELETE from h_customer where cust_regno=" + txtcustregno.Text + ""
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

Private Sub cmdsave_Click()
Dim flag As Boolean
flag = False
 Dim str As String
 Dim rs1 As New ADODB.Recordset
 
 rs1.CursorLocation = adUseClient
 rs1.Open "select * from h_roominfo", cn, adOpenDynamic, adLockOptimistic
 
 rs1.MoveFirst
 
 For i = 0 To rs1.RecordCount - 1
    If txtcustroomno.Text = rs1(0) And rs1(1) = "Vacant" Then
    
        flag = True
        Exit For
    End If
flag = False
    rs1.MoveNext
Next

If flag = True Then
    str = "insert into h_customer values (" + txtcustregno.Text + ",'" + txtcustname.Text + "','" + txtstreet.Text + "','" + txtcity.Text + "'," + txtzipcode.Text + "," + txtage.Text + "," + txtcustroomno.Text + "," + txtnoppl.Text + ",'" + Txtcustpov.Text + "','" + txtarrdate.Text + "','" + txtdepdate.Text + "')"
    cn.Execute str
    cmdadd.Enabled = True
    cmddelete.Enabled = True
    cmdfirst.Enabled = True
    cmdlast.Enabled = True
    cmdnext.Enabled = True
    cmdPrev.Enabled = True
    cmdmodify.Enabled = True
 


    UpdateTextBoxes
    
    
    rs1(1) = "Occupied"
    rs1.Update
    rs1.Close
Else
    
    
    MsgBox "Room is Already Occupied"
End If
 
 If rs1.State = adStateOpen Then
'    rs1.Update
    rs1.Close
End If

 
 rs.Requery
 
 
 
 
 
 
'   On Error GoTo er1
   







        
    
    Exit Sub
'er1:
    'MsgBox "Error in saving the record" + Err.Description

End Sub

Private Sub exitbttn_Click()
End

End Sub

Private Sub Form_Load()
rs.Open "select * from h_customer", cn, adOpenDynamic, adLockOptimistic
rs.MoveFirst
UpdateTextBoxes

End Sub

Private Sub UpdateTextBoxes()
    txtcustregno.Text = rs("cust_regno")
    txtcustname.Text = rs("c_name")
    txtstreet.Text = rs("cstreet")
    txtcity.Text = rs("c_city")
    txtzipcode.Text = rs("c_zip")
    txtage.Text = rs("c_age")
    txtcustroomno.Text = rs("room_no")
    Txtcustpov.Text = rs("c_pov")
    txtarrdate.Text = rs("c_arrdate")
    txtnoppl.Text = rs("c_noppl")
    txtdepdate.Text = rs("c_depdate")
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
