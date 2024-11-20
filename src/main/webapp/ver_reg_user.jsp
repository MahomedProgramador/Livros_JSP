<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Verificar registo utilizador</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<div class="container" style="background-color: Gainsboro; margin-top: 20px;" >
		<%
			String user = request.getParameter("txt_reg_utilizador");
			String pass = request.getParameter("txt_reg_password");
			String pass_rep = request.getParameter("txt_conf_password");
			if (!pass.equals(pass_rep) || pass.length() > 15){
				out.println("<p>As passwords não coincidem ou não é valida.</p>");	
				%>
					<a href="register.jsp">
						<input type="button" class="btn btn-primary"
						value="Register">
					</a>
				<%
			}
			else{
				
				try{
					
					Connection cn = ligacaomysql.criarligacao();
					Statement st = cn.createStatement();
					ResultSet rs = st.executeQuery("SELECT * FROM utilizadores " +
		                    "WHERE utilizador = '" + user +"'");	
					if(rs.next()){
						out.println("<h1>Utilizador já existente, por favor escolha outro</h1>");
					%>
						<a href="register.jsp">
							<input type="button" class="btn btn-primary"
							value="Register">
						</a>
					<%
					}
					else{
						st.executeUpdate("INSERT INTO utilizadores (utilizador, password) VALUES ('"+user+"', '"+pass+"')");
						
						out.println("<h1>Utilizador registado com sucesso.</h1>");
							
						%>
							<a href="index.jsp">
								<input type="button" class="btn btn-primary"
								value="Register">
							</a>
						<%
					
					}
				}
				catch(Exception e){
					out.println("<p>" + e.getMessage() + "</p>");
				}
			}			
					

		%>
	</div>

</body>
</html>