VERSION 5.00
Begin VB.Form totalbill 
   Caption         =   "BILL CREATION"
   ClientHeight    =   7860
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10065
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
   ScaleHeight     =   7860
   ScaleWidth      =   10065
   Begin VB.CommandButton Command1 
      Caption         =   "Show Bill"
      Height          =   495
      Left            =   8520
      TabIndex        =   19
      Top             =   4920
      Width           =   1215
   End
   Begin VB.TextBox txttotalbill 
      Height          =   495
      Left            =   1680
      TabIndex        =   18
      Text            =   " "
      Top             =   4920
      Width           =   6495
   End
   Begin VB.TextBox txtnodays 
      Height          =   495
      Left            =   1680
      TabIndex        =   17
      Text            =   " "
      Top             =   4080
      Width           =   6495
   End
   Begin VB.CommandButton cmdfirst 
      Caption         =   "&First"
      Height          =   495
      Left            =   1320
      TabIndex        =   14
      Top             =   5640
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "&Previous"
      Height          =   495
      Left            =   2880
      TabIndex        =   13
      Top             =   5640
      Width           =   1215
   End
   Begin VB.CommandButton cmdnext 
      Caption         =   "&Next"
      Height          =   495
      Left            =   4440
      TabIndex        =   12
      Top             =   5640
      Width           =   1215
   End
   Begin VB.CommandButton cmdlast 
      Caption         =   "&Last"
      Height          =   495
      Left            =   6000
      TabIndex        =   11
      Top             =   5640
      Width           =   1215
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "&Add"
      Height          =   495
      Left            =   1320
      TabIndex        =   10
      Top             =   6360
      Width           =   1215
   End
   Begin VB.CommandButton cmddelete 
      Caption         =   "&Delete"
      Height          =   495
      Left            =   2880
      TabIndex        =   9
      Top             =   6360
      Width           =   1215
   End
   Begin VB.CommandButton cmdsave 
      Caption         =   "&Save"
      Height          =   495
      Left            =   4440
      TabIndex        =   8
      Top             =   6360
      Width           =   1215
   End
   Begin VB.CommandButton cmdmodify 
      Caption         =   "&Modify"
      Height          =   495
      Left            =   6000
      TabIndex        =   7
      Top             =   6360
      Width           =   1215
   End
   Begin VB.CommandButton exitbttn 
      Caption         =   "&Exit"
      Height          =   495
      Left            =   3720
      TabIndex        =   6
      Top             =   7080
      Width           =   1215
   End
   Begin VB.TextBox txtroomno 
      Height          =   495
      Left            =   1680
      TabIndex        =   5
      Text            =   " "
      Top             =   3120
      Width           =   6495
   End
   Begin VB.TextBox txtcustregno 
      Height          =   495
      Left            =   1680
      TabIndex        =   4
      Text            =   " "
      Top             =   2160
      Width           =   6495
   End
   Begin VB.TextBox txtbillid 
      Height          =   495
      Left            =   1680
      TabIndex        =   3
      Text            =   " "
      Top             =   1200
      Width           =   6495
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Total Bill"
      Height          =   495
      Left            =   120
      TabIndex        =   16
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "No. of Days of Stay"
      Height          =   495
      Left            =   0
      TabIndex        =   15
      Top             =   4080
      Width           =   1215
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Room Number"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   3120
      Width           =   1215
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Customer Registration"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Bill ID"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   1200
      Width           =   1215
   End
End
Attribute VB_Name = "totalbill"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim rs As New ADODB.Recordset
Dim rs1 As New ADODB.Recordset
Dim roomno As Integer
Dim typid As Integer
Dim fare, i As Integer
roomno = Val(txtroomno.Text)
rs.CursorLocation = adUseClient
rs1.CursorLocation = adUseClient

rs.Open "h_roominfo", cn1, adOpenDynamic, adLockOptimistic
rs1.Open "h_roomtariff", cn1, adOpenDynamic, adLockOptimistic

For i = 0 To rs.RecordCount - 1
    If rs(0) = roomno Then
        typid = rs(2)
        Exit For
    End If
rs.MoveNext
Next
For i = 0 To rs1.RecordCount - 1
    If typid = rs1(0) Then
        fare = rs1(2)
        Exit For
    End If
    rs1.MoveNext
Next


txttotalbill.Text = str(fare * Val(txtnodays.Text))


rs.Close
rs1.Close

    
        
End Sub

Private Sub Form_Load()

End Sub
