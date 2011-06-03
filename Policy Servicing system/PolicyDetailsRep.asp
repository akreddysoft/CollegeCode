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
<h1>Highlighting of near expiry 
policies</h1>
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

dim rs,rs1,rs2
set rs=server.createobject("adodb.recordset")
set rs1=server.createobject("adodb.recordset")
set rs2=server.createobject("adodb.recordset")

rs.activeconnection=con
rs.cursorlocation=2

rs1.activeconnection=con
rs1.cursorlocation=2

rs2.activeconnection=con
rs2.cursorlocation=2


rs.open "exec sp_redexpiry "& session("agentid"),con,2,3

dim sum




Response.Write "Policy details of all customers tied to AgentID = "&rs(4)&"<br><br>"
%>
<table width=100%>
<tr>

<th>PolicyID</th><th>Customer ID</th>
   <th>Premium (in %)</th> <th> ExpiryDate</th><th>Insured Amount (Rs/-)</th>
<%


while rs.eof <> TRUE
%>

<tr>
<td><font color=red><%=rs(0) %></td>
<td><font color=red><%=rs(5) %></td>				
<td><font color=red><%=rs(1) %></td>	
<td><font color=red><%=rs(2) %></td>
<td><font color=red><%=rs(3) %></td>
<% sum=sum+rs(3) %>
</font>
<%
	rs.MoveNext
wend
rs.close


rs.open "exec sp_noexpiry "&session("agentid"),con,2,3
while rs.eof <> TRUE
%>
<tr>
<td><%=rs(0) %></td>
<td><%=rs(5) %></td>	
<td><%=rs(1) %></td>
<td><%=rs(2)%></td>
<td><%=rs(3) %></td>
<% sum=sum+rs(3) %>
</tr>
			
<%	
	rs.MoveNext
wend

%>

<tr></tr>
<tr><Td colspan=5><hr></td></tr>
<td></td>
<td></td>		
<td></td>
<td>Total insured amount is</td>		
<td><b><%=sum%></b>
</tr>	