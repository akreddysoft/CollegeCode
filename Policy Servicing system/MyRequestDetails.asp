<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>


<P>&nbsp;</P>



</BODY>
</HTML>

<%
dim myid
myid=session("agentid")


Dim psscn,pssrs
dim pssrs1
dim pssrs2
dim pssrs3
dim pssrs4
dim pssrs5


dim myrequestid,mypolicyid
Set psscn=Server.CreateObject("ADODB.Connection")
psscn.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
psscn.Open
set pssrs=server.createobject("adodb.recordset")
pssrs.activeconnection=psscn
pssrs.cursortype=2
pssrs.cursorlocation=2
set pssrs1=server.createobject("adodb.recordset")
pssrs1.activeconnection=psscn
pssrs1.cursortype=2
pssrs1.cursorlocation=2
set pssrs2=server.createobject("adodb.recordset")
pssrs2.activeconnection=psscn
pssrs2.cursortype=2
pssrs2.cursorlocation=2

set pssrs3=server.createobject("adodb.recordset")
pssrs3.activeconnection=psscn
pssrs3.cursortype=2
pssrs3.cursorlocation=2

set pssrs4=server.createobject("adodb.recordset")
pssrs4.activeconnection=psscn
pssrs4.cursortype=2
pssrs4.cursorlocation=2
set pssrs5=server.createobject("adodb.recordset")
pssrs5.activeconnection=psscn
pssrs5.cursortype=2
pssrs5.cursorlocation=2





pssrs.Open "exec myunderwriter " & myid ,psscn,2,3


pssrs1.Open "select max(requestid) as requestid from underwriter",psscn,2,3
myrequestid=pssrs1(0)

pssrs2.Open "select max(policyid) as policyid from policy",psscn,2,3
mypolicyid=pssrs2(0)


pssrs3.open "insert into requestdetails values ('" & Request.form("custfirstname") & "','" &Request.Form("vehicleno")&"','" & Request.Form("address") & "','" &Request.Form("email") &"','" &Request.Form("custlastname")&"'," & myrequestid &")",psscn,2,3


pssrs5.Open "select expirydate from policy where policyid=" & mypolicyid


pssrs4.Open "insert into requestpolicy values (" & myrequestid & "," & request.form("premium")&",'" & pssrs5(0) & "'," & request.form("insuredamount") & ")",psscn,2,3


Response.Write "<h1>Request Sent</h1>"




%>
