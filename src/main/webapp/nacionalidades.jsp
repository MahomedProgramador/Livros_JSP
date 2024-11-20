<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarBD.*" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Nacionalidades</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<%@include file="menu.jsp" %> 
	<div class="container" style="background-color: Gainsboro">
		<h1>Nova Nacionalidade</h1>
		<form method="POST" action="nacionalidades.jsp">
			<div class="form-group">
				<label>Nacionalidade</label>
				<input class="form-control" type="text" 
				name="txt_nacionalidade" required 
				placeholder="Digite a nova nacionalidade">
			</div>
			<input class="btn btn-primary" type="submit"
			value="Guardar">
			<input class="btn btn-danger" type="reset"
			value="Cancelar">
			<br>			
		</form>
		<br>
		<div id="aviso"></div>
		<br>
		<%
			String fnacionalidade=request.getParameter("txt_nacionalidade");
			if(fnacionalidade==null){
				%>
					<script>
						document.getElementById('aviso').
						style.visibility='hidden';
					</script>
				<%
			}
			else{
				Connection cn=ligacaomysql.criarligacao();
				Statement st=cn.createStatement();
				try{
					st.executeUpdate("insert into nacionalidades (nacionalidade) "+
				    " values ('"+fnacionalidade+"')");
					%>
						<script>
							document.getElementById('aviso').
							style.visibility='visible';
							document.
							getElementById('aviso').
							innerHTML=
							"<h1>Registo Inserido.</h1>";
						</script>
					<%
					response.setIntHeader("Refresh",3);
				}
				catch(SQLException e){
					%>
					<script>
						document.getElementById('aviso').
						style.visibility='visible';
						document.
						getElementById('aviso').
						innerHTML=
						"<h1>Erro de Registo.</h1>";
					</script>
				<%
				response.setIntHeader("Refresh",3);
				}
			}
		%>
	</div>
</body>
</html>