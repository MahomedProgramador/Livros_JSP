<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="ligarBD.*" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Novo Livro</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<div class="container" style="background-color: Gainsboro">
		<h1>Novo Livro</h1>
		<form method="POST" action="livros.jsp">
		
			<div class="form-group">	
				<label>Titulo</label>
				<input class="form-control" type="text" name="titulo" 
				placeholder="Insira o titulo do livro" required>
			</div>
			
			
			<div class="form-group">
				<label>Género</label>
				<select name="tema" class="form-control" required>
				
					<%
					
						Connection cnn=ligacaomysql.criarligacao();
						Statement stt=cnn.createStatement();
						ResultSet rs=stt.executeQuery("select * from generos");
						while(rs.next()){
							out.println("<option value="+rs.getString(1)+">"+rs.getString(2)+"</option>");
						}
					
						cnn.close();
					%>
				
				</select>
			</div>
			
			<div class="form-group">
				<label>Editora</label>
				<select name="editora" class="form-control" required>
				
					<%
					
						Connection cnn1=ligacaomysql.criarligacao();
						Statement stt1=cnn1.createStatement();
						ResultSet rs1=stt1.executeQuery("select * from editoras");
						while(rs1.next()){
							out.println("<option value="+rs1.getString(1)+">"+rs1.getString(2)+"</option>");
						}
					
						cnn1.close();
					%>
				
				</select>
			</div>			
			
			
			<div class="form-group">
				<label>Autor</label>
				<select name="escritor" class="form-control" required>
				
					<%
					
						Connection cnn2=ligacaomysql.criarligacao();
						Statement stt2=cnn2.createStatement();
						ResultSet rs2=stt2.executeQuery("select * from autores");
						while(rs2.next()){
							out.println("<option value="+rs2.getString(1)+">"+rs2.getString(2)+"</option>");
						}
					
						cnn2.close();
					%>
				
				</select>
			</div>			
			
			<div class="form-group">	
				<label>Ano</label>
				<input class="form-control" type="number" name="ano" 
				placeholder="Insira o ano da edição" required>
			</div>			
			
			<div class="form-group">	
				<label>Preço</label>
				<input class="form-control" type="number" name="preco" 
				placeholder="Insira o preço do livro" required>
			</div>	
			
			<input class="btn btn-primary" type="submit" value="Registar">
			<input class="btn btn-secondary" type="reset" value="Cancelar">
		</form>
		<br>
		<div id="aviso"></div>
		<br>
		<%
		
			String ftitulo=request.getParameter("titulo");
			String ftema=request.getParameter("tema");
			String feditora=request.getParameter("editora");
			String fescritor=request.getParameter("escritor");
			String fano=request.getParameter("ano");
			String fpreco=request.getParameter("preco");
		
		
			if (ftitulo==null){
				%>
				
					<script>
						document.getElementById('aviso').style.visibility='hidden';
					</script>
				
				<%
			}
			else{
				Connection cn=ligacaomysql.criarligacao();
				Statement st=cn.createStatement();
				
				try{
					st.executeUpdate("insert into livros (titulo,"+
				    "id_genero,id_editora,id_autor,ano_publicacao,preco)"+
					" values ('"+ftitulo+"','"+ftema+"','"+feditora+"','"+fescritor+"','"+fano+"','"+fpreco+"')");
					%>
					
						<script>
							document.getElementById('aviso').style.visibility='visible';
							document.getElementById('aviso').innerHTML="<h3 style='color:green'>Livro registado.</h3>";
						</script>
					
					<%
				}
				catch(SQLException e){
					%>
					
						<script>
							document.getElementById('aviso').style.visibility='visible';
							document.getElementById('aviso').innerHTML="<h3 style='color:red'>Erro ao registar o Livro.</h3>";
						</script>					
					
					<%
					//out.println(e.getMessage());
				}
				
				cn.close();
				
			}
		
		%>
	</div>
</body>
</html>