VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmsrcust 
   Caption         =   "SEARCH QUERY TABLE"
   ClientHeight    =   7320
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9690
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
   ScaleHeight     =   7320
   ScaleWidth      =   9690
   Begin VB.ComboBox cbosearch 
      Height          =   330
      Left            =   4440
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   240
      Width           =   3255
   End
   Begin VB.ComboBox cborec 
      Height          =   330
      Left            =   960
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   6720
      Visible         =   0   'False
      Width           =   2295
   End
   Begin MSAdodcLib.Adodc adoquery 
      Height          =   735
      Left            =   3480
      Top             =   6480
      Visible         =   0   'False
      Width           =   1575
      _ExtentX        =   2778
      _ExtentY        =   1296
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
      Connect         =   "Provider=MSDAORA.1;Password=bvcoe;User ID=anirudh;Persist Security Info=True"
      OLEDBString     =   "Provider=MSDAORA.1;Password=bvcoe;User ID=anirudh;Persist Security Info=True"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "select * from h_customer"
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
   Begin VB.CommandButton cmdshow 
      Caption         =   "&Search"
      Height          =   495
      Left            =   7680
      TabIndex        =   2
      Top             =   1560
      Width           =   1215
   End
   Begin MSDataGridLib.DataGrid grid2 
      Height          =   3855
      Left            =   240
      TabIndex        =   1
      Top             =   2520
      Width           =   9255
      _ExtentX        =   16325
      _ExtentY        =   6800
      _Version        =   393216
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
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
         DataField       =   ""
         Caption         =   ""
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
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtname 
      Height          =   495
      Left            =   4440
      TabIndex        =   0
      Top             =   1560
      Width           =   2655
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Enter a value to begin searching database"
      Height          =   855
      Left            =   600
      TabIndex        =   7
      Top             =   1440
      Width           =   3255
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Enter Query to be searched by the respective field"
      Height          =   855
      Left            =   600
      TabIndex        =   6
      Top             =   240
      Width           =   3255
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   495
      Left            =   4080
      TabIndex        =   5
      Top             =   3480
      Width           =   1335
   End
End
Attribute VB_Name = "frmsrcust"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim str As String

Private Sub cborec_Change()
Set grid2.DataSource = adoquery
str = "select * from h_customer where cust_regno='" + cborec.Text + "'"
adoquery.Recordset.Close
adoquery.Recordset.Open str, cn1, adOpenDynamic, adLockOptimistic

grid2.ClearFields
grid2.ReBind
End Sub

Private Sub cborec_Click()
cborec_Change

End Sub

Private Sub cmdshow_Click()
Dim rs As New ADODB.Recordset
Dim query As String
Dim str As String
Dim name1 As String

Set grid2.DataSource = adoquery
adoquery.Recordset.Close
name1 = txtname.Text

Select Case cbosearch.ListIndex
Case 0

str = "select * from h_customer where c_name='" + name1 + "'"
adoquery.Recordset.Open str, cn1, adOpenDynamic, adLockOptimistic

Case 1
str = "select * from h_customer where cust_regno=" + name1

Case 2
str = "select * from h_department where deptt_desc='" + name1 + "'"

Case 3
str = "select * from h_department where deptt_id=" + name1

Case 4
str = "select * from h_employee where empid=" + name1 + ""

Case 5
str = "select * from h_employee where ename='" + name1 + "'"

Case 6
str = "select * from h_roominfo where room_no=" + name1

Case 7
str = "select * from h_totalbill where billid=" + name1


End Select
adoquery.Recordset.Open str, cn1, adOpenDynamic, adLockOptimistic
grid2.ClearFields
grid2.ReBind

End Sub

Private Sub Form_Load()
cbosearch.AddItem "Customer name"
cbosearch.AddItem "Customer registration number"
cbosearch.AddItem "department name "
cbosearch.AddItem "department id"
cbosearch.AddItem "employee id "
cbosearch.AddItem "employee name"
cbosearch.AddItem "room number"
cbosearch.AddItem "bill id"

cbosearch.ListIndex = 0

Dim rs As New ADODB.Recordset
rs.Open "h_customer", cn1, adOpenDynamic, adLockOptimistic
While Not rs.EOF
    cborec.AddItem rs(0)
    rs.MoveNext
Wend

End Sub
