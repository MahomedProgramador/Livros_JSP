<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Listagem Livros</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>

	<div class="container" style="background-color: Gainsboro">
	
	
	<h1>Listagem de livros</h1>
	
		<table id="listagem">
		
			<tr>
				<th>Id. Livro</th>
				<th>Titulo</th>
				<th>Género</th>
				<th>Editora</th>
				<th>Escritor</th>
				<th>Ano edição</th>
				<th>Preço</th>
				<th></th>
				<th></th>
	
			</tr>
			
			<%
				
				Connection cn=ligacaomysql.criarligacao();
			    Statement st=cn.createStatement();
			    
			    ResultSet rs;
			    
			    String sql="select livros.id_livro, livros.titulo,  "+
					    "generos.genero, editoras.editora, autores.nome, livros.ano_publicacao, "+
					    "livros.preco from livros, generos, editoras, autores"+
					    " where livros.id_genero=generos.id_genero and "+
					    "livros.id_editora=editoras.id_editora and "+
					    "livros.id_autor=autores.id_autor";
			    
			   
				    rs=st.executeQuery(sql);
				    
			   
			    
			    while(rs.next()){
			    	out.println("<tr><td>"+rs.getString(1)+"</td>");
			    	out.println("<td>"+rs.getString(2)+"</td>");
			    	out.println("<td>"+rs.getString(3)+"</td>");
			    	out.println("<td>"+rs.getString(4)+"</td>");
			    	out.println("<td>"+rs.getString(5)+"</td>");
			    	out.println("<td>"+rs.getString(6)+"</td>");
			    	out.println("<td>"+rs.getString(7)+"</td>");
			    	out.println("<td><a href='alterar_livro.jsp?alterar="+rs.getString(1)+"'><input type='button' class='btn btn-primary' value='Update'></a></td>");
			    	out.println("<td><a href='eliminar_livro.jsp?eliminar="+rs.getString(1)+"'><input type='button' class='btn btn-danger' value='Delete'></a></td></tr>");
		
			    }
			
			    cn.close();
			%>
		
		</table>
	
	</div>
	
</body>
</html>


