<%@ Language=VBScript %>
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
<h1>Search Page</h1>
<hr> 
<h2>Search Customer </h2>

	
<form method=get action=pssASPMyInformationPage.asp >
<select name=part>
<option>First Name</option>
<option>Last Name</option>
<option>Full Name</option>
<option>Customer ID</option>

<input type=text name=searchquery></input>
<input type=submit value="Go"></input>
</form>

<%



	if Request.QueryString().Count=> 2 then
		
		


			Dim psscn,pssrs,cmd
			Set psscn=Server.CreateObject("ADODB.Connection")
			set cmd=server.CreateObject ("adodb.command")
			psscn.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
			psscn.Open()
			set pssrs=server.createobject("adodb.recordset")
			pssrs.activeconnection=psscn
			pssrs.cursortype=1
			pssrs.cursorlocation=3
			
			cmd.ActiveConnection =psscn
			
			
			if  Request.QueryString("searchquery") = "" then
				Response.End 
			end if
	
			if Request.QueryString ("part")="First Name" and Request.QueryString("searchquery") <> "" then 
					pssrs.open "exec sp_searchname '" & Request.querystring("searchquery") & "'," & session("agentid"),psscn,2,3
					%><%
					if pssrs.RecordCount >0 then
					
					cmd.CommandText =	 "insert into scustomerlog values(" & pssrs(0) & ",'" & pssrs(1) & "','" & pssrs(2) & "','" & pssrs(3) & "','" & pssrs(4) & "','" & pssrs(5) & "'," & session("agentid") & ",'" & now() & "')"
					cmd.Execute 
					'	
						'rs.Close
					end if
					
				elseif Request.QueryString ("part")="Last Name" and Request.QueryString("searchquery") <> "" then
					pssrs.open "exec sp_searchlastname '"& Request.querystring("searchquery") & "'," & session("agentid"),psscn,2,3
					if pssrs.RecordCount >0 then
						
						cmd.CommandText = "insert into scustomerlog values(" & pssrs(0) & ",'" & pssrs(1) & "','" & pssrs(2) & "','" & pssrs(3) & "','" & pssrs(4) & "','" & pssrs(5) & "'," & session("agentid") & ",'" & now() & "')"
						cmd.Execute 
						
					'rs.Close
					end if

				elseif Request.QueryString("part")="Customer ID" and Request.QueryString("searchquery") <> "" then
				if(not isNumeric(Request.QueryString("searchquery")))then
						Response.End
				end if
					pssrs.open "exec sp_searchid "& Request.querystring("searchquery") & "," & session("agentid"),psscn,2,3
					if pssrs.RecordCount >0 then
						cmd.CommandText=  "insert into scustomerlog values(" & pssrs(0) & ",'" & pssrs(1) & "','" & pssrs(2) & "','" & pssrs(3) & "','" & pssrs(4) & "','" & pssrs(5) & "'," & session("agentid") & ",'" & now() & "')"
						cmd.Execute 
						
						'rs.Close
					end if

				elseif Request.QueryString("searchquery") <> "" then
				 'dim str
				 'str=Request.QueryString ("searchquery")
				 'dim i=IndexOf(str," ")
				 
				 
				
					pssrs.open "exec sp_" & Request.querystring("searchquery") & "," & session("agentid"),psscn,2,3
										'if pssrs.RecordCount >0 then
						dim rs3
						Set rs=Server.CreateObject("ADODB.recordset")
						rs3.activeconnection=psscn
						rs3.cursortype=2
						rs3.cursorlocation=2
					'	psscn.Execute "insert into scustomerlog values(" & pssrs(0) & ",'" & pssrs(1) & "','" & pssrs(2) & "','" & pssrs(3) & "','" & pssrs(4) & "','" & pssrs(5) & "'," & session("agentid") & ",'" & now() & "')"
						
						'rs.Close
					'end if

		
			  end if
			
%>		
		<br>	
		<table width=100% height=10  border=0>
		<tr bgcolor=yellow>
			<th>Customer ID</th>
			<th>First Name</th>
			<th>Vehicle No</th>
			<th>Address</th>
			<th>Email</th>
			<th>Last Name</th>
		</tr>
		<% while pssrs.EOF =false %>
			<tr>
				<td><%=pssrs(0)%></td>
				<td><%=pssrs(1)%></td>	
				<td><%=pssrs(2)%></td>	
				<td><%=pssrs(3)%></td>	
				<td><%=pssrs(4)%></td>		
				<td><%=pssrs(5)%></td>	
			</tr>
	
			<%

			pssrs.MoveNext()
		wend
		pssrs.Close
		psscn.Close
		

	

	
	
 end if%>

	
</body>
</html>