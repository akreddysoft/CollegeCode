VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "gh"
   ClientHeight    =   5790
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   7215
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   386
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   481
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   3000
      Top             =   2280
   End
   Begin VB.Shape Shape1 
      BorderStyle     =   4  'Dash-Dot
      Height          =   3255
      Left            =   1440
      Shape           =   3  'Circle
      Top             =   1320
      Width           =   3735
   End
   Begin VB.Line Line1 
      X1              =   96
      X2              =   208
      Y1              =   192
      Y2              =   192
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim CX, CY, Msg, XPos, YPos   ' Declare variables.
Dim centre As Long
Dim xc, yc As Long

Sub Form_Click()
   ScaleMode = 3   ' Set ScaleMode to pixels.
   Form1.DrawWidth = 1  ' Set DrawWidth.
   Form1.ForeColor = QBColor(4)   ' Set foreground to red.
   Form1.FontSize = 24   ' Set point size.
   CX = ScaleWidth / 2   ' Get horizontal center.
   CY = ScaleHeight / 2   ' Get vertical center.
   Form1.Cls   ' Clear form.
   Msg = "Happy New Year!"
   Form1.CurrentX = CX - TextWidth(Msg) / 2   ' Horizontal position.
   Form1.CurrentY = CY - TextHeight(Msg) / 2 ' Vertical position.
   Print Msg   ' Print message.
   xc = Form1.ScaleWidth / 2
   yc = Form1.ScaleHeight / 2
   Do
      XPos = Rnd * ScaleWidth   ' Get horizontal position.
      YPos = Rnd * ScaleHeight   ' Get vertical position.
      If test = 1 Then
        Form1.PSet (XPos, YPos), QBColor(Rnd * 15)   ' Draw confetti.
       End If
       DoEvents   ' Yield to other processing
   Loop
End Sub

Private Sub Form_Unload(Cancel As Integer)
Unload Me
End
End Sub

Private Function test()
If XPos > Shape1.Left And XPos < Shape1.Left + Shape1.Width _
And YPos > Shape1.Top And YPos < Shape1.Top + Shape1.Height _
Then
    test = 1
Else
    test = 0
End If


End Function
