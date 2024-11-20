<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ligarBD.*" %> 
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Register</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>

	<div class="container" style="background-color: Gainsboro; margin-top: 100px;">
		<h1>Registar</h1>
		<form method="POST" action="ver_reg_user.jsp">
		
			<div class="form-group">
				<label>Utilizador</label>
				<input class="form-control" type="text" 
				name="txt_reg_utilizador" required 
				placeholder="Digite o utilizador">
			</div>
			
			<div class="form-group">
				<label>Password</label>
				<input class="form-control" type="password" 
				name="txt_reg_password" required 
				placeholder="Digite a password">
			</div>
			
			<div class="form-group">
				<label>Password</label>
				<input class="form-control" type="password" 
				name="txt_conf_password" required 
				placeholder="Repita a password">
			</div>
			
			<input class="btn btn-primary" type="submit"
			value="Registar">
			<input class="btn btn-info" type="reset"
			value="Cancelar">
			<br>			
			
		</form>
	</div>
</body>
</html>