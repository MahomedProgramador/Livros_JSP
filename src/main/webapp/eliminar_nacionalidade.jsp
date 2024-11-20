<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar Nacionalidade</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<%@include file="menu.jsp" %> 
	<h1>Eliminar nacionalidade</h1>
	<div id="aviso"></div>
	<%
		String fnac = request.getParameter("eliminar");
		Connection cn = ligacaomysql.criarligacao();
		Statement st = cn.createStatement();
		try{
			st.executeUpdate("DELETE FROM nacionalidades WHERE id_nacionalidade = '" + fnac +"'");
	
			%>
			<script>
				document.getElementById("aviso").style.visibility = "visible";
				document.getElementById("aviso").innerHTML = "<h1> Nacionalidade eliminada</h1>";
			</script>
			<%
			response.setIntHeader("Refresh", 3);
		} 
		
		catch(SQLException e)
		{
			%>
			
				<script>
					document.getElementById("aviso").style.visibility = "visible";
					document.getElementById("aviso").innerHTML = "<h1> Erro ao eliminar a nacionalidade</h1>";
				</script>
			<%
			out.println("<p>Erro: " + e.getMessage() + "</p>");
		}
	%>

</body>
</html>