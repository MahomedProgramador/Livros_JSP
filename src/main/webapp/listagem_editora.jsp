<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem Editoras</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<%@include file="menu.jsp" %> 
	<div class="container" style="background-color: Gainsboro">
	
	<h1>Listagem de editoras</h1>
	
		<table id="listagem">
		
			<tr>
				<th>Id. Editora</th>
				<th>Editora</th>
				<th></th>
				<th></th>
			</tr>
			
			<%
			
				Connection cn=ligacaomysql.criarligacao();
			    Statement st=cn.createStatement();
			    ResultSet rs=st.executeQuery("select * from editoras order by id_editora");
			    
			    while(rs.next()){
			    	out.println("<tr><td>"+rs.getString(1)+"</td>");
			    	out.println("<td>"+rs.getString(2)+"</td>");
			    	out.println("<td><a href='alterar_editora.jsp?alterar="+rs.getString(1)+"'><input type='button' class='btn btn-primary' value='Update'></a></td>");
			    	out.println("<td><a href='eliminar_editora.jsp?eliminar="+rs.getString(1)+"'><input type='button' class='btn btn-danger' value='Delete'></a></td></tr>");			    	
			    }
			
			    cn.close();
			%>
		
		</table>
	
	</div>
	
</body>
</html>


