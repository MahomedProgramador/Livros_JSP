<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Escritores</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>
	<div class="container" style="background-color: Gainsboro">
	
		<h1>Alterar escritor</h1>
		
		<form method="POST" action="grava_autor.jsp">
			
			<%
				String fautor=request.getParameter("alterar");
			    String fdescescritor="";
			    String fnac="";
			    String ffotog="";
				Connection ligacao=ligacaomysql.criarligacao();
				Statement stt=ligacao.createStatement();
				ResultSet rs=stt.executeQuery("select * from autores where id_autor="+fautor);
				while(rs.next()){
					fdescescritor=rs.getString(2);
					fnac=rs.getString(4);
					ffotog=rs.getString(3);
					out.println(ffotog);
				}
				
			%>
		    
			<div class="form-group">
				<label>Id</label>
				<input class="form-control" type="text" name="txt_id" 
				readonly value=<%out.println(fautor); %>>
			</div>
			<div class="form-group">
				<label>Nome</label>
				<% 
				out.println("<input class='form-control' type='text' name='txt_nome' value='"+fdescescritor+"'>");
				%>
			</div> 
			
			<div class="form-group">
				<label>Nacionalidade</label>
				<select name="txt_nacionalidade" class="form-control" required>
					
					<%
						Connection cn2=ligacaomysql.criarligacao();
						Statement st2=cn2.createStatement();
						ResultSet rs2=st2.executeQuery("select * from nacionalidades");
						while(rs2.next()){
							if(fnac.equals(rs2.getString(1))){
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
				<label>Foto</label>
				<input class="form-control" type="text" name="txt_foto" 
				placeholder="Digite o nome da foto" required value=<%out.println(ffotog); %>>				
			</div>
			
			<input class="btn btn-primary" type="submit" value="Guardar">
	
		</form>

	</div>
</body>
</html>


