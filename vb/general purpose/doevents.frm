VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5280
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6045
   LinkTopic       =   "Form1"
   ScaleHeight     =   5280
   ScaleWidth      =   6045
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   3480
      Top             =   1800
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   855
      Left            =   1560
      TabIndex        =   1
      Top             =   2760
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   1440
      TabIndex        =   0
      Top             =   1440
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   375
      Left            =   720
      TabIndex        =   2
      Top             =   720
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
   ' Static variables are shared by all instances
   ' of a procedure.
   Static blnProcessing As Boolean
   Dim lngCt As Long
   Dim intYieldCt As Integer
   Dim dblDummy As Double
   ' When the button is clicked, test whether it's
    'already processing.
   If blnProcessing Then
      ' If processing is in progress, cancel it.
      blnProcessing = False
   Else
      Command1.Caption = "Cancel"
      blnProcessing = True
      lngCt = 0
      ' Perform a million floating-point
      ' multiplications. After every
      ' thousand, check for cancellation.
      Do While blnProcessing And (lngCt < 1000000)
         For intYieldCt = 1 To 1000
            lngCt = lngCt + 1
            dblDummy = lngCt * 3.14159
         Next intYieldCt
         ' The DoEvents statement allows other
         ' events to occur, including pressing this
         ' button a second time.
         DoEvents
      Loop
      blnProcessing = False
      Command1.Caption = "Process"
      MsgBox lngCt & " multiplications were performed"
   End If
End Sub

Private Sub Command2_Click()

   Static intClick As Integer
   Dim intClickNumber As Integer
   Dim dblEndTime As Double
      ' Each time the button is clicked,
      ' give it a unique number.
   intClick = intClick + 1
   intClickNumber = intClick
      ' Wait for ten seconds.
   dblEndTime = Timer + 10#
   Do While dblEndTime > Timer
      ' Do nothing but allow other
      ' applications to process
      ' their events.
      DoEvents
   Loop
   MsgBox "Click " & intClickNumber & " is finished"
End Sub


Private Sub Timer1_Timer()
Label1.Visible = Not Label1.Visible
End Sub
