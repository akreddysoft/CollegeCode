<%@ Language=VBScript %>
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



%>


<HTML>
<HEAD>
<link href=pssmain.css rel=stylesheet>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>
<%
	Dim psscn,pssrs
		Set psscn=Server.CreateObject("ADODB.Connection")
		psscn.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
		psscn.Open()
		set pssrs=server.createobject("adodb.recordset")
		pssrs.activeconnection=psscn
		pssrs.cursortype=2
		pssrs.open "select * from agent where agentid="& session("agentid"),psscn,2
			
	%>
		
	<h1>Auto Insurance Company</h1>
	<br>	
	Hello, <b><%=pssrs(2)%> (<%=pssrs(0) %>)</b>
	<p>You have successfully logged on to Auto Insurance Company
	
	
	<%
	pssrs.Close
	pssrs.Open "select count(policyid) from policy where agentid = " & session("agentid")
	%>
	<br>You have currently <%=pssrs(0)%> active policies.
	
		
<%
pssrs.Close
psscn.Close

%>
</BODY>
</HTML>
