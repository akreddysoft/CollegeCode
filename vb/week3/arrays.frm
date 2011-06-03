VERSION 5.00
Begin VB.Form frmarrays 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   4680
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5775
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4680
   ScaleWidth      =   5775
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Exit"
      Height          =   495
      Left            =   2160
      TabIndex        =   2
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CommandButton cmdarray2 
      Caption         =   "Array2"
      Height          =   495
      Left            =   3600
      TabIndex        =   1
      Top             =   2040
      Width           =   1215
   End
   Begin VB.CommandButton cmdarray1 
      Caption         =   "Array1"
      Height          =   495
      Left            =   600
      TabIndex        =   0
      Top             =   2040
      Width           =   1215
   End
End
Attribute VB_Name = "frmarrays"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'the first element of array is 10
'the last element of array is 20
Dim garray2(10 To 20) As Integer


Private Sub cmdarray1_Click()
Dim counter
'the first element is 1
'the Last Is 10
Static array1(1 To 10) As String
'fill 3 elements
array1(1) = "ABC"
array1(2) = "DEF"
array1(3) = "GHI"
frmarrays.Cls

Print "here are the elements of array1"
For counter = 1 To 3
Print "array1("; Str(counter); ")=" + array1(counter)
Next
End Sub

Private Sub cmdarray2_Click()
Dim counter
garray2(11) = 234
garray2(12) = 567
garray2(13) = 890
frmarrays.Cls
Print "here are the elements"
For counter = 11 To 13
Print "garray2("; Str(counter); ")="; Str(garray2(counter))
Next
End Sub

Private Sub Command1_Click()
End
End Sub
