VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "GIS Map"
   ClientHeight    =   10320
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   12870
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   10320
   ScaleWidth      =   12870
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.CheckBox chkgrid 
      Caption         =   "Show Grid"
      Height          =   255
      Left            =   6840
      TabIndex        =   16
      Top             =   1200
      Width           =   1695
   End
   Begin VB.TextBox Text2 
      Height          =   855
      Left            =   8820
      TabIndex        =   3
      Text            =   "Text2"
      Top             =   8580
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      Height          =   735
      Left            =   7260
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   8700
      Visible         =   0   'False
      Width           =   1455
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   7380
      Top             =   7620
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":0162
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":02C4
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":0426
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form2.frx":0588
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar statusbar 
      Align           =   2  'Align Bottom
      Height          =   495
      Left            =   0
      TabIndex        =   1
      Top             =   9825
      Width           =   12870
      _ExtentX        =   22701
      _ExtentY        =   873
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2822
            MinWidth        =   2822
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2822
            MinWidth        =   2822
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2822
            MinWidth        =   2822
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   2831
            MinWidth        =   2822
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar toolbar 
      Align           =   1  'Align Top
      Height          =   810
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12870
      _ExtentX        =   22701
      _ExtentY        =   1429
      ButtonWidth     =   1879
      ButtonHeight    =   1376
      Appearance      =   1
      Style           =   1
      ImageList       =   "ImageList1"
      DisabledImageList=   "ImageList1"
      HotImageList    =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   7
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Zoom in"
            Key             =   "zoomin"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Zoom out"
            Key             =   "zoomout"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageIndex      =   4
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Find Distance"
            Key             =   "find"
            ImageIndex      =   4
            Style           =   1
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Query"
            Key             =   "query"
            ImageIndex      =   5
         EndProperty
      EndProperty
      BorderStyle     =   1
   End
   Begin VB.Label nearby 
      AutoSize        =   -1  'True
      Caption         =   "Label4"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   10200
      TabIndex        =   19
      Top             =   3780
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Label3"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   0
      TabIndex        =   18
      Top             =   0
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Nearby Places"
      BeginProperty Font 
         Name            =   "Microsoft Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   8235
      TabIndex        =   17
      Top             =   3765
      Width           =   1515
   End
   Begin VB.Line Line6 
      X1              =   0
      X2              =   6360
      Y1              =   9720
      Y2              =   9720
   End
   Begin VB.Line Line5 
      X1              =   6360
      X2              =   6360
      Y1              =   840
      Y2              =   9720
   End
   Begin VB.Line Line4 
      BorderColor     =   &H80000005&
      X1              =   0
      X2              =   4560
      Y1              =   30
      Y2              =   30
   End
   Begin VB.Line Line3 
      X1              =   60
      X2              =   4500
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000005&
      X1              =   7380
      X2              =   11940
      Y1              =   2190
      Y2              =   2190
   End
   Begin VB.Line Line1 
      X1              =   7440
      X2              =   11880
      Y1              =   2160
      Y2              =   2160
   End
   Begin VB.Label data3 
      AutoSize        =   -1  'True
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   8400
      TabIndex        =   14
      Top             =   7110
      Visible         =   0   'False
      Width           =   720
   End
   Begin VB.Label value3 
      AutoSize        =   -1  'True
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   10200
      TabIndex        =   15
      Top             =   7110
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label value2 
      AutoSize        =   -1  'True
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   10200
      TabIndex        =   13
      Top             =   6150
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label data2 
      AutoSize        =   -1  'True
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   8280
      TabIndex        =   12
      Top             =   6150
      Visible         =   0   'False
      Width           =   720
   End
   Begin VB.Label value1 
      AutoSize        =   -1  'True
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   10200
      TabIndex        =   11
      Top             =   5190
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label location 
      AutoSize        =   -1  'True
      Caption         =   "Label4"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   10200
      TabIndex        =   10
      Top             =   4350
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label Category 
      AutoSize        =   -1  'True
      Caption         =   "Label3"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   10200
      TabIndex        =   9
      Top             =   3150
      Visible         =   0   'False
      Width           =   765
   End
   Begin VB.Label data1 
      AutoSize        =   -1  'True
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   8280
      TabIndex        =   8
      Top             =   5190
      Visible         =   0   'False
      Width           =   720
   End
   Begin VB.Label Label1 
      Caption         =   "Label2"
      Height          =   495
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   1455
   End
   Begin VB.Label dff 
      AutoSize        =   -1  'True
      Caption         =   "Location"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   8280
      TabIndex        =   6
      Top             =   4350
      Width           =   915
   End
   Begin VB.Label df 
      AutoSize        =   -1  'True
      Caption         =   "Category"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   8280
      TabIndex        =   5
      Top             =   3150
      Width           =   960
   End
   Begin VB.Label place 
      AutoSize        =   -1  'True
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   9240
      TabIndex        =   4
      Top             =   1440
      Visible         =   0   'False
      Width           =   930
   End
   Begin VB.Image imgmap 
      Height          =   8775
      Left            =   0
      Picture         =   "Form2.frx":09DA
      Stretch         =   -1  'True
      Top             =   840
      Width           =   6300
   End
End
Attribute VB_Name = "frmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim str1 As String
Dim hit, wid, top1, left1 As Integer
Dim level As Integer
Dim xco, xco1, yco, yco1 As Double
Dim mx, my As Double
Dim flag As Boolean
Dim cn As New Connection
Dim rs As New Recordset
Dim rs1 As New Recordset
Dim mflag As Boolean
Dim distance As Double

Private Sub chkgrid_Click()
show_grid

End Sub
Private Sub show_grid()
Dim i As Integer
If chkgrid.Value = vbChecked Then
    For i = 0 To imgmap.Width Step 300
        Line (i, imgmap.Top)-(i, imgmap.Top + imgmap.Height)
    Next
    For i = 0 To imgmap.Height Step 300
        Line (imgmap.Left, i + imgmap.Top)-(imgmap.Left + imgmap.Width, i + imgmap.Top)
    Next
Else
    imgmap.Refresh
End If

End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Load()
mflag = False
flag = True
wid = imgmap.Width
hit = imgmap.Height
top1 = imgmap.Top
left1 = imgmap.Left
str1 = "Provider=Microsoft.Jet.OLEDB.4.0;Password=;Data Source=D:\Documents and Settings\madhur.MADHUR.000\Desktop\New Folder\gis.mdb;Persist Security Info=True"

toolbar.Buttons(1).Enabled = True
toolbar.Buttons(3).Enabled = False
statusbar.Panels(3).Text = Str(imgmap.Width) + " X " + Str(imgmap.Height)


cn.Open str1
rs.ActiveConnection = cn
rs1.ActiveConnection = cn
rs.Open "Place"

rs1.Open "PlaceData"
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
statusbar.Panels(1).Text = "form : " + Str(X) + " " + Str(Y)
End Sub

Private Sub imgmap_Click()
Dim i As Integer
i = 0
Dim exp1 As Variant
Dim exp2 As Variant
                        
If flag = True Then
    
    If toolbar.Buttons(1).Enabled = False Then
           
            imgmap.Stretch = False
            xco1 = (xco * (imgmap.Width / wid) - wid / 2)
            yco1 = (yco * (imgmap.Height / hit) - hit / 2)
            If xco1 < 0 Then
            xco1 = 0
            End If
            If yco1 < 0 Then
            yco1 = 0
            End If
            imgmap.Move -xco1, -yco1, xco1 + wid, yco1 + hit
            toolbar.Buttons(3).Enabled = True
            toolbar.Buttons(1).Enabled = False
            flag = False
            'show_grid
            chkgrid.Enabled = False
    Else
        rs.MoveFirst
        rs1.MoveFirst
        While Not rs.EOF
            If Abs(rs.Fields("X") - xco / wid) < 0.0239316 And Abs(rs.Fields("Y") - yco / hit) < 0.0239316 Then
              '  MsgBox rs.Fields(1)
                filldata
            End If
            rs.MoveNext
        Wend
    End If


Else
        rs.MoveFirst
        rs1.MoveFirst
        While Not rs.EOF
            exp1 = Abs((xco / wid) / rs.Fields("X"))
            exp2 = Abs((yco / hit) / rs.Fields("Y"))
            If exp1 > 2 And exp1 < 2.2 And exp2 > 2 And exp2 < 2.2 Then
            '    MsgBox rs.Fields(1)
                filldata
            End If
            rs.MoveNext
        Wend
   
End If


Dim strw As String
strw = "x=" + Str(xco / wid) + "y=" + Str(yco / hit)
Text1.Text = Str(xco / wid)
Text2.Text = Str(yco / hit)
End Sub

Private Sub imgmap_DragOver(Source As Control, X As Single, Y As Single, State As Integer)

PSet (X, Y), RGB(0, 0, 0)
Line (0, 0)-(X, Y)

End Sub

Private Sub imgmap_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
mflag = True
mx = X
my = Y
End Sub

Private Sub imgmap_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim exp1 As Variant
Dim exp2 As Variant

statusbar.Panels(2).Text = "image : " + Str(X) + " " + Str(Y)

If toolbar.Buttons(1).Enabled = False And flag = True Then
    imgmap.MousePointer = vbCrosshair
ElseIf toolbar.Buttons(5).Value = tbrPressed Then
    imgmap.MousePointer = vbCrosshair

ElseIf flag = True Then 'means it is non zoomed
    rs.MoveFirst
    While Not rs.EOF
        If Abs(rs.Fields("X") - X / wid) < 0.0239316 And Abs(rs.Fields("Y") - Y / hit) < 0.0239316 Then
                imgmap.MousePointer = vbCross
         Else
                imgmap.MousePointer = vbDefault
         End If
            rs.MoveNext
    Wend
    
Else
        rs.MoveFirst
        While Not rs.EOF
            exp1 = Abs((xco / wid) / rs.Fields("X"))
            exp2 = Abs((yco / hit) / rs.Fields("Y"))
            If exp1 > 2 And exp1 < 2.2 And exp2 > 2 And exp2 < 2.2 Then
               ' MsgBox rs.Fields(1)
                imgmap.MousePointer = vbCross
            Else
                imgmap.MousePointer = vbDefault
            End If
            rs.MoveNext
        Wend
End If

If mflag = True And toolbar.Buttons(5).Value = tbrPressed Then
Dim ptx, pty, dptx, dpty As Integer
    imgmap.Refresh
    
    
    
    ptx = mx + imgmap.Left
    pty = my + imgmap.Top
    dptx = X + imgmap.Left
    dpty = Y + imgmap.Top
    
    If ptx > imgmap.Width Or dptx > imgmap.Width Then
        frmain.Refresh
    End If
    
    Line (ptx, pty)-(dptx, dpty)
    distance = Sqr(Abs((my - Y) * (my - Y) + (mx - X) * (mx - X)))
    statusbar.Panels(4).Text = "Distance : " + Str(distance / 500) + " km  "
   
End If

xco = X
yco = Y

End Sub
Private Sub imgmap_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If mflag = True And toolbar.Buttons(5).Value = tbrPressed Then
    MsgBox "The distance is : " + Str(distance / 500) + " km"
End If

mflag = False
End Sub

Private Sub toolbar_ButtonClick(ByVal Button As MSComctlLib.Button)
 
Select Case Button.Key
    Case "zoomin"
    
        toolbar.Buttons(3).Enabled = True
        toolbar.Buttons(1).Enabled = False
       
    Case "zoomout"
        
        imgmap.Stretch = True
        imgmap.Move left1, top1, wid, hit
        
        toolbar.Buttons(3).Enabled = False
        toolbar.Buttons(1).Enabled = True
        flag = True
        chkgrid.Enabled = True
        show_grid
    Case "find"
        If toolbar.Buttons(5).Value = tbrUnpressed Then
            statusbar.Panels(4).Text = ""
            imgmap.Refresh
            show_grid
        End If
    Case "query"
        Form1.Show


End Select
End Sub

Private Sub filldata()
                rs1.MoveFirst
                While Not rs1.EOF
                    If rs.Fields(0) = rs1.Fields(0) Then
                            
                            place.Caption = rs.Fields(1)
                            Category.Caption = rs1.Fields(2)
                            location.Caption = rs1.Fields(3)
                            nearby.Caption = rs1.Fields(1)
                            nearby.Visible = True
                            place.Visible = True
                            Category.Visible = True
                            location.Visible = True
                            If rs1.Fields(4).Value <> vbNull Then
                                data1.Caption = rs1.Fields(4).Value
                                value1.Caption = rs1.Fields(5).Value
                                data1.Visible = True
                                value1.Visible = True
                            Else
                                data1.Visible = False
                                value1.Visible = False
                            End If
                            
                            If rs1.Fields(6).Value <> vbNull Then
                                data2.Caption = rs1.Fields(6).Value
                                value2.Caption = rs1.Fields(7).Value
                                data2.Visible = True
                                value2.Visible = True
                            Else
                                data2.Visible = False
                                value2.Visible = False
                            End If
                            
                            If rs1.Fields(8).Value <> vbNull Then
                                data3.Caption = rs1.Fields(8).Value
                                value3.Caption = rs1.Fields(9).Value
                                data3.Visible = True
                                value3.Visible = True
                            Else
                                data3.Visible = False
                                value3.Visible = False
                            End If
                    End If
                    rs1.MoveNext
                    
                Wend
End Sub
