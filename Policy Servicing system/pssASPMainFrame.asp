
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
<script language="VBScript" runat="server">
function pssAspinsertSpaces(Byval numberofspaces) 
dim counter
for counter=0 to numberofspaces
response.write "&nbsp;"
next 
end function

function pssAspFxnLogOff()
session.abandon()
response.end()
end function
</script>

<html>
<head>
<link href=pssmain.css rel=stylesheet>
</head>

<font size="4">
<b><a href=psswelcome.asp target="pssASPMyInformation">Home</a></b><br>
<br>
<font size="3">

<A HREF="pssASPMyCustomerPage.asp" target="pssASPMyInformation">My Customer View</A>
<br>
<A HREF="pssASPMyPolicyPage.asp" target="pssASPMyInformation">My Policy View</A>
<br>

<A HREF="pssASPMyNewCustomer.asp" target="pssASPMyInformation">Add New Customer</A>
<br><br>


<strong>Report Generation</strong><br>
<br>
<LI><A HREF="PolicyDetailsRep.asp" target="pssASPMyInformation">Customer's Policy details</A>
<br>
<LI><A HREF="PremiumDetailsRep.asp" target="pssASPMyInformation">Policies Premium details</A>
<br>
<LI><A HREF="CustDetailReport.asp" target="pssASPMyInformation">Customers Details</A>
<br>
<LI><A HREF="CustModificationReport.asp" target="pssASPMyInformation">Modification History</A>
<br>
</UL>

<br>

<strong><A HREF="pssASPMyInformationPage.asp" target="pssASPMyInformation">Search Customer</a></strong>

<UL>

<LI>By First Name
<br>
<LI>By Last Name
<br>
<LI>By Full Name
<br>
<LI>By CustomerID
</UL>



<br>
<strong><A HREF="pssASPMyInformationPage1.asp" target="pssASPMyInformation">Search Policy</a></strong>
<UL>
<LI>By Policy</A>
<br>
<LI>By Vehicle Number
<br>
<LI>By Customer name
<br>
<LI>By CustomerID
</UL>
<br>
<form method=get action="logoff.asp" target=_parent>
<input type="submit" name="pssLogOff" value="LogOff"></input>
</form>


</html>