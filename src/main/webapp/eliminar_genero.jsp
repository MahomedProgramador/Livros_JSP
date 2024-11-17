<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Eliminar Genero</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<h1>Eliminar género</h1>
	<div id="aviso"></div>
	<%
		String fgenero = request.getParameter("eliminar");
		Connection cn = ligacaomysql.criarligacao();
		Statement st = cn.createStatement();
		try{
			st.executeUpdate("DELETE FROM generos WHERE id_genero = '" + fgenero+"'");
			
			%>
			<script>
				document.getElementById("aviso").style.visibility = "visible";
				document.getElementById("aviso").innerHTML.visibility = "<h1> Género eliminado</h1>";
			</script>
			<%
			response.setIntHeader("Refresh", 3);
		} 
		
		catch(SQLException e )
		{
			%>
				<script>
					document.getElementById("aviso").style.visibility = "visible";
					document.getElementById("aviso").innerHTML.visibility = "<h1> Erro ao eliminar o género</h1>";
				</script>
			<%
		}
	%>

</body>
</html>