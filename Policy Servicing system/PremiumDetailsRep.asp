<%
if session("agentid")="" then
	Response.Write "Session expired"
	Response.End
end if


%>

<html>
<head>
<link href=pssmain.css rel=stylesheet>
</head>
<body>
<h1>Premium and Commission details of all policies</h1>
<%

'Response.Write session("valid").Value
dim x
x=session("valid")

if x = "no"  then
Response.Write("<font size=10>")
Response.Write("Invalid User!!!")
response.end()
session.Abandon()

end if
session("valid")="yes"



dim con
set con=Server.createobject("adodb.connection")
con.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
con.open

function pssASPinsertSpaces(Byval numberofspaces) 
dim counter 
for counter=0 to numberofspaces 
response.write "&nbsp;" 
next 
end function

dim rs
set rs=server.createobject("adodb.recordset")
rs.activeconnection=con
rs.cursorlocation=2
rs.open "exec sp_reppremiumdetails "&session("agentid"),con,2,3


Response.Write "Premium details of all policies issued under the AgentID = "&rs(0)&"<br><br>"

%>
<table width=100%>
<tr>
<th>PolicyID</td>
<th>Premium (in %)</th>
</tr>
<tr>
<%
while rs.eof <> TRUE
%>
<td><%=rs(1) %></td>
<td><%=rs(2) %></td>	
</tr>
<%

	rs.MoveNext
wend

%>