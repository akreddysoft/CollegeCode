<%@ Language=VBScript %>




<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link href=pssmain.css rel=stylesheet>
</HEAD>
<BODY bgcolor=yellow>
<h1 align=center>Details of Customers</h1>
<%


set con  = server.CreateObject ("adodb.connection")
con.ConnectionString= ("Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=AutomatedPolicySystem;Data Source=10.111.125.31")
con.Open 
Response.Write"<font  size=4 color=red>"
Response.Write "<table width=100% >"
Response.Write "<tr>"
Response.Write "<th>"
Response.Write "Customer ID"
Response.Write "</th>"
'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "<th>"
Response.Write "First Name"
Response.Write "</th>"

'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "<th>"
Response.Write "Vehicle No"
Response.Write "</th>"

'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "<th>"
Response.Write "Address"
'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "</th>"

Response.Write "<th>"
Response.Write "Email"
'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "</th>"

Response.Write "<th>"
Response.Write "LastName"
Response.Write "</th>"

Response.Write "</tr>"


Response.Write"<hr size=5>"
Response.Write"</font>"
Response.Write"<font  size=4 >"
set rs= server.CreateObject("adodb.recordset")
rs.ActiveConnection =con
rs.CursorLocation = 2
rs.CursorType= 2
rs.LockType =3

rs.Open "select distinct customer.* from customer,policy,customerpolicy where policy.policyid=customerpolicy.policyid and  policy.agentid=agentid  and customer.custid=customerpolicy.custid and agentid='"& session("agentid")  &"'"

Response.Write ("<br>")





while rs.eof <> true

Response.Write "<tr>"
Response.Write "<td>"
Response.Write rs(0)
Response.Write "</td>"

'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "<td>"
Response.Write rs(1)
'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "</td>"

Response.Write "<td>"
Response.Write rs(2)
'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "</td>"

Response.Write "<td>"
Response.Write rs(3)
'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "</td>"

Response.Write "<td>"
Response.Write rs(4)
'Response.Write "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
Response.Write "</td>"

Response.Write "<td>"
Response.Write rs(5)
Response.Write "</td>"
Response.Write "</tr>"
rs.MoveNext

'Response.Write "<br>"

wend
Response.Write "</font>"
Response.Write "</table>"
'rs.close
'con.Close

%>
<P>&nbsp;</P>

</BODY>
</HTML>
