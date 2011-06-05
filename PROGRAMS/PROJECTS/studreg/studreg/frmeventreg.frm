VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Begin VB.Form frmeventreg 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Event Registration"
   ClientHeight    =   5955
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8040
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5955
   ScaleWidth      =   8040
   Begin VB.CommandButton cmdcancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3480
      TabIndex        =   25
      Top             =   5040
      Width           =   1575
   End
   Begin VB.CommandButton cmdadd 
      Caption         =   "&Register"
      Height          =   375
      Left            =   1560
      TabIndex        =   24
      Top             =   5040
      Width           =   1335
   End
   Begin VB.CommandButton cmdnew 
      Caption         =   "&Add"
      Height          =   375
      Left            =   1560
      TabIndex        =   16
      Top             =   5040
      Width           =   1335
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "&Close"
      Height          =   375
      Left            =   3480
      TabIndex        =   15
      Top             =   5040
      Width           =   1575
   End
   Begin VB.Frame fmteam 
      Caption         =   "Team Events"
      Height          =   2655
      Left            =   360
      TabIndex        =   6
      Top             =   1920
      Width           =   6855
      Begin VB.ComboBox cboBrain 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4200
         Style           =   2  'Dropdown List
         TabIndex        =   23
         Top             =   2160
         Width           =   1815
      End
      Begin VB.ComboBox cboweb 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4200
         Style           =   2  'Dropdown List
         TabIndex        =   22
         Top             =   1680
         Width           =   1815
      End
      Begin VB.ComboBox cboloc 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4200
         Style           =   2  'Dropdown List
         TabIndex        =   21
         Top             =   1200
         Width           =   1815
      End
      Begin MSDataListLib.DataCombo cbobraind 
         Bindings        =   "frmeventreg.frx":0000
         DataField       =   "e_day"
         DataMember      =   "day"
         DataSource      =   "dataenv"
         Height          =   315
         Left            =   2400
         TabIndex        =   19
         Top             =   2160
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         Enabled         =   0   'False
         Style           =   2
         ListField       =   "e_day"
         Text            =   ""
         Object.DataMember      =   "day"
      End
      Begin MSDataListLib.DataCombo cbowebd 
         Bindings        =   "frmeventreg.frx":001A
         DataField       =   "e_day"
         DataMember      =   "day"
         DataSource      =   "dataenv"
         Height          =   315
         Left            =   2400
         TabIndex        =   18
         Top             =   1680
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         Enabled         =   0   'False
         Style           =   2
         ListField       =   "e_day"
         Text            =   ""
         Object.DataMember      =   "day"
      End
      Begin MSDataListLib.DataCombo cbolocd 
         Bindings        =   "frmeventreg.frx":0034
         DataField       =   "e_day"
         DataMember      =   "day"
         DataSource      =   "dataenv"
         Height          =   315
         Left            =   2400
         TabIndex        =   17
         Top             =   1200
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         Enabled         =   0   'False
         Style           =   2
         ListField       =   "e_day"
         BoundColumn     =   ""
         Text            =   ""
         Object.DataMember      =   "day"
      End
      Begin VB.CheckBox chkinno 
         Caption         =   "&Innovations"
         Enabled         =   0   'False
         Height          =   255
         Left            =   360
         TabIndex        =   14
         Top             =   360
         Width           =   1215
      End
      Begin VB.CheckBox chktechno 
         Caption         =   "T&echno Spreadsheets"
         Enabled         =   0   'False
         Height          =   255
         Left            =   360
         TabIndex        =   13
         Top             =   795
         Width           =   2055
      End
      Begin VB.CheckBox chkloc 
         Caption         =   "&Line of Code"
         Height          =   255
         Left            =   360
         TabIndex        =   12
         Top             =   1230
         Width           =   1575
      End
      Begin VB.CheckBox chkweb 
         Caption         =   "&Web Weaver"
         Height          =   255
         Left            =   360
         TabIndex        =   11
         Top             =   1665
         Width           =   1575
      End
      Begin VB.CheckBox chkbrain 
         Caption         =   "&BrainScan"
         Height          =   255
         Left            =   360
         TabIndex        =   10
         Top             =   2100
         Width           =   1455
      End
   End
   Begin VB.Frame fmsolo 
      Caption         =   "Solo Events"
      Height          =   2655
      Left            =   360
      TabIndex        =   5
      Top             =   1920
      Width           =   6855
      Begin VB.CheckBox chksem 
         Caption         =   "Seminar"
         Height          =   255
         Left            =   360
         TabIndex        =   29
         Top             =   1440
         Width           =   1335
      End
      Begin VB.ListBox lstsem 
         Enabled         =   0   'False
         Height          =   735
         ItemData        =   "frmeventreg.frx":004E
         Left            =   2280
         List            =   "frmeventreg.frx":0050
         Style           =   1  'Checkbox
         TabIndex        =   28
         Top             =   1440
         Width           =   3735
      End
      Begin VB.ComboBox cbothis 
         Enabled         =   0   'False
         Height          =   315
         Left            =   4200
         Style           =   2  'Dropdown List
         TabIndex        =   26
         Top             =   360
         Width           =   1815
      End
      Begin MSDataListLib.DataCombo cbothisd 
         Bindings        =   "frmeventreg.frx":0052
         DataField       =   "e_day"
         DataMember      =   "day"
         DataSource      =   "dataenv"
         Height          =   315
         Left            =   2280
         TabIndex        =   20
         Top             =   360
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
         Enabled         =   0   'False
         Style           =   2
         ListField       =   "e_day"
         Text            =   ""
         Object.DataMember      =   "day"
      End
      Begin VB.CheckBox chkjust 
         Caption         =   "&Just a Minute"
         Height          =   255
         Left            =   360
         TabIndex        =   9
         Top             =   1080
         Width           =   1335
      End
      Begin VB.CheckBox chkgame 
         Caption         =   "&Gamestation"
         Height          =   255
         Left            =   360
         TabIndex        =   8
         Top             =   720
         Width           =   1335
      End
      Begin VB.CheckBox chkthis 
         Caption         =   "A&nalyze This"
         Height          =   255
         Left            =   360
         TabIndex        =   7
         Top             =   360
         Width           =   1335
      End
   End
   Begin MSDataListLib.DataCombo cmbTeam 
      Bindings        =   "frmeventreg.frx":006C
      Height          =   315
      Left            =   5640
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   556
      _Version        =   393216
      Style           =   2
      ListField       =   "t_id"
      Text            =   ""
      Object.DataMember      =   "team"
   End
   Begin MSDataListLib.DataCombo cmbStudent 
      Bindings        =   "frmeventreg.frx":0083
      Height          =   315
      Left            =   2400
      TabIndex        =   2
      Top             =   720
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   556
      _Version        =   393216
      Style           =   2
      ListField       =   "s_id"
      BoundColumn     =   "s_id"
      Text            =   ""
      Object.DataMember      =   "stud"
   End
   Begin VB.OptionButton optteam 
      Caption         =   "&Team Event"
      Height          =   255
      Left            =   720
      TabIndex        =   1
      Top             =   1200
      Width           =   1215
   End
   Begin VB.OptionButton optstud 
      Caption         =   "&Solo Event"
      Height          =   255
      Left            =   720
      TabIndex        =   0
      Top             =   840
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Height          =   975
      Left            =   360
      TabIndex        =   4
      Top             =   600
      Width           =   1935
   End
   Begin VB.Label Label3 
      Caption         =   "Slot"
      Height          =   255
      Left            =   4560
      TabIndex        =   31
      Top             =   1680
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Day"
      Height          =   255
      Left            =   2760
      TabIndex        =   30
      Top             =   1680
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Select Student ID or Team ID"
      Height          =   255
      Left            =   480
      TabIndex        =   27
      Top             =   240
      Width           =   2175
   End
End
Attribute VB_Name = "frmeventreg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim result As Boolean
Private Sub cboBrain_Click()
Call checkaddbut
End Sub
Private Sub cbobraind_Click(Area As Integer)

If cbobraind.Text = "" Then
    cmdadd.Enabled = False
    Exit Sub
End If

    dataenv.rsbrain_slot.Filter = "E_DAY=" + cbobraind.Text
    cboBrain.clear
    While Not dataenv.rsbrain_slot.EOF
        cboBrain.AddItem dataenv.rsbrain_slot!E_Slot
        dataenv.rsbrain_slot.MoveNext
    Wend
Call checkaddbut

End Sub

Private Sub cbogame_Click()
Call checkaddbut
End Sub

Private Sub cbogamed_Click(Area As Integer)

'If cbogamed.Text = "" Then
'    cmdadd.Enabled = False
'    Exit Sub
'End If

'dataenv.rsgame_slot.Filter = "E_DAY=" + cbogamed.Text
'cbogame.clear
'    While Not dataenv.rsgame_slot.EOF
'        cbogame.AddItem dataenv.rsgame_slot!E_Slot
'        dataenv.rsgame_slot.MoveNext
'    Wend

Call checkaddbut

End Sub
Private Sub cboloc_Click()
Call checkaddbut
End Sub

Private Sub cbolocd_Click(Area As Integer)
If cbolocd.Text = "" Then
    cmdadd.Enabled = False
    Exit Sub
End If

dataenv.rsloc_slot.Filter = "E_DAY=" + cbolocd.Text
cboloc.clear

While Not dataenv.rsloc_slot.EOF
      cboloc.AddItem dataenv.rsloc_slot!E_Slot
      dataenv.rsloc_slot.MoveNext
Wend

Call checkaddbut

End Sub

'Private Sub cbotechnod_Click(Area As Integer)
'If cbotechnod.Text = "" Then
'    cmdadd.Enabled = False
'    Exit Sub
'End If''

'    dataenv.rstechno_slot.Filter = "E_DAY=" + cbotechnod.Text
'    cbotechno.clear
'    While Not dataenv.rstechno_slot.EOF
'        cbotechno.AddItem dataenv.rstechno_slot!E_Slot
'        dataenv.rstechno_slot.MoveNext
'    Wend'

'Call checkaddbut

'End Sub

Private Sub cbothis_Click()
Call checkaddbut

End Sub

Private Sub cbothisd_Click(Area As Integer)

If cbothisd.Text = "" Then
    cmdadd.Enabled = False
    Exit Sub
End If

    dataenv.rsthis_slot.Filter = "E_DAY=" + cbothisd.Text
    cbothis.clear
    While Not dataenv.rsthis_slot.EOF
        cbothis.AddItem dataenv.rsthis_slot!E_Slot
        dataenv.rsthis_slot.MoveNext
    Wend

Call checkaddbut
End Sub

Private Sub cboweb_Click()
Call checkaddbut
End Sub

Private Sub cbowebd_Click(Area As Integer)

If cbowebd.Text = "" Then
    cmdadd.Enabled = False
    Exit Sub
End If

    dataenv.rsweb_slot.Filter = "E_DAY=" + cbowebd.Text
    cboweb.clear
    While Not dataenv.rsweb_slot.EOF
        cboweb.AddItem dataenv.rsweb_slot!E_Slot
        dataenv.rsweb_slot.MoveNext
    Wend
Call checkaddbut

End Sub
Private Sub chkinno_Click()
Call checkaddbut
End Sub

Private Sub chkjust_Click()
Call checkaddbut
End Sub

Private Sub chksem_Click()
If chksem.Value = vbChecked Then
    lstsem.Enabled = True
Else
    lstsem.Enabled = False
End If

Call checkaddbut
End Sub

Private Sub Chkthis_Click()
If chkthis.Value = vbUnchecked Then
    cbothis.Enabled = False
    cbothisd.Enabled = False
Else
    cbothis.Enabled = True
    cbothisd.Enabled = True
End If
Call checkaddbut
End Sub

Private Sub chkgame_Click()
'If chkgame.Value = vbUnchecked Then
'    cbogame.Enabled = False
'    cbogamed.Enabled = False
'Else
'    cbogame.Enabled = True
'    cbogamed.Enabled = True
'End If
Call checkaddbut
End Sub

Private Sub Chktechno_Click()
Call checkaddbut
End Sub

Private Sub Chkloc_Click()
If chkloc.Value = vbUnchecked Then
    cboloc.Enabled = False
    cbolocd.Enabled = False
Else
    cboloc.Enabled = True
    cbolocd.Enabled = True
End If
Call checkaddbut
End Sub

Private Sub Chkweb_Click()
If chkweb.Value = vbUnchecked Then
    cboweb.Enabled = False
     cbowebd.Enabled = False
Else
    cboweb.Enabled = True
    cbowebd.Enabled = True
End If
Call checkaddbut
End Sub
Private Sub Chkbrain_Click()
If chkbrain.Value = vbUnchecked Then
    cboBrain.Enabled = False
     cbobraind.Enabled = False
Else
    cboBrain.Enabled = True
     cbobraind.Enabled = True
End If
Call checkaddbut
End Sub
Private Sub Command1_Click()
Me.Hide
frmmain.Show
End Sub
Private Sub cmbStudent_Click(Area As Integer)
If cmbStudent.Text = "" Then
    cmdnew.Enabled = False
Else
    cmdnew.Enabled = True
End If
End Sub

Private Sub cmbTeam_Click(Area As Integer)
If cmbTeam.Text = "" Then
    cmdnew.Enabled = False
Else
    cmdnew.Enabled = True
End If
End Sub

Private Sub cmdadd_Click()
Dim rs As New Recordset
Dim eventid As Integer
Dim str1 As String
Dim currval As Integer
Dim fullstr As String
Dim fullflag As Boolean
Dim reg As String
Dim i As Integer


fullflag = False
If optstud.Value = True Then
    'check for gamestation
    'If chkgame.Value = vbChecked Then
    '    str1 = "select e_curr,e_max from event where e_name='" + game + "' and e_day=" + cbogamed.Text + "and e_slot=" + cbogame.Text
    '    rs.Open str1, dataenv.cn
    '    If rs.Fields(0) = rs.Fields(1) Then
    '        fullflag = True
    '        fullstr = fullstr & " [Gamestation]"
    '
    '    End If
    '    rs.Close
    'End If
    
    'check for analyse this
    If chkthis.Value = vbChecked Then
        str1 = "select e_curr,e_max from event where e_name='" + this + "' and e_day=" + cbothisd.Text + "and e_slot=" + cbothis.Text
        rs.Open str1, dataenv.cn
        If rs.Fields(0) = rs.Fields(1) Then
            fullflag = True
            fullstr = fullstr & " [Analyse this]"
        
        End If
        rs.Close
    End If
       
        
Else
    'check for techno spreadsheets
    'If chktechno.Value = vbChecked Then
    '    str1 = "select e_curr,e_max from event where e_name='" + techno + "'"
    '    rs.Open str1, dataenv.cn
    '   If rs.Fields(0) = rs.Fields(1) Then
    '        fullflag = True
    '        fullstr = fullstr & " [Techno SpreadSheets]"
    '    End If
    '    rs.Close
    'End If
    
    'check for line of code
    If chkloc.Value = vbChecked Then
        str1 = "select e_curr,e_max from event where e_name='" + loc + "' and e_day=" + cbolocd.Text + "and e_slot=" + cboloc.Text
        rs.Open str1, dataenv.cn
        If rs.Fields(0) = rs.Fields(1) Then
            fullflag = True
            fullstr = fullstr & " [LoC]"
        End If
        rs.Close
    End If
    
    'check for web weaver
    If chkweb.Value = vbChecked Then
        str1 = "select e_curr,e_max from event where e_name='" + web + "' and e_day=" + cbowebd.Text + "and e_slot=" + cboweb.Text
        rs.Open str1, dataenv.cn
        If rs.Fields(0) = rs.Fields(1) Then
            fullflag = True
            fullstr = fullstr & " [Web Weaver]"
        End If
        rs.Close
    End If

    'check for brainscan
    If chkbrain.Value = vbChecked Then
        str1 = "select e_curr,e_max from event where e_name='" + brain + "' and e_day=" + cbobraind.Text + "and e_slot=" + cboBrain.Text
        rs.Open str1, dataenv.cn
        If rs.Fields(0) = rs.Fields(1) Then
            fullflag = True
            fullstr = fullstr & " [BrainScan]"
        End If
        rs.Close
    End If

End If


'''''''''''''''''''''
If fullflag = True Then
    MsgBox "Registration for" + fullstr + " has closed", vbOKOnly + vbExclamation, "Genesis"
    Exit Sub
End If
'''''''''''''''''''''''

If optstud.Value = True Then    ''INSERTION FOR SOLO EVENTS
    'insertion for gamestation
    If chkgame.Value = vbChecked Then
        'START OF ATOMIC TRANSACTION
        dataenv.cn.BeginTrans
        
        str1 = "insert into eventreg(s_id,t_id,e_id) values(" + cmbStudent.Text + ",null," + Str(gameid) + ")"
    
        dataenv.cn.Execute str1
        dataenv.cn.CommitTrans
        
        dataenv.cn.BeginTrans
        str1 = "select reg_no from eventreg where s_id=" + cmbStudent.Text + "and e_id=" + Str(gameid)
        rs.Open str1, dataenv.cn
        reg = rs!reg_no
        str1 = "insert into tmp values(" + cmbStudent.Text + "," + reg + ",'" + game + "',null,null)"
        dataenv.cn.Execute str1
        rs.Close
        dataenv.cn.CommitTrans
    End If
    
    'insertion for analyse this
    If chkthis.Value = vbChecked Then
        dataenv.cn.BeginTrans
        rs.Open "select e_id from event where e_name='" + this + "'and e_day=" + cbothisd.Text + "and e_slot=" + cbothis.Text, dataenv.cn
        eventid = rs.Fields(0).Value
        str1 = "insert into eventreg(s_id,t_id,e_id) values(" + cmbStudent.Text + ",Null," + Str(eventid) + ")"
        dataenv.cn.Execute str1
        rs.Close
        
        str1 = "select e_curr from event where e_name='" + this + " 'and e_day=" + cbothisd.Text + "and e_slot=" + cbothis.Text
        rs.Open str1, dataenv.cn
        currval = rs.Fields(0)
        currval = currval + 1
        rs.Close
        
        str1 = "update event set e_curr=" + Str(currval) + "where e_name='" + this + " 'and e_day=" + cbothisd.Text + "and e_slot=" + cbothis.Text
        dataenv.cn.Execute str1
        dataenv.cn.CommitTrans
    
        dataenv.cn.BeginTrans
        rs.Open "select reg_no from eventreg where s_id =" + cmbStudent.Text + " and e_id = " + Str(eventid), dataenv.cn
        reg = rs!reg_no
        str1 = "insert into tmp values(" + cmbStudent.Text + "," + reg + ",'" + this + "'," + cbothisd.Text + "," + cbothis.Text + ")"
        dataenv.cn.Execute str1
        rs.Close
        dataenv.cn.CommitTrans
    End If
    
    'inertion for just a minute
    If chkjust.Value = vbChecked Then
        dataenv.cn.BeginTrans
        
        str1 = "insert into eventreg(s_id,t_id,e_id) values(" + cmbStudent.Text + ",null," + Str(jameventid) + ")"
    
        dataenv.cn.Execute str1
        dataenv.cn.CommitTrans
        
        dataenv.cn.BeginTrans
        str1 = "select reg_no from eventreg where s_id=" + cmbStudent.Text + "and e_id=" + Str(jameventid)
        rs.Open str1, dataenv.cn
        reg = rs!reg_no
        str1 = "insert into tmp values(" + cmbStudent.Text + "," + reg + ",'" + jam + "',null,null)"
        dataenv.cn.Execute str1
        rs.Close
        dataenv.cn.CommitTrans
    End If

    If chksem.Value = vbChecked Then
        i = 0
        While i < lstsem.ListCount
        If lstsem.Selected(i) = True Then
            dataenv.cn.BeginTrans
            rs.Open "select e_id from event where e_name='" + seminar(i) + "'", dataenv.cn
            eventid = rs.Fields(0).Value
            str1 = "insert into eventreg(s_id,t_id,e_id) values(" + cmbStudent.Text + ",Null," + Str(eventid) + ")"
            dataenv.cn.Execute str1
            rs.Close
        
            str1 = "select e_curr from event where e_name='" + seminar(i) + "'"
            rs.Open str1, dataenv.cn
            currval = rs.Fields(0)
            currval = currval + 1
            rs.Close
        
            str1 = "update event set e_curr=" + Str(currval) + "where e_name='" + seminar(i) + "'"
            dataenv.cn.Execute str1
            dataenv.cn.CommitTrans
    
            dataenv.cn.BeginTrans
            rs.Open "select reg_no from eventreg where s_id =" + cmbStudent.Text + " and e_id = " + Str(eventid), dataenv.cn
            reg = rs!reg_no
            str1 = "insert into tmp values(" + cmbStudent.Text + "," + reg + ",'" + seminar(i) + "',null,null)"
            dataenv.cn.Execute str1
            rs.Close
            dataenv.cn.CommitTrans
        End If
        i = i + 1
    Wend
    End If

        
    
'OPERATIONS TO BE PERFORMED AFTER SOLO INSERTIONS
'===============================================
'DISPLAY REPORT
'PRINT REPORT
'FLUSH TMP TABLE
    
On Error GoTo printerr

    dataenv.rsrpt_student.Requery
    dataenv.cn.BeginTrans
    If Module1.prevreport = True Then
           drstud.Show
    End If
        
    If eventprint = True Then
        If Module1.showprntdlg = False Then
            drstud.PrintReport False
        Else
            drstud.PrintReport True
        End If
    End If
        
    str1 = "delete from tmp"
    dataenv.cn.Execute str1
    dataenv.cn.CommitTrans

Else    ''''''''''''''INSERTION FOR TEAM EVENTS''''''''''''''''''''''''
        's_id in tmp_stud acting as t_id
        
    'insertion for techno spreadsheets
    If chktechno.Value = vbChecked Then
        dataenv.cn.BeginTrans
        
        str1 = "insert into eventreg(s_id,t_id,e_id) values(null," + teamid + "," + Str(technoid) + ")"
        dataenv.cn.Execute str1
        dataenv.cn.CommitTrans
        
        dataenv.cn.BeginTrans
        str1 = "select reg_no from eventreg where t_id=" + teamid + "and e_id=" + Str(technoid)
        rs.Open str1, dataenv.cn
        reg = rs!reg_no
        str1 = "insert into tmp values(" + teamid + "," + reg + ",'" + techno + "',null,null)"
        dataenv.cn.Execute str1
        rs.Close
        dataenv.cn.CommitTrans
    End If
  

    'inesrtion for line of code
    If chkloc.Value = vbChecked Then
        dataenv.cn.BeginTrans
        rs.Open "select e_id from event where e_name='" + loc + "' and e_day=" + cbolocd.Text + "and e_slot=" + cboloc.Text, dataenv.cn
        eventid = rs.Fields(0).Value
        str1 = "insert into eventreg(s_id,t_id,e_id) values(null," + teamid + "," + Str(eventid) + ")"
        dataenv.cn.Execute str1
        rs.Close
        
        str1 = "select e_curr from event where e_name='" + loc + " 'and e_day=" + cbolocd.Text + "and e_slot=" + cboloc.Text
        rs.Open str1, dataenv.cn
        currval = rs.Fields(0)
        currval = currval + 1
        rs.Close
        
        str1 = "update event set e_curr=" + Str(currval) + "where e_name='" + loc + " 'and e_day=" + cbolocd.Text + "and e_slot=" + cboloc.Text
        dataenv.cn.Execute str1
        dataenv.cn.CommitTrans
        
        dataenv.cn.BeginTrans
        rs.Open "select reg_no from eventreg where t_id =" + teamid + " and e_id = " + Str(eventid), dataenv.cn
        reg = rs!reg_no
        str1 = "insert into tmp values(" + teamid + "," + reg + ",'" + loc + "'," + cbolocd.Text + "," + cboloc.Text + ")"
        dataenv.cn.Execute str1
        rs.Close
        dataenv.cn.CommitTrans

    End If
    
    'insertion for web weaver
    If chkweb.Value = vbChecked Then
        dataenv.cn.BeginTrans
        rs.Open "select e_id from event where e_name='" + web + " 'and e_day=" + cbowebd.Text + "and e_slot=" + cboweb.Text, dataenv.cn
        eventid = rs.Fields(0).Value
        str1 = "insert into eventreg(s_id,t_id,e_id) values(null," + teamid + "," + Str(eventid) + ")"
        dataenv.cn.Execute str1
        rs.Close
        
        str1 = "select e_curr from event where e_name='" + web + " 'and e_day=" + cbowebd.Text + "and e_slot=" + cboweb.Text
        rs.Open str1, dataenv.cn
        currval = rs.Fields(0)
        currval = currval + 1
        rs.Close
        
        str1 = "update event set e_curr=" + Str(currval) + "where e_name='" + web + " 'and e_day=" + cbowebd.Text + "and e_slot=" + cboweb.Text
        dataenv.cn.Execute str1
        dataenv.cn.CommitTrans
        
        dataenv.cn.BeginTrans
        rs.Open "select reg_no from eventreg where t_id =" + teamid + " and e_id = " + Str(eventid), dataenv.cn
        reg = rs!reg_no
        str1 = "insert into tmp values(" + teamid + "," + reg + ",'" + web + "'," + cbowebd.Text + "," + cboweb.Text + ")"
        dataenv.cn.Execute str1
        rs.Close
        dataenv.cn.CommitTrans
    End If

    'inertion for brainscan
    If chkbrain.Value = vbChecked Then
        dataenv.cn.BeginTrans
        rs.Open "select e_id from event where e_name='" + brain + "' and e_day=" + cbobraind.Text + "and e_slot=" + cboBrain.Text, dataenv.cn
        eventid = rs.Fields(0).Value
        str1 = "insert into eventreg(s_id,t_id,e_id) values(null," + teamid + "," + Str(eventid) + ")"
        dataenv.cn.Execute str1
        rs.Close
        
        str1 = "select e_curr from event where e_name='" + brain + " 'and e_day=" + cbobraind.Text + "and e_slot=" + cboBrain.Text
        rs.Open str1, dataenv.cn
        currval = rs.Fields(0)
        currval = currval + 1
        rs.Close
        
        str1 = "update event set e_curr=" + Str(currval) + "where e_name='" + brain + " 'and e_day=" + cbobraind.Text + "and e_slot=" + cboBrain.Text
        dataenv.cn.Execute str1
        dataenv.cn.CommitTrans
        
        dataenv.cn.BeginTrans
        rs.Open "select reg_no from eventreg where t_id =" + teamid + " and e_id = " + Str(eventid), dataenv.cn
        reg = rs!reg_no
        str1 = "insert into tmp values(" + teamid + "," + reg + ",'" + brain + "'," + cbobraind.Text + "," + cboBrain.Text + ")"
        dataenv.cn.Execute str1
        rs.Close
        dataenv.cn.CommitTrans
    End If
    
    'insertion for innovations
    If chkinno.Value = vbChecked Then
        dataenv.cn.BeginTrans
        str1 = "insert into eventreg(s_id,t_id,e_id) values(null," + teamid + "," + Str(innoeventid) + ")"
        dataenv.cn.Execute str1
        dataenv.cn.CommitTrans
        
        dataenv.cn.BeginTrans
        str1 = "select reg_no from eventreg where t_id=" + teamid + "and e_id=" + Str(innoeventid)
        rs.Open str1, dataenv.cn
        reg = rs!reg_no
        str1 = "insert into tmp values(" + teamid + "," + reg + ",'" + innov + "',null,null)"
        dataenv.cn.Execute str1
        rs.Close
        dataenv.cn.CommitTrans
        
    End If

'OPERATIONS TO BE PERFORMED AFTER TEAM INSERTIONS
'===============================================
'DISPLAY REPORT
'PRINT REPORT
'FLUSH TMP TABLE
On Error GoTo printerr

    dataenv.rstmp_stud.Requery  'must
    dataenv.cn.BeginTrans
                
    If Module1.prevreport = True Then
        drteam.Show
    End If
        
    If eventprint = True Then
        If Module1.showprntdlg = False Then
            drteam.PrintReport False
        Else
            drteam.PrintReport True
        End If
    End If
        
    str1 = "delete from tmp"
    dataenv.cn.Execute str1
    dataenv.cn.CommitTrans
End If


Call dis
If optstud.Value = True Then
    cmbStudent.Enabled = True
Else
    cmbTeam.Enabled = True
End If

Call chkdisable(True)
Call chkdisable(False)
Call enbdiscombos(False)
Exit Sub

printerr:
MsgBox "Printing error:" + Err.Description
Resume Next

End Sub


Private Sub cmdcancel_Click()

Call dis

'@added code''''''''
If optstud.Value = True Then
    cmbStudent.Enabled = True
Else
    cmbTeam.Enabled = True
End If
''''''''''''''''''''''''''''
Call clear
Call chkdisable(True)
Call chkdisable(False)
Call checkcombos

On Error GoTo cerr
dataenv.rsevreg.CancelUpdate
'dataenv.rsteam.CancelUpdate
Exit Sub

cerr:
MsgBox "Error:" + Err.Description
End Sub

Private Sub cmdclose_Click()
Unload Me
frmmain.Show
End Sub

Private Sub cmdNew_Click()
Dim rs As New Recordset
Dim i As Integer
Dim str1 As String
Dim val As Integer

If optstud.Value = True Then
    chkenable (True)
Else
    chkenable (False)
End If

Call enb
Call clear  'commented due to problems
Call checkcombos

'check if the student already registered, if yes disable controls
If optstud.Value = True Then
    If cmbStudent.Text = "" Then Exit Sub
    
    str1 = "select e_id from eventreg where s_id=" + cmbStudent.Text
    rs.Open str1, dataenv.cn
    If rs.RecordCount = 0 Then Exit Sub
    
    i = 0
    While i < rs.RecordCount
        val = rs.Fields(0).Value
        
        If val >= thislid And val < thislid + range Then chkthis.Enabled = False
        'student can register multiple times for gamestation
        'If val >= gamelid And val < gamelid + range Then chkgame.Enabled = False
        If val = jameventid Then chkjust.Enabled = False
        
        rs.MoveNext
        i = i + 1
    Wend
End If

'check if the team already registered, if yes disable controls
'''if team is selected,show the team form
If optteam.Value = True Then
    teamid = 0
    frmteam.Show 1
    If teamid = 0 Then
        cmdcancel_Click
        Exit Sub
    End If
        
    str1 = "select e_id from eventreg where t_id=" + Str(teamid)
    rs.Open str1, dataenv.cn
    If rs.RecordCount = 0 Then Exit Sub
    
    i = 0
    While i < rs.RecordCount
        val = rs.Fields(0).Value
        
        If val >= loclid And val < loclid + range Then chkloc.Enabled = False
        If val >= brainlid And val < brainlid + range Then chkbrain.Enabled = False
        If val >= weblid And val < weblid + range Then chkweb.Enabled = False
        'If val = innoeventid Then chkinno.Enabled = False
        'If val = technoid Then chktechno.Enabled = False
    
        rs.MoveNext
        i = i + 1
    Wend
End If
End Sub


Private Sub Form_Unload(Cancel As Integer)
Me.Hide
frmmain.Show
End Sub

Private Sub lstsem_Click()
Call checkaddbut
End Sub

Private Sub optstud_Click()
cmbStudent.Enabled = True
cmbTeam.Enabled = False
fmsolo.Visible = True
fmteam.Visible = False
If cmbStudent.Text = "" Then
    cmdnew.Enabled = False
Else
    cmdnew.Enabled = True
End If
End Sub

Private Sub optteam_Click()
cmbStudent.Enabled = False
fmsolo.Visible = False
fmteam.Visible = True
cmdnew.Enabled = True
End Sub

Private Sub Form_Load()
Dim rs As New Recordset

optstud.Value = True
fmteam.Visible = False

rs.Open "select * from event where e_status='Seminar'", dataenv.cn
While Not rs.EOF
    lstsem.AddItem rs.Fields(1).Value
    rs.MoveNext
Wend

Call dis
Call chkdisable(True)
Call chkdisable(False)

optstud_Click
cmbStudent_Click (0)

cmdadd.Enabled = False
End Sub

Private Sub dis()
cmdadd.Visible = False
cmdcancel.Visible = False
cmdnew.Visible = True
cmdclose.Visible = True

'''''''''''''''''''''''
optstud.Enabled = True
optteam.Enabled = True
cmbStudent.Enabled = False
cmbTeam.Enabled = False

''''''''''''''''''''''''
End Sub

Private Sub enb()
cmdadd.Visible = True
cmdcancel.Visible = True
cmdnew.Visible = False
cmdclose.Visible = False

''''''
optstud.Enabled = False
optteam.Enabled = False
cmbStudent.Enabled = False
cmbTeam.Enabled = False
'''''''''''''
End Sub
' pass true to enable solo events controls,false to disable team controls
Private Sub chkenable(i As Boolean)
If i = True Then
    Me.chkjust.Enabled = True
    Me.chkgame.Enabled = True
    Me.chkthis.Enabled = True
    Me.chksem.Enabled = True
Else
    Me.chkbrain.Enabled = True
    'Me.chkinno.Enabled = True
    Me.chkloc.Enabled = True
    'Me.chktechno.Enabled = True
    Me.chkweb.Enabled = True
End If

End Sub

Private Sub chkdisable(i As Boolean)

If i = True Then
    Me.chksem.Enabled = False
    Me.chkjust.Enabled = False
    Me.chkgame.Enabled = False
    Me.chkthis.Enabled = False
Else
    Me.chkbrain.Enabled = False
    'Me.chkinno.Enabled = False
    Me.chkloc.Enabled = False
    'Me.chktechno.Enabled = False
    Me.chkweb.Enabled = False
End If

End Sub

Private Sub checkaddbut()
result = checkcombos
If result = True Then
    cmdadd.Enabled = True
Else
    cmdadd.Enabled = False
    Exit Sub
End If

End Sub
Private Function checkcombos()
Dim flag, lstflag As Boolean
Dim i As Integer

lstflag = False

If Me.optstud.Value = True Then
    'If Me.chkgame.Value = vbChecked Then
     '   If cbogame.Text <> "" And cbogamed.Text <> "" Then
     '       flag = True
     '   Else
     '       checkcombos = False
     '       Exit Function
     '   End If
    'End If
    
    If Me.chkthis.Value = vbChecked Then
        If cbothis.Text <> "" And cbothisd.Text <> "" Then
            flag = True
        Else
            checkcombos = False
            Exit Function
        End If
    End If
    
Else
    If Me.chkbrain.Value = vbChecked Then
        If cboBrain.Text <> "" And cbobraind.Text <> "" Then
            flag = True
        Else
            checkcombos = False
            Exit Function
        End If
    End If
    
   ' If chkinno.Value = vbChecked Then
   '     If cboBrain.Text <> "" And cbobraind.Text <> "" Then
   '         flag = True
    '    Else
     '       checkcombos = False
      '      Exit Function
      '  End If
    'End If
    
    If chkloc.Value = vbChecked Then
        If cboloc.Text <> "" And cbolocd.Text <> "" Then
            flag = True
        Else
            checkcombos = False
            Exit Function
        End If
    End If
    
  '  If chktechno.Value = vbChecked Then
 '       If cbotechno.Text <> "" And cbotechnod.Text <> "" Then
'            flag = True
  '      Else
  '          checkcombos = False
 '           Exit Function
 '       End If
 '   End If
    
    If chkweb.Value = vbChecked Then
        If cboweb.Text <> "" And cbowebd.Text <> "" Then
            flag = True
        Else
            checkcombos = False
            Exit Function
        End If
    End If
End If


i = 0
If chksem.Value = vbChecked Then
   While i < lstsem.ListCount
        If lstsem.Selected(i) = True Then
            checkcombos = True
            Exit Function
        Else
            lstflag = False
        End If
   i = i + 1
    Wend
    If lstflag = False Then
        checkcombos = False
        Exit Function
    End If
End If

If chkjust.Value = vbChecked Or chkgame.Value = vbChecked Then
        checkcombos = True
'Else
 '   checkcombos = False
End If
If flag = True Then
    checkcombos = True
End If
End Function

Private Sub clear()
chkjust.Value = vbUnchecked
chkgame.Value = vbUnchecked
chkthis.Value = vbUnchecked
chksem.Value = vbUnchecked

chkbrain.Value = vbUnchecked
'chkinno.Value = vbUnchecked
chkloc.Value = vbUnchecked
'chktechno.Value = vbUnchecked
chkweb.Value = vbUnchecked
End Sub
Private Sub enbdiscombos(val As Boolean)
cbothis.Enabled = val
cbothisd.Enabled = val

'cbogame.Enabled = val
'cbogamed.Enabled = val

cboloc.Enabled = val
cbolocd.Enabled = val

cboweb.Enabled = val
cbowebd.Enabled = val

cboBrain.Enabled = val
cbobraind.Enabled = val

lstsem.Enabled = val
End Sub

