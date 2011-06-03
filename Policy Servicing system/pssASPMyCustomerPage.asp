<%
if session("agentid")="" then
	Response.Write "Session expired"
	Response.End
end if


%>
<%
Response.CacheControl=false
%>

<html>
<head>
<link href=pssmain.css rel=stylesheet>
</head>
<body>
<h1>My Customer View</h1>
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

function pssASPFetchCustomerData(CustID) 


Dim psscn,pssrs
Set psscn=Server.CreateObject("ADODB.Connection")
psscn.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
psscn.Open()
set pssrs=server.createobject("adodb.recordset")
pssrs.activeconnection=psscn
pssrs.cursortype=2
pssrs.cursorlocation=2


pssrs.open "exec sp_searchid " & CustID & "," & session("agentid"),psscn,2,3
pssASPFetchCustomerData=pssrs(1)


end function
function pssASPinsertSpaces(Byval numberofspaces) 
dim counter
for counter=0 to numberofspaces
response.write "&nbsp;"
next 
end function


</script>

<%

Dim psscn,pssrs,count,pssrs1,cmd,pssrs2
Set psscn=Server.CreateObject("ADODB.Connection")

psscn.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
psscn.Open()
set pssrs=server.createobject("adodb.recordset")
pssrs.activeconnection=psscn
pssrs.cursortype=2
pssrs.cursorlocation=3
set cmd=server.createobject("adodb.command")
cmd.activeconnection=psscn
cmd.commandtext="create view x as select  custid, max(timestamp) as t from scustomerlog where custid IN (select custid from scustomerlog where agentid="&session("agentid")&") group by custid"
cmd.execute()

pssrs.open("select * from x order by t desc"),psscn,2,3

cmd.commandtext="drop view x"
cmd.execute()


count=pssrs.recordcount
c1=0

Dim CustID(5) 


while c1<count and c1<5
CustID(c1)=pssrs(0)
pssrs.movenext()
c1=c1+1
wend



%>
<table width=100%>
<tr>
<th>CustomerID</th>
<th>Customer Name</th>
</tr>
<%

'Get the List of Customers from the Log file
'Assuming ID's are in CustID array
dim counter
counter=0

while counter < count

%>


<tr>
<td><%=CustID(counter)%></td>
<td>
<a href=MyCustomerView.asp?name=<%=CustID(counter)%>  target=pssASPMyInformation>


<%=pssASPFetchCustomerData(CustID(counter))%></a>
</td>

</tr>
<%
counter=counter+1

wend

%>
</body>
</html>

