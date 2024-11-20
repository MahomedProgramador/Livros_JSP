<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarBD.*" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem de Autores</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">	
</head>
<body>
	<%@include file="menu.jsp" %> 
	<div class="container" style="background-color: Gainsboro">
		<h1>Listagem de autores</h1>
		<table id="listagem">
			<tr>
				<th>Id. Autor</th>
				<th>Nome</th>
				<th>Nacionalidade</th>
				<th>Foto</th>
				<th></th>
				<th></th>
			</tr>
			<%
				String sql="select id_autor, nome, nacionalidade,"+
			    "foto from autores "+
				"inner join nacionalidades on "+
			    "autores.id_nacionalidade="+
				"nacionalidades.id_nacionalidade";
				Connection cn=ligacaomysql.criarligacao();
				Statement st=cn.createStatement();
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()){
					out.println("<tr><td>"+rs.getString(1)+"</td>");
					out.println("<td>"+rs.getString(2)+"</td>");
					out.println("<td>"+rs.getString(3)+"</td>");
					out.println("<td>"+
					"<img id='image' src=imagens/"+rs.getString(4)+"></td>");
			    	out.println("<td><a href='alterar_autor.jsp?alterar="+rs.getString(1)+"'><input type='button' class='btn btn-primary' value='Update'></a></td>");
			    	out.println("<td><a href='eliminar_autor.jsp?eliminar="+rs.getString(1)+"'><input type='button' class='btn btn-danger' value='Delete'></a></td></tr>");
				}
				cn.close();
			%>
		</table>
	</div>
</body>
</html>



