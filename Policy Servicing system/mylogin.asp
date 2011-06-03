<%
dim con
dim rs
Response.CacheControl=false
set con=server.createobject("adodb.connection")
set rs=server.createobject("adodb.recordset")
con.open"server=10.111.125.31;Provider=SQLOLEDB.1;Initial Catalog=AutomatedPolicySystem;user id=sa;password=;"
rs.activeconnection=con

dim str 
dim str1

str=request.form("login")
str1=request.form("password")
rs.Open "exec sp_validate " & str,con,2,3
if(rs.EOF=TRUE) then
Response.Write "invalid user"
end if
if rs(0)=str1 then
session("valid")="yes"
session("agentid")=str
else
session("valid")="no"
end if
Response.Redirect("http://localhost/pssASPMyLogin.asp")



%>