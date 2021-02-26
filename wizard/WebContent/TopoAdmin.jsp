<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="br.com.wizard.dao.*"%>
<%@page import="br.com.wizard.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Wizard - Service Desk</title>

<link rel="stylesheet"
	href="./resources/bootstrap/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- COMEÇA AQUI A NAVBAR -->

	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #1A424A;"> <a class="navbar-brand"
		href="./admin"> <img src="./resources/imagens/logo2.png"
		width="148" height="70"> <img
		src="./resources/imagens/logo3.png" width="124" height="65">

	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">

		<ul class="navbar-nav mr-auto">

			<li class="nav-item active dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Cadastros </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="./consultores">Consultores</a> <a
						class="dropdown-item" href="./cadservidores">Bases de Testes</a> <a
						class="dropdown-item" href="./elogios">Elogios</a><a class="dropdown-item"
						href="./consnoticias">Notícias</a>
				</div></li>

			<li class="nav-item active"><a class="nav-link"
				href="./Deslogar.jsp">Deslogar </a></li>

		</ul>

		<font face="Helvetica" color="white" size="3"><center>
				Bem Vindo</br>
				<%
					String usuLogado = (String) session.getAttribute("usuLogado");
					out.print(usuLogado);
				%>
			</center></font>

	</div>
	</nav>

	<!-- COMEÇA AQUI O CARROSEL -->

	<%
		Elogios elogios = new Elogios();
		ElogiosDao elogiosDao = new ElogiosDao();
		List<Elogios> list = elogiosDao.listar();
	%>

	<div class="bd-example">
		<div id="carousel" class="carousel slide" data-ride="carousel">

			<ol class="carousel-indicators">
				<%
					for (int i = 0; i < list.size(); i++) {
						elogios = list.get(i);
				%>

				<li data-target="#carousel" data-slide-to="<%=elogios.getSeq()%>"
					<%=elogios.getCabCar()%>></li>

				<%
					}
				%>
			</ol>

			<div class="carousel-inner">
				<%
					for (int i = 0; i < list.size(); i++) {
						elogios = list.get(i);
				%>

				<div class="<%=elogios.getItemCar()%>">
					<img src="./resources/imagens/fundo.png" class="d-block w-100"
						alt="..." height="180">
					<div class="carousel-caption d-none d-md-block">
						<h5><%=elogios.getElogio()%></h5>
						<p><%=elogios.getElogiado()%> - <%=elogios.getAutor()%></p>
					</div>
				</div>


				<%
					}
				%>
			</div>

			<a class="carousel-control-prev" href="#carousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>

		</div>
	</div>

	<!-- COMEÇA TERMINA O CARROSEL -->

</body>
</html>