<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link href=pssmain.css rel=stylesheet>
</HEAD>

<BODY>
<h1>Modification Report</h1>
<%

set con  = server.CreateObject ("adodb.connection")
con.ConnectionString= ("Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=AutomatedPolicySystem;Data Source=10.111.125.31")
con.Open 
'set com2  = server.CreateObject ("adodb.command")
'com2.ActiveConnection =con
'com.CommandText ="if exists(select * from icustomerlog where id=" & Request.QueryString ("custid") &")"



Response.Write ("<table border=0 width=100% >")

Response.Write "<tr>"


Response.Write "<th>"
Response.Write "CustomerID"

Response.Write "</th>"

Response.Write "<th>"
Response.Write "First Name"

Response.Write "</th>"

Response.Write "<th>"
Response.Write "Vehicle No"

Response.Write "</th>"

Response.Write "<th>"
Response.Write "Address"

Response.Write "</th>"

Response.Write "<th>"
Response.Write "Email"
Response.Write "</th>"



Response.Write "<th>"
Response.Write "Last Name"
Response.Write "</th>"


Response.Write "<th>"
Response.Write "Timestamp"
Response.Write "</th>"




Response.Write "</tr>"


set rs= server.CreateObject("adodb.recordset")
rs.ActiveConnection =con
rs.CursorLocation = 2
rs.CursorType= 2
rs.LockType =3


rs.Open "select *  from icustomerlog where agentid=" & session("agentid")&"order by custid,timestamp desc"








while rs.eof <> true

Response.Write "<tr>"


Response.Write "<td>"
Response.Write rs(1)

Response.Write "</td>"

Response.Write "<td>"
Response.Write rs(2)

Response.Write "</td>"

Response.Write "<td>"
Response.Write rs(3)

Response.Write "</td>"

Response.Write "<td>"
Response.Write rs(4)

Response.Write "</td>"

Response.Write "<td>"
Response.Write rs(5)
Response.Write "</td>"



Response.Write "<td>"
Response.Write rs(6)
Response.Write "</td>"


Response.Write "<td>"
Response.Write rs(7)
Response.Write "</td>"





Response.Write "</tr>"
rs.MoveNext



wend
Response.Write "</font>"
Response.Write "</table>"

con.Close
%>
</font>
<P>&nbsp;</P>

</BODY>
</HTML>
