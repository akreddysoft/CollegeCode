VERSION 5.00
Begin VB.MDIForm frmpicture 
   BackColor       =   &H8000000C&
   Caption         =   "Parent"
   ClientHeight    =   3705
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   5175
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnufile 
      Caption         =   "File"
      Begin VB.Menu mnuexit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnushow 
      Caption         =   "Show Pictures"
      Begin VB.Menu mnushow1 
         Caption         =   "Show picture 1"
      End
      Begin VB.Menu mnushow2 
         Caption         =   "show picture 2"
      End
      Begin VB.Menu mnushow3 
         Caption         =   "show picture 3"
      End
      Begin VB.Menu mnusep 
         Caption         =   "-"
      End
      Begin VB.Menu mnushowall 
         Caption         =   "Show all"
      End
      Begin VB.Menu mnuclearall 
         Caption         =   "Clear all"
      End
   End
   Begin VB.Menu mnuwindow 
      Caption         =   "Window"
      WindowList      =   -1  'True
      Begin VB.Menu mnuarrange 
         Caption         =   "Arrange"
      End
      Begin VB.Menu mnucascade 
         Caption         =   "Cascade"
      End
      Begin VB.Menu mnutile 
         Caption         =   "Tile"
      End
   End
End
Attribute VB_Name = "frmpicture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub MDIForm_Load()
'when starting show 3 children
frmpicture1.Show
frmpicture2.Show
frmpicture3.Show
End Sub

Private Sub mnuarrange_Click()
frmpicture.Arrange vbarrange
End Sub

Private Sub mnucascade_Click()
frmpicture.Arrange vbCascade
End Sub

Private Sub mnuclearall_Click()
Unload frmpicture1
Unload frmpicture2
Unload frmpicture3

End Sub

Private Sub mnuexit_Click()
End
End Sub

Private Sub mnushow1_Click()
frmpicture1.Show

End Sub

Private Sub mnushow2_Click()
frmpicture2.Show

End Sub

Private Sub mnushow3_Click()
frmpicture3.Show

End Sub

Private Sub mnushowall_Click()
frmpicture1.Show
frmpicture2.Show
frmpicture3.Show

End Sub

Private Sub mnutile_Click()
frmpicture.Arrange vbhorizontoltile
End Sub
