<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Alterar Editora</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<div class="container" style="background-color:Gainsboro">
		<h1>Alterar Editora</h1>
		<form method="POST" action="grava_editora.jsp">
			<%
				String feditora=request.getParameter("alterar");
				String desceditora="";
				Connection cn=ligacaomysql.criarligacao();
				Statement st=cn.createStatement();
				ResultSet rs=st.executeQuery("select * from editoras "+
				"where id_editora="+feditora);
				while(rs.next()){
					desceditora=rs.getString(2);
				}
				cn.close();
			%>
			<div class="form-group">
				<label>ID. Editora</label>
				<input type="text" class="form-control" name="txt_id" 
				value=<%out.println(feditora);%> readonly>
			</div>
			<div class="form-group">
				<label>Editora</label>
				<% 
				out.println("<input class='form-control' type='text' name='txt_editora'"+ 
				" value='"+desceditora+"'>");
				%>
			</div>	
			<input type="submit" class="btn btn-primary" value="Alterar">
		<br>
		<br>
		</form>
	</div>
</body>
</html>