<%@ Language=VBScript %>
<%

'Response.Write session("valid").Value
dim x
x=session("valid")

if x = "no" or x="" then
Response.Write("<font size=10>")
Response.Write("Invalid User!!!")
response.end()
session.Abandon()

end if



%>


<HTML>
<HEAD><link href=pssmain.css rel=stylesheet>
<style>
<TD>
{
    TEXT-ALIGN: left
}
</style>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>
<h1>Adding New Customer</h1>
<form method=post action="MyRequestDetails.asp">
<table width=100%>
<tr>
<td align=left>Customer First Name</td>
<td><input type="text" id=text1 name=custfirstname></td>
</tr>
<tr>
<td>Customer Last Name</td>
<td><input type="text" id=text2 name=custlastname></td>
</tr>
<tr>
<td>Vehicle No</td>
<td><input type="text" id=text3 name=vehicleno></td>
</tr>
<tr>
<td>Address</td>
<td><input type="text" id=text4 name=address></td>
</tr>
<tr>
<td>Email</td>
<td><input type="text" id=text4 name=email></td>
</tr>


<tr align=left>
<td>Premium</td>
<td><input type="text" name=premium></td>
</tr>

<tr align=left>
<td>Insured Amount</td>
<td><input type="text" name=insuredamount></td>
</tr>


<tr>
<td>
<input type="submit" name="mysubmit" value="Add Customer Request">
</td>
</tr>
</table>





<P>&nbsp;</P>
</form>
</BODY>
</HTML>



<%




%>



