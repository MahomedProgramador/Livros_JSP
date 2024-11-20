<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>      
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Guarda Livro</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<%@include file="menu.jsp" %> 
	<div class="container" style="background-color: Gainsboro">
		<h1>Guardar Livro</h1>
		<%
			String fid=request.getParameter("txt_id");
			String ftitulo=request.getParameter("titulo");
			String ftema=request.getParameter("tema");
			String feditora=request.getParameter("editora");
			String fescritor=request.getParameter("escritor");
			String fano=request.getParameter("ano");
			String fpreco=request.getParameter("preco");
			Connection cn=ligacaomysql.criarligacao();
			Statement st=cn.createStatement();
			try{
			st.executeUpdate("update livros set titulo='"+ftitulo+"' "+
			",id_genero='"+ftema+"',id_editora='"+feditora+"'"+
			",id_autor='"+fescritor+"',ano_publicacao='"+fano+"'"+
			",preco='"+fpreco+"'"+
			" where id_livro="+fid);
			 out.println("<h1>Livro atualizado.</h1>");
	
			}
			catch(SQLException e){
				out.println("<h1>ERRO</h1>");
			}
			cn.close();
		%>
		<a href="listagem_livros.jsp">
			<input type="button" class="btn btn-danger" value="Listagem">
		</a>
	</div>
</body>
</html>