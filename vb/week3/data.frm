VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   4335
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6165
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4335
   ScaleWidth      =   6165
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdcount 
      Caption         =   "Count"
      Height          =   495
      Left            =   4680
      TabIndex        =   5
      Top             =   2400
      Width           =   1215
   End
   Begin VB.CommandButton cmdelete 
      Caption         =   "Delete"
      Height          =   495
      Left            =   4680
      TabIndex        =   4
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "Add Record"
      Height          =   495
      Left            =   4680
      TabIndex        =   3
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton cmdselect 
      Caption         =   "Select"
      Height          =   495
      Left            =   4680
      TabIndex        =   2
      Top             =   960
      Width           =   1215
   End
   Begin VB.TextBox txtdes 
      DataField       =   "Description"
      DataSource      =   "Data1"
      Height          =   615
      Left            =   1200
      TabIndex        =   1
      Top             =   1800
      Width           =   3255
   End
   Begin VB.Data Data1 
      Connect         =   "Access"
      DatabaseName    =   "E:\programming\codes\week3\test.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   1440
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Parts"
      Top             =   3720
      Width           =   3180
   End
   Begin VB.TextBox txtdata 
      DataField       =   "Partnum"
      DataSource      =   "Data1"
      Height          =   735
      Left            =   1200
      TabIndex        =   0
      Top             =   840
      Width           =   3255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdadd_Click()
Data1.Recordset.AddNew
End Sub

Private Sub cmdcount_Click()
Data1.Recordset.MoveLast
MsgBox Data1.Recordset.RecordCount
End Sub

Private Sub cmdelete_Click()
Data1.Recordset.Delete
Data1.Recordset.MoveNext

End Sub

Private Sub cmdselect_Click()
Data1.RecordSource = "select*from parts where partnum='100'"
Data1.Refresh
End Sub

Private Sub Form_Click()
'MsgBox "part number:" + txtdata.Text
Dim mystring As String
mystring = Data1.Recordset.Fields("partnum").Value
MsgBox "mystring"

End Sub

