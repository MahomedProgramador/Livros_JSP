<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>      
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Guarda Género</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<%@include file="menu.jsp" %> 
	<div class="container" style="background-color: Gainsboro">
		<h1>Guardar Género</h1>
		<%
			String id=request.getParameter("txt_id");
			String fgenero=request.getParameter("txt_genero");
			Connection cn=ligacaomysql.criarligacao();
			Statement st=cn.createStatement();
			try{
			st.executeUpdate("update generos set genero='"+fgenero+"' "+
			" where id_genero="+id);
			 out.println("<h1>Género atualizado.</h1>");
	
			}
			catch(SQLException e){
				out.println("<h1>Género já existente.</h1>");
			}
			cn.close();
		%>
		<a href="listagem_generos.jsp">
			<input type="button" class="btn btn-danger" value="Listagem">
		</a>
	</div>
</body>
</html>