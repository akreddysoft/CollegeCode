VERSION 5.00
Begin VB.Form frmopt 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Options"
   ClientHeight    =   3285
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4725
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3285
   ScaleWidth      =   4725
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdcancel 
      Caption         =   "&Cancel"
      Height          =   495
      Left            =   2520
      TabIndex        =   3
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton cmdok 
      Caption         =   "&OK"
      Height          =   495
      Left            =   840
      TabIndex        =   2
      Top             =   2520
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Height          =   2055
      Left            =   360
      TabIndex        =   0
      Top             =   120
      Width           =   3855
      Begin VB.CheckBox chkstudprint 
         Caption         =   "Print Student Registration Report"
         Height          =   255
         Left            =   360
         TabIndex        =   6
         Top             =   720
         Width           =   2895
      End
      Begin VB.CheckBox chkeventprint 
         Caption         =   "Print Event Registration Report"
         Height          =   375
         Left            =   360
         TabIndex        =   5
         Top             =   240
         Width           =   2535
      End
      Begin VB.CheckBox chkpreview 
         Caption         =   "Preview Report Before Print"
         Height          =   375
         Left            =   360
         TabIndex        =   4
         Top             =   1440
         Width           =   2415
      End
      Begin VB.CheckBox chkprintdlg 
         Caption         =   "Show Print Dialog"
         Height          =   375
         Left            =   360
         TabIndex        =   1
         Top             =   1080
         Width           =   1575
      End
   End
End
Attribute VB_Name = "frmopt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

    
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub cmdcancel_Click()
Unload Me
frmmain.Show
End Sub

Private Sub cmdok_Click()
If chkpreview.Value = vbChecked Then
    prevreport = True
Else
    prevreport = False
End If

If chkprintdlg.Value = vbChecked Then
    showprntdlg = True
Else
    showprntdlg = False
End If

If chkeventprint.Value = vbChecked Then
    eventprint = True
Else
    eventprint = False
End If

If chkstudprint.Value = vbChecked Then
    studprint = True
Else
    studprint = False
End If


Unload Me
frmmain.Show
End Sub

Private Sub Form_Load()
If prevreport = True Then
    chkpreview.Value = vbChecked
Else
    chkpreview.Value = vbUnchecked
End If


If Module1.showprntdlg = True Then
    Me.chkprintdlg.Value = vbChecked
Else
    Me.chkprintdlg.Value = vbUnchecked
End If

If eventprint = True Then
    Me.chkeventprint = vbChecked
Else
    Me.chkeventprint = vbUnchecked
End If

If studprint = True Then
    Me.chkstudprint = vbChecked
Else
    Me.chkstudprint = vbUnchecked
End If

End Sub
