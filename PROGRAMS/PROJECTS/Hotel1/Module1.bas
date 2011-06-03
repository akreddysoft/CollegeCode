Attribute VB_Name = "Module1"
'Public cn As New ADODB.Connection
Public rs As New ADODB.Recordset
Public Const cn1 As String = "Provider=MSDAORA.1;Password=bvcoe;User ID=anirudh;Persist Security Info=True"
Dim str As String

Public Sub Main()


cn.Open "Provider=MSDAORA.1;Password=bvcoe;User ID=anirudh;Persist Security Info=True"
MDIForm1.Show

End Sub
'cn.ConnectionString = "Provider=MSDAORA.1;Password=bvcoe;User ID=anirudh;Persist Security Info=True"
