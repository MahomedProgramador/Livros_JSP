<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>      
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Guarda Autor</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<%@include file="menu.jsp" %> 
	<div class="container" style="background-color: Gainsboro">
		<h1>Guardar Autor</h1>
		<%
			String fid=request.getParameter("txt_id");
			String fnome=request.getParameter("txt_nome");
			String fnacionalidade=request.getParameter("txt_nacionalidade");
			String ffoto=request.getParameter("txt_foto");
			Connection cn=ligacaomysql.criarligacao();
			Statement st=cn.createStatement();
			try{
				st.executeUpdate("update autores set nome='"+fnome+"',id_nacionalidade='"+fnacionalidade+"', "+
						" foto='"+ffoto+"' where id_autor='"+fid+"'");
			 	out.println("<h1>Género atualizado.</h1>");
	
			}
			catch(SQLException e){
				out.println("<h1>ERRO.</h1>");
			}
			cn.close();
		%>
		<a href="listagem_autores.jsp">
			<input type="button" class="btn btn-danger" value="Listagem">
		</a>
	</div>
</body>
</html>