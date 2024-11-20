<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Verificar utilizador</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<div class="container" style="background-color: Gainsboro; margin-top: 20px;" >
		<%
			String user = request.getParameter("txt_utilizador");
			String pass = request.getParameter("txt_password");
			
			Connection cn = ligacaomysql.criarligacao();
			Statement st = cn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM utilizadores " +
                    "WHERE utilizador = '" + user + "' AND password = '" + pass + "'");
			if(rs.next()){
				response.sendRedirect("index.jsp");
			}
			else{
				out.println("<h1>Utilizador ou password inexistente</h1>");
				%>
					<a href="login.jsp">
						<input type="button" class="btn btn-primary"
						value="Login">
					</a>
				<%
			}
		%>
	</div>

</body>
</html>