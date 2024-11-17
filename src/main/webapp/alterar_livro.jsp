<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Alterar Livro</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<div class="container" style="background-color:Gainsboro">
		<h1>Alterar Livro</h1>
		<form method="POST" action="grava_livro.jsp">
			<%
				String fid=request.getParameter("alterar");
				String ftitulo="";
				String ftema=request.getParameter("tema");
				String feditora=request.getParameter("editora");
				String fescritor=request.getParameter("escritor");
				String fano=request.getParameter("ano");
				String fpreco=request.getParameter("preco");
				Connection cn=ligacaomysql.criarligacao();
				Statement st=cn.createStatement();
				ResultSet rs=st.executeQuery("select * from livros where id_livro='"+fid+"'");
				while(rs.next()){
					ftitulo=rs.getString(2);
					ftema=rs.getString(3);
					feditora=rs.getString(4);
					fescritor=rs.getString(5);
					fano=rs.getString(6);
					fpreco=rs.getString(7);					
				}
				cn.close();
			%>
			<div class="form-group">	
				<label>Id</label>
				<input class="form-control" type="number" name="txt_id" 
				placeholder="Insira o ano da edição" required readonly
				value=<%out.println(fid);%>>
			</div>		
			<div class="form-group">	
				<label>Titulo</label>
				<% 
				out.println("<input class='form-control' type='text' name='titulo' value='"+ftitulo+"'>");
				%>
			</div>
			
			
			<div class="form-group">
				<label>Género</label>
				<select name="tema" class="form-control" required>
				
					<%
					
						Connection cn1=ligacaomysql.criarligacao();
						Statement st1=cn1.createStatement();
						ResultSet rs1=st1.executeQuery("select * from generos");
						while(rs1.next()){
							if(ftema.equals(rs1.getString(1))){
								out.println("<option value="+rs1.getString(1)+" selected>"+
								rs1.getString(2)+"</option>");
							}
							else{
								out.println("<option value="+rs1.getString(1)+">"+
										rs1.getString(2)+"</option>");
							}
						}
					
						cn1.close();
					%>
				
				</select>
			</div>
			
			<div class="form-group">
				<label>Editora</label>
				<select name="editora" class="form-control" required>
				
					<%
					
						Connection cn2=ligacaomysql.criarligacao();
						Statement st2=cn2.createStatement();
						ResultSet rs2=st2.executeQuery("select * from editoras");
						while(rs2.next()){
							if(feditora.equals(rs2.getString(1))){
								out.println("<option value="+rs2.getString(1)+" selected>"+
								rs2.getString(2)+"</option>");
							}
							else{
								out.println("<option value="+rs2.getString(1)+">"+
										rs2.getString(2)+"</option>");
							}
						}
					
						cn2.close();
					%>
				
				</select>
			</div>			
			
			
			<div class="form-group">
				<label>Autor</label>
				<select name="escritor" class="form-control" required>
				
					<%
					
						Connection cn3=ligacaomysql.criarligacao();
						Statement st3=cn3.createStatement();
						ResultSet rs3=st3.executeQuery("select * from autores");
						while(rs3.next()){
							if(fescritor.equals(rs3.getString(1))){
								out.println("<option value="+rs3.getString(1)+" selected>"+
								rs3.getString(2)+"</option>");
							}
							else{
								out.println("<option value="+rs3.getString(1)+">"+
										rs3.getString(2)+"</option>");
							}
						}
					
						cn3.close();
					%>
				
				</select>
			</div>			
			
			<div class="form-group">	
				<label>Ano</label>
				<input class="form-control" type="number" name="ano" 
				placeholder="Insira o ano da edição" required
				value=<%out.println(fano);%>>
			</div>			
			
			<div class="form-group">	
				<label>Preço</label>
				<input class="form-control" type="number" name="preco" 
				placeholder="Insira o preço do livro" required
				<%out.println(fpreco);%>>
			</div>	
			
			<input class="btn btn-primary" type="submit" value="Registar">
	
		<br>
		<br>
		</form>
	</div>
</body>
</html>