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
<h2>Search Policy </h2>

	
<form method=get action=pssASPMyInformationPage1.asp>
<select name=part>
<option>Policy</option>
<option>Vehicle Number</option>
<option>Customer Name</option>
<option>Customer ID</option>
</select>

<input type=text name=searchquery></input>
<input type=submit value="Go"></input>
</form>

<%



	if Request.QueryString().Count >= 2 then
		
		


			Dim psscn,pssrs,cmd
			Set psscn=Server.CreateObject("ADODB.Connection")
			set cmd=server.CreateObject("adodb.command")

			
			psscn.connectionstring="server=10.111.125.31;provider=sqloledb.1;initial catalog=AutomatedPolicySystem;uid=sa;password=;"
			psscn.Open()
			set pssrs=server.createobject("adodb.recordset")
			pssrs.activeconnection=psscn
			pssrs.cursortype=2
			pssrs.cursorlocation=3
						cmd.ActiveConnection =psscn
			if Request.QueryString ("searchquery")="" then
				Response.End
			end if
	
			if Request.QueryString ("part")="Policy" then 
			if(not isNumeric(Request.QueryString("searchquery")))then
						Response.End
			end if
				
					pssrs.open "exec sp_searchpolicy " & Request.querystring("searchquery") & ","& session("agentid"),psscn,2,3
					
					if pssrs.RecordCount >0 then
						cmd.CommandText = "insert into spolicylog values(" & pssrs(0) & ",'" & pssrs(2) & "'," & pssrs(3) & "," & pssrs(4) & ",'" & now() & "')"
						cmd.Execute 
						
						'rs.Close
					end if
						
					
					
					
				elseif Request.QueryString ("part")="Vehicle Number" then
					'if Request.QueryString("match")="Exact" then
					
						pssrs.open "exec sp_searchvehicle '"& Request.querystring("searchquery") & "',"& session("agentid"),psscn,2,3
						
						if pssrs.RecordCount >0 then
							cmd.CommandText = "insert into spolicylog values(" & pssrs(0) & ",'" & pssrs(2) & "'," & pssrs(3) & "," & pssrs(4) & ",'" & now() & "')"
							cmd.Execute 
						
						'rs.Close
					end if
					'else
						'pssrs.open "select policy.* from policy,customerpolicy,customer where policy.policyid=customerpolicy.policyid and  customer.custid=customerpolicy.custid and customer.vehicleno like request
					'end if
				elseif Request.QueryString("part")="Customer ID" then
				if(not isNumeric(Request.QueryString("searchquery")))then
						Response.End
					end if
			
					pssrs.open "exec sp_searchcustid " & Request.querystring("searchquery") & ","& session("agentid"),psscn,2,3
					if pssrs.RecordCount >0 then
						cmd.CommandText = "insert into spolicylog values(" & pssrs(0) & ",'" & pssrs(2) & "'," & pssrs(3) & "," & pssrs(4) & ",'" & now() & "')"
						cmd.Execute 
						
						'rs.Close
					end if
				else
					pssrs.open "exec sp_searchcustname " & Request.querystring("searchquery") & ","& session("agentid"),psscn,2,3
					if pssrs.RecordCount >0 then
			
						cmd.CommandText = "insert into spolicylog values(" & pssrs(0) & ",'" & pssrs(2) & "'," & pssrs(3) & "," & pssrs(4) & ",'" & now() & "')"
						cmd.Execute 
						
						'rs.Close
					end if
		
			  end if
			
%>		
		<br>	
		<table width=100% height=10  border=0>
		<tr>
			<th>Policy ID</th>
			<th>Premium</th>
			<th>Expiry Date</th>
			<th>Insured Amount</th>
			<th>AgentID</th>
			
		</tr>
		<% while pssrs.EOF =false %>
			<tr>
				<td><%=pssrs(0)%></td>
				<td><%=pssrs(1)%></td>	
				<td><%=pssrs(2)%></td>	
				<td><%=pssrs(3)%></td>	
				<td><%=pssrs(4)%></td>		
				
			</tr>
	
			<%

			pssrs.MoveNext()
		wend
		pssrs.Close
		psscn.Close
		

	

	
	
 end if%>

	
</body>
</html>