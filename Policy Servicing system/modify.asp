<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<link href=pssmain.css rel=stylesheet>
</HEAD>

<BODY bgcolor=cornflowerblue>
<script language="vbscript">
function spaces(Byval numberofspaces) 
dim counter
for counter=0 to numberofspaces
response.write "&nbsp;"
next 
end function
</script>

<%
Response.Write ("<form method=get action=SubmitModification.asp>") 
'Response.Write ("customer id &nbsp&nbsp&nbsp <font color=yellow>" &Request.Form("custID")&"</font>")
Response.Write "<table  width=100% border=0  >"
Response.Write "<tr align=left>"

Response.Write "<td align=left>"
Response.Write ("customer id  ")
Response.Write "</td>"

Response.Write "<td>"
response.Write ("<input type=text name= custid  readonly=true  value="&request.Form("custid")&"> </input>")
Response.Write "</td>"

Response.Write "</tr>"

'Response.Write("<br>")
'Response.Write("<br>")
'Response.Write("<br>")
'Response.Write ("customer first name &nbsp&nbsp&nbsp <font color=yellow>" &ucase(Request.Form("custfirstname"))&"</font>")
Response.Write "<tr>"

Response.Write "<td align=left>"
Response.Write ("customer first name  ")
Response.Write "</td>"

Response.Write "<td>"
Response.Write ("<input type=text name= custfirstname  readonly=true  value="&request.Form("custfirstname")&">")
Response.Write "</td>"

Response.Write "</tr>"
'Response.Write("<br><br><br>")
'Response.Write ("customer last name &nbsp&nbsp&nbsp <font color=yellow>" &ucase(Request.Form("custlastname"))&"</font>")
Response.Write "<tr>"

Response.Write "<td align=left>"
Response.Write ("customer last name ")
Response.Write "</td>"

Response.Write "<td>"
Response.Write ("<input type=text name= custlastname  readonly=true  value="&request.Form("custlastname")&">")
Response.Write "</td>"

Response.Write "</tr>"

'Response.Write("<br><br><br>")
'Response.Write ("vehicle no. &nbsp&nbsp&nbsp  <font color=yellow>" &Request.Form("vehicleno")&"</font>")
Response.Write "<tr>"

Response.Write "<td align=left>"
Response.Write ("vehicle no. ")
Response.Write "</td>"

Response.Write "<td>"
Response.Write ("<input type=text name=vehicleno  readonly=true  value="&request.Form("vehicleno")&">")
Response.Write "</td>"

Response.Write "</tr>"


'Response.Write("<br><br><br>")
Response.Write "<tr>"

Response.Write "<td  align=left >"
Response.write"address"
Response.Write "</td>"

Response.Write "<td>"
Response.Write ("<input type=text name= address value="&request.Form("address")&">")
Response.Write "</td>"

Response.Write "</tr>"


Response.Write "<tr>"

Response.Write "<td  >"
Response.write"email"
Response.Write "</td>"

Response.Write "<td>"
Response.Write ("<input type=text  name=email value="&request.Form("email")&" id=text1 name=text1>")
Response.Write "</td>"

Response.Write "</tr>"

Response.Write "</table>"
response.write "<br >"
response.write "<br >"
response.write "<br >"
Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"


Response.Write("<input type=submit value=Submit>")

Response.Write("</form>")

%>



</BODY  >
</HTML>
