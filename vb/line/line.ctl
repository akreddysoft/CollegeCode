VERSION 5.00
Begin VB.UserControl dline 
   AutoRedraw      =   -1  'True
   BackStyle       =   0  'Transparent
   CanGetFocus     =   0   'False
   ClientHeight    =   165
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5925
   ClipBehavior    =   0  'None
   ClipControls    =   0   'False
   ControlContainer=   -1  'True
   ScaleHeight     =   165
   ScaleWidth      =   5925
   Begin VB.Line Line2 
      BorderColor     =   &H80000007&
      X1              =   120
      X2              =   5760
      Y1              =   60
      Y2              =   60
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000009&
      BorderStyle     =   6  'Inside Solid
      BorderWidth     =   2
      X1              =   120
      X2              =   5760
      Y1              =   75
      Y2              =   75
   End
End
Attribute VB_Name = "dline"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Sub UserControl_Initialize()
'Line2.BorderColor = UserControl.BackColor

Line1.X1 = 0
Line2.X1 = 0
Line1.X2 = UserControl.ScaleWidth
Line2.X2 = UserControl.ScaleWidth
Line1.X1 = Line2.X1
Line1.X2 = Line2.X2

End Sub

Private Sub UserControl_Resize()
UserControl_Initialize
End Sub






