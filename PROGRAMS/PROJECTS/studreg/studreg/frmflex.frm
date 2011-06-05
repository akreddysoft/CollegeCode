VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmflex 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Data"
   ClientHeight    =   6510
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7485
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6510
   ScaleWidth      =   7485
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdclose 
      Caption         =   "&Close"
      Height          =   375
      Left            =   2760
      TabIndex        =   2
      Top             =   5760
      Width           =   1695
   End
   Begin VB.ComboBox cbotables 
      Height          =   315
      Left            =   2400
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   360
      Width           =   2175
   End
   Begin MSDataGridLib.DataGrid dgtable 
      Bindings        =   "frmflex.frx":0000
      Height          =   4335
      Left            =   240
      TabIndex        =   0
      Top             =   960
      Width           =   6855
      _ExtentX        =   12091
      _ExtentY        =   7646
      _Version        =   393216
      AllowUpdate     =   0   'False
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
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
End
Attribute VB_Name = "frmflex"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cbotables_Change()
Select Case cbotables.Text
    Case "Student Registration"
         dgtable.DataMember = "stud"
    Case "Event Registration"
         dgtable.DataMember = "evreg"
    Case "Team"
         dgtable.DataMember = "team"
    Case "Events"
         dgtable.DataMember = "event"
End Select

dataenv.rsevreg.Requery
'Set dgtable.DataSource = dataenv
dgtable.Refresh
dgtable.ReBind

End Sub

Private Sub cbotables_Click()
cbotables_Change
End Sub

Private Sub cmdclose_Click()
Unload Me
frmmain.Show
End Sub

Private Sub Form_Load()
cbotables.AddItem "Student Registration"
cbotables.AddItem "Event Registration"
cbotables.AddItem "Team"
cbotables.AddItem "Events"
'dgtable.

cbotables.ListIndex = 0

cbotables_Change

End Sub

Private Sub Form_Unload(Cancel As Integer)
Unload Me
frmmain.Show
'cbotables_Change

End Sub
