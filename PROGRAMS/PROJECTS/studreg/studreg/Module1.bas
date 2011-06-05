Attribute VB_Name = "Module1"
Public fMainForm As frmmain
Public Const game As String = "Game Station"
Public Const gamelid As Integer = 151
Public Const this As String = "Analyse This"
Public Const thislid As Integer = 101
Public Const techno As String = "Techno Spreadsheets"
Public Const brain As String = "BrainScan"
Public Const brainlid As Integer = 51
Public Const web As String = "Web Weaver"
Public Const weblid As Integer = 201
Public Const loc As String = "LoC"
Public Const loclid As Integer = 1
Public Const innov As String = "Innovations"
Public Const jam As String = "JAM"
Public Const panel As String = "Panel Discussion"

Public Const panelid As Integer = 252
Public Const jameventid As Integer = 351
Public Const innoeventid As Integer = 301
Public Const technoid As Integer = 401
Public Const maxteam As Integer = 5
Public Const range As Integer = 50
Public Const gameid As Integer = 151


Public seminar(25)
Public teamid As String
Public nullcount As Integer

''option variables
Public prevreport As Boolean
Public showprntdlg As Boolean
Public eventprint As Boolean
Public studprint As Boolean

Sub Main()
Dim i As Double

prevreport = True
showprntdlg = False
eventprint = False
studprint = False


seminar(0) = "Mysteries of Pointer"
seminar(1) = "DOT NET"
seminar(2) = "Panel Discussion"

    frmSplash.Show
    frmSplash.Refresh
    While i < 5000000
        i = i + 0.5
    Wend
    
    Unload frmSplash
    'frmSplash.Refresh
    Set fMainForm = New frmmain
    'Load fMainForm
    'Unload frmSplash
    With dataenv
        .rsBranch.Open
        .rsCollege.Open
        .rsevent.Open
        .rsevreg.Open
        .rsstud.Open
        .rsteam.Open
        .rsbrain_slot.Open
        .rsloc_slot.Open
        .rsweb_slot.Open
        .rsthis_slot.Open
        .rstechno_slot.Open
        .rsgame_slot.Open
        .rsrpt_student.Open
        .rstmp_stud.Open
    End With

    fMainForm.Show
End Sub

