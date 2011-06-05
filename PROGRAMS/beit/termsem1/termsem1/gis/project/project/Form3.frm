VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Query"
   ClientHeight    =   4905
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7320
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4905
   ScaleWidth      =   7320
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List1 
      Height          =   2205
      Left            =   240
      TabIndex        =   7
      Top             =   2160
      Width           =   6495
   End
   Begin VB.CommandButton Command2 
      Caption         =   "SEARCH"
      Height          =   375
      Left            =   5400
      TabIndex        =   6
      Top             =   1440
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   3480
      TabIndex        =   5
      Top             =   1440
      Width           =   1215
   End
   Begin VB.ComboBox Combo2 
      Height          =   315
      ItemData        =   "Form3.frx":0000
      Left            =   2400
      List            =   "Form3.frx":0013
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "SEARCH"
      Height          =   375
      Left            =   5400
      TabIndex        =   2
      Top             =   600
      Width           =   1215
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Form3.frx":0028
      Left            =   3000
      List            =   "Form3.frx":003E
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   600
      Width           =   1695
   End
   Begin VB.Label Label2 
      Caption         =   "PLACES WHERE AREA"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   1440
      Width           =   1935
   End
   Begin VB.Label Label1 
      Caption         =   "PLACES WHERE LOCATION ="
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   600
      Width           =   2415
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim cn As New Connection
Dim rs As New Recordset

Private Sub Command1_Click()
Dim st As String
st = "select place from place where id in (select placeid from placedata where location= '" + Combo1.Text + "')"
If rs.State = adStateOpen Then
rs.Close
End If

rs.Open st, cn, adOpenDynamic, adLockBatchOptimistic
List1.Clear
While Not rs.EOF
List1.AddItem rs!place
rs.MoveNext
Wend
'List1.Refresh
End Sub


Private Sub Command2_Click()
Dim rs1 As New Recordset
st = "select place from place where id in (select placeid from placedata where location= '" + Combo1.Text + "')"
rs1.Open "Place", cn
If rs.State = adopenclosed Then
    rs.Open "PlaceData", cn
End If
rs.MoveFirst
rs1.MoveFirst
List1.Clear

Select Case Combo2.Text
Case "="
While Not rs.EOF
 If rs.Fields(4).Value = "Area" Then
    If rs.Fields(5).Value = Text1.Text Then
        List1.AddItem rs1!place
    End If
 ElseIf rs.Fields(6).Value = "Area" Then
    If rs.Fields(7).Value = Text1.Text Then
        List1.AddItem rs1!place
    End If
 End If
 rs.MoveNext
 rs1.MoveNext
Wend


Case "<"
While Not rs.EOF
 If rs.Fields(4).Value = "Area" Then
    If rs.Fields(5).Value < Text1.Text Then
        List1.AddItem rs1!place
    End If
 ElseIf rs.Fields(6).Value = "Area" Then
    If rs.Fields(7).Value < Text1.Text Then
        List1.AddItem rs1!place
    End If
 End If
 rs.MoveNext
 rs1.MoveNext
Wend


Case ">"
While Not rs.EOF
 If rs.Fields(4).Value = "Area" Then
    If rs.Fields(5).Value > Text1.Text Then
        List1.AddItem rs1!place
    End If
 ElseIf rs.Fields(6).Value = "Area" Then
    If rs.Fields(7).Value > Text1.Text Then
        List1.AddItem rs1!place
    End If
 End If
 rs.MoveNext
 rs1.MoveNext
Wend

Case ">="
While Not rs.EOF
 If rs.Fields(4).Value = "Area" Then
    If rs.Fields(5).Value >= Text1.Text Then
        List1.AddItem rs1!place
    End If
 ElseIf rs.Fields(6).Value = "Area" Then
    If rs.Fields(7).Value >= Text1.Text Then
        List1.AddItem rs1!place
    End If
 End If
 rs.MoveNext
 rs1.MoveNext
Wend

Case "<="
While Not rs.EOF
 If rs.Fields(4).Value = "Area" Then
    If rs.Fields(5).Value <= Text1.Text Then
        List1.AddItem rs1!place
    End If
 ElseIf rs.Fields(6).Value = "Area" Then
    If rs.Fields(7).Value <= Text1.Text Then
        List1.AddItem rs1!place
    End If
 End If
 rs.MoveNext
 rs1.MoveNext
Wend

    
End Select

rs1.Close



End Sub

Private Sub Form_Load()
cn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Password=;Data Source=D:\Documents and Settings\madhur.MADHUR.000\Desktop\New Folder\gis.mdb;Persist Security Info=True"
cn.Open

Combo2.ListIndex = 1
End Sub

Private Sub Form_Unload(Cancel As Integer)
cn.Close
Unload Me
End Sub
