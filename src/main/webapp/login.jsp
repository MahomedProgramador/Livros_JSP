<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="icon" href="imagens/favicon.png">
</head>
<body>

	<div class="container" style="background-color: Gainsboro; margin-top: 100px;">
		<h1>Login</h1>
		<form method="POST" action="ver_user.jsp">
		
			<div class="form-group">
				<label>Utilizador</label>
				<input class="form-control" type="text" 
				name="txt_utilizador" required 
				placeholder="Digite o utilizador">
			</div>
			
			<div class="form-group">
				<label>Password</label>
				<input class="form-control" type="password" 
				name="txt_password" required 
				placeholder="Digite a password">
			</div>
			
			<input class="btn btn-primary" type="submit"
			value="Login">
			<br>			
			<p style="margin-top: 10px;">
			    Ainda não tem conta? 
			    <a href="register.jsp">Registre-se aqui</a>
			</p>
		</form>
	</div>
</body>
</html>