<%
if session("agentid")="no" then
	Response.Write "Session expired"
	Response.End
end if


%>

<html>
<head>
<link href=pssmain.css rel=stylesheet>
</head>
<body>
<h1>My Policy View</h1>

<%
dim x
x=session("valid")
if x = "no" or x="" then
Response.Write("<font size=10>")
Response.Write("Invalid User!!!")
response.end()
end if
%>

<script language="VBScript" runat="server">

function pssASPFetchCustomerData(AgentID,col) 




end function



</script>

<%
Dim AgentID(5) 
AgentID(0)=1
AgentID(1)=2
AgentID(2)=3
AgentID(3)=4
AgentID(4)=5

%>
<table width=100%>
<tr>
<th>PolicyID</th>


<th>Premium (in %)</th>

<th>Expiry Date</th>

<th>Insured Amount(Rs/-)</th>
</tr>
<%



Dim psscn,pssrs,pssrs1,cmd
Set psscn=Server.CreateObject("ADODB.Connection")
psscn.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
psscn.Open()
set pssrs=server.createobject("adodb.recordset")
pssrs.activeconnection=psscn
pssrs.cursortype=2
pssrs.cursorlocation=3
set pssrs1=server.createobject("adodb.recordset")
pssrs1.activeconnection=psscn
pssrs1.cursortype=2
pssrs1.cursorlocation=3

set cmd=server.createobject("adodb.command")
cmd.activeconnection=psscn
cmd.commandtext="create view xx as select  policyid, max(timestamp) as t from spolicylog where policyid IN (select policyid from spolicylog where agentid="&session("agentid")&") group by policyid"
cmd.execute()


pssrs.open("select * from xx order by t desc"),psscn,2,3

cmd.commandtext="drop view xx"
cmd.execute()


dim counter
counter=0

while pssrs.EOF<>true and counter <5
pssrs1.Open "select * from policy where policyid=" & pssrs(0)
%>

<tr>
<td><%=pssrs(0)%></td>


<td><%=pssrs1(1)%></td>


<td><%=pssrs1(2)%></td>


<td><%=pssrs1(3)%></td>

</tr>

<%
pssrs1.Close
counter=counter+1
pssrs.MoveNext()




wend









%>

</body>
</html>