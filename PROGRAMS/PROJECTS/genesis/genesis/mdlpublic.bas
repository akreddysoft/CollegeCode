Attribute VB_Name = "mdlpublic"
Option Explicit
Public exist As Integer
Public currentgame As String
Public basetime As String
Public Const app As String = "Gamestation"
Public Const time1 As String = "1100"
Public Const time2 As String = "1300"
Public Const time3 As String = "1500"
Public Const game1 As String = "QUAKE 3 ARENA"
Public Const game2 As String = "SUPERBIKE 2001"
Public Const game3 As String = "UNREAL TOURNAMENT"
Public Const game4 As String = "NEED FOR SPEED 3"
Public Const game5 As String = "MOTO RACER 2"
Public Const game6 As String = "NEED FOR SPEED 5"
'Public Const game7 As String = "HALF LIFE COUNTER STRIKE"
'Public Const game8 As String = "THE SIMS"
Public Const game7 As String = "AGE OF EMPIRES 2"
Public Const connstring As String = "Provider=MSDAORA.1;Password=tiger;User ID=scott;Persist Security Info=True"
Public Const playersperround As Integer = 8
Public Const gamesperday As Integer = 3
Public Const playerspergame As Integer = 32

Public Function checkdataexist(adocontrol As Adodc)
If adocontrol.Recordset.RecordCount = 0 Then
    checkdataexist = 0
Else
    checkdataexist = 1
End If
End Function

Public Function getcurrentround(adocontrol As Adodc)
Dim rcount As Integer
Dim cround As Integer

rcount = adocontrol.Recordset.RecordCount
If rcount = 0 Then
    getcurrentround = 0
    Exit Function
End If

adocontrol.Recordset.MoveFirst
adocontrol.Recordset.Move (rcount - 1)
cround = adocontrol.Recordset.Fields(3)
getcurrentround = cround 'return current round
End Function

Public Sub filabels()
Dim rcount As Integer
Dim curround As Integer
Dim playersinq As Integer

frmain.lblplayed.Caption = frmain.adomain.Recordset.RecordCount

exist = checkdataexist(frmain.adomain)
If exist = 0 Then
    frmain.lblplayed.Caption = 0 'no need to check for duplicate sid
    frmain.lblround.Caption = 0
Else
    rcount = frmain.adomain.Recordset.RecordCount
    frmain.adomain.Recordset.MoveFirst
    frmain.adomain.Recordset.Move (rcount - 1)
    curround = frmain.adomain.Recordset.Fields(3).Value
    frmain.lblround.Caption = curround
End If

playersinq = frmain.adogen.Recordset.RecordCount - frmain.lblplayed.Caption
If playersinq < 0 Then
    frmain.lblq.Caption = 0
Else
    frmain.lblq.Caption = playersinq
End If
End Sub

Public Sub filgame()
Dim rcount As Integer
'we do not refresh local labels of frmdata in this proc
'this proc is called for the loading of main form
exist = checkdataexist(frmain.adogen)
If exist = 0 Then
    frmain.lblcgame.Caption = frmain.cbogame.List(0)
Else
    rcount = frmain.adogen.Recordset.RecordCount
    If rcount > 0 And rcount < 32 Then
        frmain.lblcgame.Caption = frmain.cbogame.List(0)
    ElseIf rcount >= 32 And rcount < 64 Then
        frmain.lblcgame.Caption = frmain.cbogame.List(1)
    ElseIf rcount >= 64 And rcount < 96 Then
        frmain.lblcgame.Caption = frmain.cbogame.List(2)
    ElseIf rcount >= 96 And rcount < 128 Then
        frmain.lblcgame.Caption = frmain.cbogame.List(3)
    ElseIf rcount >= 128 And rcount < 160 Then
        frmain.lblcgame.Caption = frmain.cbogame.List(4)
    ElseIf rcount >= 160 And rcount < 192 Then
        frmain.lblcgame.Caption = frmain.cbogame.List(5)
    End If
End If
End Sub

Public Sub filday()
Dim rcount As Integer

exist = checkdataexist(frmain.adogen)
If exist = 0 Then
    frmain.lblcday.Caption = frmain.cboday.List(0)
Else
    rcount = frmain.adogen.Recordset.RecordCount
    If rcount > 0 And rcount <= 96 Then
    frmain.lblcday.Caption = frmain.cboday.List(0)
    ElseIf rcount > 96 And rcount <= 128 Then
    frmain.lblcday.Caption = frmain.cboday.List(1)
    ElseIf rcount > 128 And rcount <= 150 Then
    frmain.lblcday.Caption = frmain.cboday.List(2)
    End If
End If
End Sub

Public Sub filtime()
Dim exist As Integer
Dim rcount As Integer

exist = checkdataexist(frmain.adogen)
If exist = 0 Then
    frmain.lblctime.Caption = frmain.cbotime.List(0)
Else
    rcount = frmain.adogen.Recordset.RecordCount
    If rcount > 0 And rcount < 32 Then
        frmain.lblctime = frmain.cbotime.List(0)
    ElseIf rcount >= 32 And rcount < 64 Then
        frmain.lblctime = frmain.cbotime.List(1)
    ElseIf rcount >= 64 And rcount < 96 Then
        frmain.lblctime = frmain.cbotime.List(2)
    End If
End If
basetime = frmain.lblctime
End Sub

Public Sub reflabels()
frmain.adomain.Refresh
frmain.adogames.Refresh
frmain.adogen.Refresh

Call filabels  'fill the labels of status
Call filday
Call filgame  'fill the status labels of game
Call filtime
End Sub

