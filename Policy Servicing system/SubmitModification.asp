<%@ Language=VBScript %>
<HTML>
<HEAD>
<link href=pssmain.css rel=stylesheet>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<%
dim rs1
set con  = server.CreateObject ("adodb.connection")
con.ConnectionString= ("Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=AutomatedPolicySystem;Data Source=10.111.125.31")
con.Open 
set com  = server.CreateObject ("adodb.command")
set com1  = server.CreateObject ("adodb.command")

com.ActiveConnection =con
com1.ActiveConnection =con

set rs= server.CreateObject("adodb.recordset")
rs.ActiveConnection =con
rs.CursorLocation = 2
rs.CursorType= 2
rs.LockType =3
set rs1= server.CreateObject("adodb.recordset")
rs1.ActiveConnection =con
rs1.CursorLocation = 2
rs1.CursorType= 2
rs1.LockType =3
'Response.Write "exec hi "  & request.querystring("custid") & "," & request.querystring("custfirstname")& "," & request.querystring("vehicleno") & "," & request.querystring("address") & "," & request.querystring("email") & "," & request.querystring("custlastname") & "," & Now() & "," & session("agentid")


rs1.Open "select * from customer where custid=" & Request.QueryString("custid")
rs.open "exec firstmodified "  & request.querystring("custid") & ",'" & rs1(1) & "','" & rs1(2) & "','" & rs1(3) & "','" & rs1(4) & "','" & rs1(5) & "','" & Now() & "'," & session("agentid")





com.CommandText ="update customer set address='"&request.querystring("address") & "', email='" & request.querystring("email") & "' where custid=" & request.querystring("custid")
'com1.CommandText ="insert into  icustomerlog values( custid="&request.querystring("custid") & ", custfirstname='"&request.querystring("custfirstname") & "',vehicleno='"&request.querystring("vehicleno") & "',address='"&request.querystring("address") & "', email='" & request.querystring("email") & "',custlastname='"&request.querystring("custlastname") & "',timestamp=now,agentid="&session("agentid")"
com1.CommandText ="insert into  icustomerlog values( " & request.querystring("custid") & ",'" &  request.querystring("custfirstname") & "','" & request.querystring("vehicleno") & "','" & request.querystring("address") &"','"  &request.querystring("email")&"','"&request.querystring("custlastname") &"','" & now& "'," & session("agentid")&")" 


com.Execute 
com1.Execute 

con.Close

%>
<h1 align=center >record updated</h1>
<%
Response.Redirect("pssASPMyCustomerPage.asp")
%>
<P>&nbsp;</P>

</BODY>
</HTML>
