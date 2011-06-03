
<script language="VBScript">

function pssASPFetchCustomerData(CustID) 


pssASPFetchCustomerData=pssrs(1)

end function


</script>
<html>
<head><link href=pssmain.css rel=stylesheet>
</head>
<form action="Modify.asp" method=post target="pssASPMyInformation" id=form1 name=form1>


<h1>My Customer Details</h1>
<%
Response.CacheControl=false
%>

<%

dim x
x=session("valid")
if x = "no" or x="" then
Response.Write("<font size=10>")
Response.Write("Invalid User!!!")
response.end()
end if


function pssASPinsertSpaces(Byval numberofspaces) 
dim counter
for counter=0 to numberofspaces
response.write "&nbsp;"
next 
end function


Dim psscn,pssrs
Set psscn=Server.CreateObject("ADODB.Connection")
psscn.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
psscn.Open()
set pssrs=server.createobject("adodb.recordset")
pssrs.activeconnection=psscn
pssrs.cursortype=2
pssrs.cursorlocation=2




pssrs.open "exec sp_viewcustomer "& Request.querystring("name"),psscn,2,3

Dim mypsscn,mypssrs
Set mypsscn=Server.CreateObject("ADODB.Connection")
mypsscn.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
mypsscn.Open()
set mypssrs=server.createobject("adodb.recordset")
mypssrs.activeconnection=mypsscn
mypssrs.cursortype=2
mypssrs.cursorlocation=2

CustID=request.querystring("name")
response.write "<br><br>"

response.write "<input type=text size=10 readonly name=custid value=" & CustID &">" 

Response.Write "<br>"


Dim CustID
%>
<table width=100%>
<tr>
<th>First Name</th>

<th>Vehicle No</th>

<th>Address</th>

<th>Email</th>

<th>Last Name</th>
</tr>


<td><input type=text size=10 name=custfirstname readonly value= <%= pssrs(1)%>></td>

<td><input type=text size=10 name=vehicleno readonly value= <%= pssrs(2)%>></td>

<td><input type=text size=10 name=address readonly value=' <%= pssrs(3)%>'></td>

<td><input type=text size=10 name=email readonly value=' <%= pssrs(4)%>'></td>

<td><input type=text size=10 name=custlastname readonly value='<%= pssrs(5)%>'></td>
<tr>
<th>Policy ID</th>

<th>Premium</th>

<th>Expiry Date</th>

<th>Insured Amount</th>




<%
while pssrs.EOF <>true


mypssrs.open "select * from policy where policyid="& pssrs(6),mypsscn,2,3
%>


<tr>
<td><%=mypssrs(0)%></td>

<td><%=mypssrs(1)%></td>

<td><%=mypssrs(2)%></td>

<td><%=mypssrs(3)%></td>


</tr>



<%
mypssrs.Close



pssrs.MoveNext()
wend


%>
<td><input type="submit" value="Modify Data" id=submit1 name=submit1></td>
</form>
Modify Customer Data





</html>
