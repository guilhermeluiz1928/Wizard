<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wizard - Service Desk</title>

<link href="./resources/style/style.css" rel="stylesheet" />

</head>
<body>

	<%@include file="Topo.jsp"%>
	<br>

	<div class="container">
		<br>
		<p class="cabecalho">Login</p>
		<div class="row justify-content-md-center">
			<div class="col-4">
				<%
					String erro = (String) request.getAttribute("erro");
					if (erro != null) {
				%><div class="alert alert-danger" role="alert">${erro}</div>
				<%
					}
				%>
			</div>
		</div>

		<form action="login" method="POST">

			<div class="row justify-content-md-center">
				<div class="col-4">
					<label class="corpo">Usuário</label> <input type="text"
						class="form-control" name="usuario">
				</div>
			</div>

			</br>

			<div class="row justify-content-md-center">
				<div class="col-4">
					<label class="corpo">Senha</label> <input type="password"
						class="form-control" name="senha">
				</div>
			</div>

			</br>

			<div class="row justify-content-md-center">
				<input type="submit" class="btn btn-secondary btn-lg" value="Logar">
			</div>

			</br>

		</form>

	</div>

</body>
</html>