<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>      
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Guarda Editora</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<%@include file="menu.jsp" %> 
	<div class="container" style="background-color: Gainsboro">
		<h1>Guardar Editora</h1>
		<%
			String id=request.getParameter("txt_id");
			String fnacionalidade=request.getParameter("txt_nacionalidade");
			Connection cn=ligacaomysql.criarligacao();
			Statement st=cn.createStatement();
			try{
			st.executeUpdate("update nacionalidades set nacionalidade='"+fnacionalidade+"' "+
			" where id_nacionalidade="+id);
			 out.println("<h1>Nacionalidade atualizada.</h1>");
	
			}
			catch(SQLException e){
				out.println("<h1>ERRO.</h1>");
			}
			cn.close();
		%>
		<a href="listagem_nacionalidades.jsp">
			<input type="button" class="btn btn-danger" value="Listagem">
		</a>
	</div>
</body>
</html>