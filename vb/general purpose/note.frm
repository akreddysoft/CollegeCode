VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4590
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   3750
   LinkTopic       =   "Form1"
   ScaleHeight     =   4590
   ScaleWidth      =   3750
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   1200
      Top             =   2880
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   15
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "note.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "note.frx":0544
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "note.frx":0A88
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   3750
      _ExtentX        =   6615
      _ExtentY        =   609
      ButtonWidth     =   609
      ButtonHeight    =   556
      Appearance      =   1
      Style           =   1
      ImageList       =   "ImageList1"
      DisabledImageList=   "ImageList1"
      HotImageList    =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   2
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   2
         EndProperty
      EndProperty
      BorderStyle     =   1
   End
   Begin RichTextLib.RichTextBox text1 
      Height          =   855
      Left            =   960
      TabIndex        =   0
      Top             =   1440
      Width           =   975
      _ExtentX        =   1720
      _ExtentY        =   1508
      _Version        =   393217
      ScrollBars      =   3
      TextRTF         =   $"note.frx":0FCC
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   2280
      Top             =   1920
   End
   Begin MSComDlg.CommonDialog DIALOG 
      Left            =   360
      Top             =   2880
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Menu mnfile 
      Caption         =   "file"
      Begin VB.Menu mnunew 
         Caption         =   "new"
      End
      Begin VB.Menu mnuopen 
         Caption         =   "open"
      End
      Begin VB.Menu mnusave 
         Caption         =   "savefile"
      End
      Begin VB.Menu mnexit 
         Caption         =   "exit"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
Call mv
'Toolbar1.Buttons(1).Enabled = False
End Sub

Public Sub mv()
text1.Left = Form1.ScaleLeft
text1.Top = Form1.ScaleTop
text1.Height = Form1.Height
text1.Width = Form1.Width
End Sub

Private Sub Form_Resize()
Call mv
End Sub

Private Sub mnuopen_Click()
Dim a As String
With DIALOG
'    .Filter = "text files (*.txt)|*.txt|All files (*.*)|*.*"
    .Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*"
    .FilterIndex = 1
    .DefaultExt = ".txt"
    .Flags = cdlOFNHideReadOnly
    .DialogTitle = "open file"
    .ShowOpen
End With

text1.FileName = DIALOG.FileName
End Sub

Private Sub mnusave_Click()
DIALOG.ShowSave
Open DIALOG.FileName For Output As #1
Print #1, text1.Text
'text1.SaveFile DIALOG.FileName
End Sub

