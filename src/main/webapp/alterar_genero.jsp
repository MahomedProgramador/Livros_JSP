<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Alterar Género</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<div class="container" style="background-color:Gainsboro">
		<h1>Alterar Género</h1>
		<form method="POST" action="grava_genero.jsp">
			<%
				String fgenero=request.getParameter("alterar");
				String descgenero="";
				Connection cn=ligacaomysql.criarligacao();
				Statement st=cn.createStatement();
				ResultSet rs=st.executeQuery("select * from generos "+
				"where id_genero="+fgenero);
				while(rs.next()){
					descgenero=rs.getString(2);
				}
				cn.close();
			%>
			<div class="form-group">
				<label>ID. Género</label>
				<input type="text" class="form-control" name="txt_id" 
				value=<%out.println(fgenero);%> readonly>
			</div>
			<div class="form-group">
				<label>Género</label>
					<% 
				out.println("<input class='form-control' type='text' name='txt_genero'"+ 
				" value='"+descgenero+"'>");
				%>
			</div>	
			<input type="submit" class="btn btn-primary" value="Alterar">	
		<br>
		<br>
		</form>
	</div>
</body>
</html>