<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Alterar Nacionalidade</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<%@include file="menu.jsp" %> 
	<div class="container" style="background-color:Gainsboro">
		<h1>Alterar Nacionalidade</h1>
		<form method="POST" action="grava_nacionalidade.jsp">
			<%
				String fnacionalidade=request.getParameter("alterar");
				String descnacionalidade="";
				Connection cn=ligacaomysql.criarligacao();
				Statement st=cn.createStatement();
				ResultSet rs=st.executeQuery("select * from nacionalidades "+
				"where id_nacionalidade="+fnacionalidade);
				while(rs.next()){
					descnacionalidade=rs.getString(2);
				}
				cn.close();
			%>
			<div class="form-group">
				<label>ID. Género</label>
				<input type="text" class="form-control" name="txt_id" 
				value=<%out.println(fnacionalidade);%> readonly>
			</div>
			<div class="form-group">
				<label>Nacionalidade</label>
					<% 
				out.println("<input class='form-control' type='text' name='txt_nacionalidade'"+ 
				" value='"+descnacionalidade+"'>");
				%>
			</div>	
			<input type="submit" class="btn btn-primary" value="Alterar">
			<br>
		<br>
		</form>
	</div>
</body>
</html>