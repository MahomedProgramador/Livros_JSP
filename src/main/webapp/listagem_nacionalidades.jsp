<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem Nacionalidades</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<div class="container" style="background-color: Gainsboro">
	
	<h1>Listagem de nacionalidades</h1>
	
		<table id="listagem">
		
			<tr>
				<th>Id. Nacionalidade</th>
				<th>Nacionalidade</th>
				<th></th>
				<th></th>
				</tr>
			
			<%
			
				Connection cn=ligacaomysql.criarligacao();
			    Statement st=cn.createStatement();
			    ResultSet rs=st.executeQuery("select * from nacionalidades order by id_nacionalidade");
			    
			    while(rs.next()){
			    	out.println("<tr><td>"+rs.getString(1)+"</td>");
			    	out.println("<td>"+rs.getString(2)+"</td>");
			    	out.println("<td><a href='alterar_nacionalidade.jsp?alterar="+rs.getString(1)+"'><input type='button' class='btn btn-primary' value='Update'></a></td>");
			    	out.println("<td><a href='eliminar_nacionalidade.jsp?eliminar="+rs.getString(1)+"'><input type='button' class='btn btn-danger' value='Delete'></a></td></tr>");
			    }
			
			    cn.close();
			%>
		
		</table>
	
	</div>
	
</body>
</html>


