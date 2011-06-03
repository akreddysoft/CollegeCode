VERSION 5.00
Begin VB.Form frmarray 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   4800
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6390
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4800
   ScaleWidth      =   6390
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox cboelements 
      Height          =   315
      Left            =   2400
      TabIndex        =   2
      Top             =   2040
      Width           =   1215
   End
   Begin VB.CommandButton cmdonly5 
      Caption         =   "cut 5 elements"
      Height          =   495
      Left            =   3720
      TabIndex        =   1
      Top             =   840
      Width           =   1215
   End
   Begin VB.CommandButton cmdfill10 
      Caption         =   "fill 10 elements"
      Height          =   495
      Left            =   720
      TabIndex        =   0
      Top             =   840
      Width           =   1215
   End
End
Attribute VB_Name = "frmarray"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'declare a dynamic array
Dim gthearray() As Integer

Private Sub cmdfill10_Click()
Dim counter
'set the size of array
ReDim gthearray(1 To 10) As Integer
'fill
For counter = 1 To 10
gthearray(counter) = counter
Next counter

cboelements.Clear

For counter = 0 To 9
cboelements.AddItem Str(gthearray(counter + 1))
Next counter

End Sub

Private Sub cmdonly5_Click()
'set the size
ReDim Preserve gthearray(1 To 5) As Integer
Dim counter
'clear the combo
cboelements.Clear
'fill the items of combo
For counter = 0 To 4
cboelements.AddItem Str(gthearray(counter + 1))
Next counter

End Sub

