VERSION 5.00
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   5820
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7125
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu openforms 
      Caption         =   "&Open"
      Begin VB.Menu custinfo 
         Caption         =   "&Customer Information"
      End
      Begin VB.Menu roominfo 
         Caption         =   "&Room Information"
      End
      Begin VB.Menu tariffdetails 
         Caption         =   "&Tariff Details"
      End
      Begin VB.Menu empdetails 
         Caption         =   "&Employee Details"
      End
      Begin VB.Menu deptinfo 
         Caption         =   "&Department Information"
      End
      Begin VB.Menu billcreation 
         Caption         =   "&Create Bill"
      End
   End
   Begin VB.Menu viewtables 
      Caption         =   "&View "
      Begin VB.Menu cust_tableinfo 
         Caption         =   "&Customer Table"
      End
      Begin VB.Menu deptt_tableinfo 
         Caption         =   "&Departments"
      End
      Begin VB.Menu tarifftable 
         Caption         =   "Room &Tariffs"
      End
      Begin VB.Menu roompositions 
         Caption         =   "&Room Info"
      End
      Begin VB.Menu emptableinfo 
         Caption         =   "&Employees"
      End
      Begin VB.Menu billtables 
         Caption         =   "&Bill Table"
      End
   End
   Begin VB.Menu searchbyreqmt 
      Caption         =   "&Find"
   End
   Begin VB.Menu helpuser 
      Caption         =   "&Help"
   End
   Begin VB.Menu exitprog 
      Caption         =   "&Exit"
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public flag As Integer


Private Sub billcreation_Click()
totalbill.Show
End Sub

Private Sub cust_tableinfo_Click()
flag = 0
frmtablecust.Show
End Sub

Private Sub custinfo_Click()
    customer.Show
End Sub

Private Sub deptinfo_Click()
    department.Show
    
End Sub

Private Sub deptt_tableinfo_Click()
flag = 1
frmtablecust.Show
End Sub

Private Sub empdetails_Click()
    employee.Show
    
End Sub

Private Sub emptableinfo_Click()
flag = 2
frmtablecust.Show
End Sub

Private Sub exitprog_Click()
End
End Sub

Private Sub srchcustname_Click()
frmsrcust.Show

End Sub


Private Sub roominfo_Click()
    roominf.Show
    
End Sub

Private Sub roompositions_Click()
flag = 3
frmtablecust.Show
End Sub

Private Sub searchbyreqmt_Click()
    frmsrcust.Show
    
End Sub

Private Sub tariffdetails_Click()
roomtariff.Show

End Sub

Private Sub tarifftable_Click()
flag = 4
frmtablecust.Show
End Sub
