<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarBD.*" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Autores</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<%@include file="menu.jsp" %> 
	<div class="container" style="background-color: Gainsboro">
		<h1>Novo Autor</h1>
		<form method="POST" action="autores.jsp">
			<div class="form-group">
				<label>Nome</label>
				<input class="form-control" type="text" 
				name="txt_nome" required 
				placeholder="Digite a nome do autor">
			</div>
			<div class="form-group">
				<label>Nacionalidade</label>
				<select name="txt_nacionalidade" 
				class="form-control" required>
				
				<%
				Connection cn2=ligacaomysql.criarligacao();
				Statement st2=cn2.createStatement();
				ResultSet rs=
				st2.executeQuery("select * from nacionalidades");
				while(rs.next()){
					out.println("<option value="+rs.getString(1)+">"+
				    rs.getString(2)+"</option>");
				}
				%>
				</select>
			</div>
			<div class="form-group">
				<label>Foto</label>
				<input class="form-control" name="txt_foto"
				value="noname.png" required>
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
			String fnome=request.getParameter("txt_nome");
			String fnac=request.getParameter("txt_nacionalidade");
			String ffoto=request.getParameter("txt_foto");
			
			if(fnome==null){
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
					st.executeUpdate("insert into autores (nome,foto,id_nacionalidade) "+
				    " values ('"+fnome+"','"+ffoto+"','"+fnac+"')");
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
					//out.println(e.getMessage());
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