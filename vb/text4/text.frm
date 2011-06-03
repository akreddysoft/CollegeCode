VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmtext 
   AutoRedraw      =   -1  'True
   ClientHeight    =   6090
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7155
   Icon            =   "text.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6090
   ScaleWidth      =   7155
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox cbofont 
      Height          =   315
      ItemData        =   "text.frx":0CCA
      Left            =   60
      List            =   "text.frx":0CCC
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   420
      Width           =   2565
   End
   Begin MSComctlLib.ImageList imglist 
      Left            =   3600
      Top             =   3600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   15
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   68
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":0CCE
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":1212
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":1756
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":1C9A
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":21DE
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":2722
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":2C66
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":2D7A
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":2E8E
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":2FA2
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":30B6
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":31CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":32DE
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":33F2
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":3506
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":361A
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":372E
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":3842
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":3956
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":3A6A
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":3B7E
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":3C92
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":3DA6
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":3EBA
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":3FCE
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":40E2
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":41F6
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":430A
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":441E
            Key             =   ""
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":4532
            Key             =   ""
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":4646
            Key             =   ""
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":475A
            Key             =   ""
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":486E
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":4982
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":4A96
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":4BAA
            Key             =   ""
         EndProperty
         BeginProperty ListImage37 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":4CBE
            Key             =   ""
         EndProperty
         BeginProperty ListImage38 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":4DD2
            Key             =   ""
         EndProperty
         BeginProperty ListImage39 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":4EE6
            Key             =   ""
         EndProperty
         BeginProperty ListImage40 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":4FFA
            Key             =   ""
         EndProperty
         BeginProperty ListImage41 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":510E
            Key             =   ""
         EndProperty
         BeginProperty ListImage42 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":5222
            Key             =   ""
         EndProperty
         BeginProperty ListImage43 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":5336
            Key             =   ""
         EndProperty
         BeginProperty ListImage44 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":544A
            Key             =   ""
         EndProperty
         BeginProperty ListImage45 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":555E
            Key             =   ""
         EndProperty
         BeginProperty ListImage46 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":5672
            Key             =   ""
         EndProperty
         BeginProperty ListImage47 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":5786
            Key             =   ""
         EndProperty
         BeginProperty ListImage48 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":589A
            Key             =   ""
         EndProperty
         BeginProperty ListImage49 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":59AE
            Key             =   ""
         EndProperty
         BeginProperty ListImage50 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":5AC2
            Key             =   ""
         EndProperty
         BeginProperty ListImage51 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":5BD6
            Key             =   ""
         EndProperty
         BeginProperty ListImage52 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":5CEA
            Key             =   ""
         EndProperty
         BeginProperty ListImage53 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":5DFE
            Key             =   ""
         EndProperty
         BeginProperty ListImage54 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":5F12
            Key             =   ""
         EndProperty
         BeginProperty ListImage55 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":6026
            Key             =   ""
         EndProperty
         BeginProperty ListImage56 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":613A
            Key             =   ""
         EndProperty
         BeginProperty ListImage57 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":624E
            Key             =   ""
         EndProperty
         BeginProperty ListImage58 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":6362
            Key             =   ""
         EndProperty
         BeginProperty ListImage59 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":6476
            Key             =   ""
         EndProperty
         BeginProperty ListImage60 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":658A
            Key             =   ""
         EndProperty
         BeginProperty ListImage61 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":669E
            Key             =   ""
         EndProperty
         BeginProperty ListImage62 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":67B2
            Key             =   ""
         EndProperty
         BeginProperty ListImage63 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":6CF6
            Key             =   ""
         EndProperty
         BeginProperty ListImage64 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":723A
            Key             =   ""
         EndProperty
         BeginProperty ListImage65 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":777E
            Key             =   ""
         EndProperty
         BeginProperty ListImage66 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":7CC2
            Key             =   ""
         EndProperty
         BeginProperty ListImage67 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":8206
            Key             =   ""
         EndProperty
         BeginProperty ListImage68 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "text.frx":874A
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar pictool 
      Align           =   1  'Align Top
      Height          =   345
      Left            =   0
      TabIndex        =   6
      Top             =   0
      Width           =   7155
      _ExtentX        =   12621
      _ExtentY        =   609
      ButtonWidth     =   609
      ButtonHeight    =   556
      Wrappable       =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "imglist"
      DisabledImageList=   "imglist"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   12
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "new"
            ImageIndex      =   34
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "open"
            ImageIndex      =   35
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "save"
            ImageIndex      =   42
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "print"
            ImageIndex      =   64
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "prv"
            ImageIndex      =   63
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "find"
            ImageIndex      =   21
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "cut"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "copy"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "paste"
            ImageIndex      =   36
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox picstat 
      Align           =   2  'Align Bottom
      BackColor       =   &H8000000A&
      BorderStyle     =   0  'None
      Height          =   330
      Left            =   0
      ScaleHeight     =   330
      ScaleWidth      =   7155
      TabIndex        =   3
      Top             =   5760
      Width           =   7155
      Begin VB.Label lblsize 
         Height          =   225
         Left            =   45
         TabIndex        =   4
         Top             =   75
         Width           =   1125
      End
   End
   Begin VB.ComboBox cbosize 
      Height          =   315
      Left            =   2760
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   420
      Width           =   675
   End
   Begin MSComDlg.CommonDialog dialog 
      Left            =   4920
      Top             =   2700
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      Flags           =   1
      Orientation     =   2
   End
   Begin RichTextLib.RichTextBox txtext 
      Height          =   5325
      Left            =   0
      TabIndex        =   0
      Top             =   840
      Width           =   7215
      _ExtentX        =   12726
      _ExtentY        =   9393
      _Version        =   393217
      BackColor       =   14212312
      HideSelection   =   0   'False
      ScrollBars      =   2
      TextRTF         =   $"text.frx":8C8E
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Fixedsys"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.CommandButton cmdbold 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3600
      Picture         =   "text.frx":8D53
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   1440
      Width           =   375
   End
   Begin MSComctlLib.Toolbar pictool1 
      Align           =   1  'Align Top
      Height          =   345
      Left            =   0
      TabIndex        =   7
      Top             =   345
      Width           =   7155
      _ExtentX        =   12621
      _ExtentY        =   609
      ButtonWidth     =   609
      ButtonHeight    =   556
      Wrappable       =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "imglist"
      DisabledImageList=   "imglist"
      HotImageList    =   "imglist"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   4
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   9
            Style           =   4
            Object.Width           =   3500
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "bold"
            ImageIndex      =   9
            Style           =   1
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "italic"
            ImageIndex      =   27
            Style           =   1
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "under"
            ImageIndex      =   54
            Style           =   1
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnifile 
      Caption         =   "&File"
      Begin VB.Menu mnunew 
         Caption         =   "&New"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuopen1 
         Caption         =   "&Open dialog..."
         Shortcut        =   ^O
      End
      Begin VB.Menu mnushow 
         Caption         =   "&Save dialog"
         Shortcut        =   ^S
      End
      Begin VB.Menu mnusaveas 
         Caption         =   "Save &As"
         Shortcut        =   ^A
      End
      Begin VB.Menu jh 
         Caption         =   "-"
      End
      Begin VB.Menu mnuopen 
         Caption         =   "&open..."
      End
      Begin VB.Menu mnusave 
         Caption         =   "&Save"
      End
      Begin VB.Menu kj 
         Caption         =   "-"
      End
      Begin VB.Menu mnuexit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuview 
      Caption         =   "View"
      Begin VB.Menu mnustatusbar 
         Caption         =   "Status Bar"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnutoolbar 
         Caption         =   "Toolbar"
         Begin VB.Menu mnustandard 
            Caption         =   "Standard"
            Checked         =   -1  'True
         End
         Begin VB.Menu mnuformat 
            Caption         =   "Formatting"
            Checked         =   -1  'True
         End
      End
   End
   Begin VB.Menu mnuedit 
      Caption         =   "&Edit"
      Begin VB.Menu mnucut 
         Caption         =   "Cu&t"
         Shortcut        =   ^X
      End
      Begin VB.Menu mnucopy 
         Caption         =   "&Copy"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnupaste 
         Caption         =   "&Paste"
         Shortcut        =   ^V
      End
      Begin VB.Menu hg 
         Caption         =   "-"
      End
      Begin VB.Menu mnusearch 
         Caption         =   "&Find..."
         Shortcut        =   ^F
      End
      Begin VB.Menu mnunext 
         Caption         =   "Find &Next"
         Shortcut        =   {F3}
      End
      Begin VB.Menu hj 
         Caption         =   "-"
      End
      Begin VB.Menu mnufont 
         Caption         =   "&Set Font"
      End
   End
   Begin VB.Menu mnutools 
      Caption         =   "&Tools"
      Begin VB.Menu mnuopt 
         Caption         =   "&Options"
      End
   End
   Begin VB.Menu mnuhelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuabout 
         Caption         =   "&About Filedit..."
      End
   End
End
Attribute VB_Name = "frmtext"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim title, undoc As String ' variables for titles
Dim stat As Boolean ' variable for controling visibility of status bar
Dim fonts As Integer ' stores the no. of fonts installed
Dim changedoc, savecancel As Boolean ' determines whether the document has been changed after the last save
Dim answer As Integer ' stores the responses of message box

Private Sub cbofont_Click()
txtext.Font = cbofont.Text
End Sub

Private Sub cbosize_Click()
txtext.SelFontSize = cbosize.Text
End Sub
Private Sub Form_Initialize()
Dim i, j, pos As Integer
stat = True
undoc = "Untitled"
title = " - Filedit By Madhur Ahuja"
frmtext.Caption = undoc + title
fonts = Screen.FontCount
For i = 1 To fonts - 1
cbofont.AddItem Screen.fonts(i)
Next
cbofont.ListIndex = 0
For i = 10 To 90 Step 2
cbosize.AddItem i
Next
cbosize.ListIndex = 0
Call largefont

windir = String(144, " ")
wind = GetWindowsDirectory(windir, 144)
leng = Left(windir, Len(windir))

changedoc = False ' variable is intitialised
lblsize.Caption = "No File Open"
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
If changedoc = True Then
answer = ask()

Select Case answer
 Case vbYes
  Call mnushow_Click
   If savecancel = True Then
   'Exit Sub      this will not work
   Cancel = 1
   savecancel = False
   End If
 
 Case vbNo
  End
 
 Case vbCancel
  Cancel = 1

End Select
End If

End Sub

Private Sub Form_Resize()
If mnustatusbar.Checked = True Then
txtext.Height = frmtext.ScaleHeight - pictool.Height - picstat.Height - pictool1.Height
Else
txtext.Height = frmtext.ScaleHeight - pictool.Height - pictool1.Height
End If
txtext.Width = frmtext.ScaleWidth

End Sub

Private Sub mnuabout_Click()
frmAbout.Show
End Sub

Private Sub mnucopy_Click()
Clipboard.Clear
Clipboard.SetText (txtext.SelText)
End Sub

Private Sub mnucut_Click()
Clipboard.Clear
Clipboard.SetText (txtext.SelText)
txtext.SelText = ""
End Sub

Private Sub mnuexit_Click()
End
End Sub

Private Sub mnufont_Click()
On Error GoTo error
dialog.ShowFont
With txtext
    .Font = dialog.FontName
    .Font.size = dialog.FontSize
    .Font.Bold = dialog.FontBold
    .Font.Italic = dialog.FontItalic
    .Font.Underline = dialog.FontUnderline
End With

error:
If Err.Number = 32755 Then ' error of pressing cancel
Exit Sub
Else
MsgBox Err.Description, vbOKOnly + vbCritical, "Filedit"
Exit Sub
End If
End Sub
Private Sub mnuEdit_Click()
    If txtext.SelText = "" Then        'if no text is selected
        mnucut.Enabled = False
        mnucopy.Enabled = False
    Else                                'if some text is selected
        mnucut.Enabled = True
        mnucopy.Enabled = True
    End If
    If Clipboard.GetText() = "" Then    'if no text is on the clipboard
        mnupaste.Enabled = False
    Else                                'if some text is on the clipboard
        mnupaste.Enabled = True
    End If
    
End Sub

Private Sub mnuformat_Click()
If mnuformat.Checked = True Then
    mnuformat.Checked = False
    pictool1.Visible = False
Else
    pictool1.Visible = True
    mnuformat.Checked = True
End If
End Sub

Private Sub mnunew_Click()
If changedoc = True Then
' if the current document has been changed after the last save
' then , show the save,cancel message and take action
answer = ask()
Select Case answer
 Case vbYes
  Call mnushow_Click ' user selected to save the file
 Case vbNo
  ' user selected no, proceed with the code after end if
 Case vbCancel
 Exit Sub  ' user did not want to open the new doc
 
End Select
End If

'this code executes in case vbno, i.e. user wants new doc
' also executes when the previous doc has not beeen changed
'since last save
txtext.filename = "" ' no file opened
frmtext.Caption = undoc + title 'default title
lblsize.Caption = "No File Open"  ' statusbar title
txtext.Text = "" 'clear the text in textbox

changedoc = False ' new file has not been changed

End Sub

Private Sub mnuopen_Click()
If changedoc = True Then ' current doc has been changed
    answer = ask()
    Select Case answer
    Case vbYes
        Call mnushow_Click
    Case vbNo
    Case vbCancel
        Exit Sub
    
    End Select
End If

frmsize.Caption = "Open"
frmsize.Show
frmsize.cmdopen.Enabled = True
frmsize.cmdok.Enabled = False
frmsize.cmdok.Visible = False
End Sub
Private Sub mnuopen1_Click()

On Error GoTo error

If changedoc = True Then
    answer = ask()
    Select Case answer
    Case vbYes
         Call mnushow_Click    ' user want to save prvios file
    Case vbNo
                     ' execute the code after end if
    Case vbCancel
        Exit Sub
    End Select
End If

dialog.Flags = cdlOFNHideReadOnly 'hide the read only check box
With dialog
    .InitDir = "C:\windows\desktop"
    .Filter = "(*.txt)|*.txt|(*.*)|*.*"
    .FilterIndex = 0
    .ShowOpen
End With
filename = dialog.filename
Call openfile(filename)
' send the filename to openfile procedure which opens the file
changedoc = False ' the new file opened has not been chaged

error:
savecancel = True
Exit Sub
End Sub

Private Sub mnuopt_Click()
frmopt.Show
End Sub

Private Sub mnupaste_Click()
txtext.SelText = Clipboard.GetText
End Sub

Private Sub mnusave_Click()
' if the file has been saved earlier(when file is saved title
'is changed to filename) then simply overwrite the saved file
' do not display the dialog
If frmtext.Caption <> undoc + title Then
    Call savefile(filename)
Else
' file is never saved earlier, so prompt for filename
frmsize.Caption = "Save"
frmsize.Show
frmsize.cmdok.Enabled = True
frmsize.cmdopen.Enabled = False
frmsize.cmdopen.Visible = False
End If
End Sub

Private Sub mnushow_Click()
' this is very importnt func,this displays the save dialog box
'for saving, but first checks that the file has bbeen earlier
'saved or not. if saved it simply overwrites the previos file
'using savefile() func, else displays dialog
'it is commonly called when user tries to open a new file,
'exits the app when working on unsaved file
On Error GoTo error

If frmtext.Caption <> undoc + title Then
    Call savefile(filename)
Else
    With dialog
        .Flags = cdlOFNHideReadOnly
        .Filter = "(*.txt)|*.txt|(*.*)|*.*"
        .InitDir = "C:\windows\desktop"
        .FilterIndex = 0
        .ShowSave
        filename = .filename
    End With
    Call savefile(filename)
End If

error:
savecancel = True   '''VERY IMPORTANT  - SHOULD ALWAYS BE ABOVE EXIT SUB
Exit Sub

End Sub
Private Function ask() As Integer
Dim response As Integer
Const message = "Do you want to save the current document?"
Const Button = vbYesNoCancel + vbQuestion
response = MsgBox(message, Button, "Filedit")
ask = response
End Function
Public Sub savefile(filename As Variant)
' this function simply saves the file to the filename, do not
' display any dialog box, so it is called when save file
'dialog is displayed
txtext.savefile filename
frmtext.Caption = filename

changedoc = False
End Sub

Public Sub openfile(filename As Variant)
On Error GoTo error
' this function simply opens the file, did not display any
' dialog box, so it is called when open dialog box is displayd
txtext.filename = filename
frmtext.Caption = filename + title
Dim size As Single
size = FileLen(filename)
size = size / 1024
size = Format(size, "0.00")
frmtext.lblsize.Caption = Str(size) + " kb"
changedoc = False

error:
Resume Next
Exit Sub
End Sub
Private Sub mnustandard_Click()
If mnustandard.Checked = True Then
    pictool.Visible = False
    mnustandard.Checked = False
Else
    pictool.Visible = True
    mnustandard.Checked = True
End If
End Sub

Private Sub mnustatusbar_Click()
If stat = True Then
    picstat.Visible = False
    mnustatusbar.Checked = False
    stat = False
Else
    picstat.Visible = True
    mnustatusbar.Checked = True
    stat = True
End If
Form_Resize

End Sub

Private Sub pictool_ButtonClick(ByVal Button As MSComctlLib.Button)
'pictool.Buttons(0) = mnunew_Click()
 Select Case Button.Key
 Case "new"
     Call mnunew_Click
 Case "open"
    Call mnuopen1_Click
 Case "save"
    Call mnushow_Click
 Case "find"
    frmfind.Show
 Case "cut"
    Call mnucut_Click
 Case "copy"
    mnucopy_Click
 Case "paste"
    mnupaste_Click
 End Select
End Sub

Private Sub pictool1_ButtonClick(ByVal Button As MSComctlLib.Button)
Select Case Button.Key
Case "bold"
    txtext.Font.Bold = Not txtext.Font.Bold
Case "italic"
    txtext.Font.Italic = Not txtext.Font.Italic
Case "under"
    txtext.Font.Underline = Not txtext.Font.Underline
End Select
End Sub

Private Sub txtext_Change()
changedoc = True
If txtext.SelText = "" Then
    mnucut.Enabled = False
    mnucopy.Enabled = False
Else
    mnucut.Enabled = True
    mnucopy.Enabled = True
End If

If Clipboard.GetText() = "" Then
    mnupaste.Enabled = False
Else
    mnupaste.Enabled = True
End If
End Sub
Private Sub txtext_SelChange()
If txtext.SelText = "" Then
    mnucut.Enabled = False
    mnucopy.Enabled = False
Else
    mnucut.Enabled = True
    mnucopy.Enabled = True
End If

If Clipboard.GetText() = "" Then
    mnupaste.Enabled = False
Else
    mnupaste.Enabled = True
End If
End Sub

Private Sub largefont()
Dim screenfont(0 To 99) As String
Dim largefont, temp, smallfont As String
Dim i, j, pos As Integer

For i = 0 To fonts - 1
    screenfont(i) = Screen.fonts(i)
Next

'to determine the largestt length font
'||||||||||||||||||||||||||||||||||||||||||
largefont = screenfont(0)
pos = 0
For i = 0 To fonts - 1
    If Len(screenfont(i)) > Len(largefont) Then
        largefont = screenfont(i)
        pos = i
    End If
Next
txtext.Text = largefont
'|||||||||||||||||||||||||||||||||||||||||||

End Sub
