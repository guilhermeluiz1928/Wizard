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
		href="./"> <img src="./resources/imagens/logo2.png" width="148"
		height="70"> <img src="./resources/imagens/logo3.png"
		width="124" height="65">

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
				aria-expanded="false"> Service Desk </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="./aniversariantes">Aniversariantes
						do Mês</a> <a class="dropdown-item" href="./noticias">Notícias</a> <a
						class="dropdown-item" href="./servidores">Servidores de Testes</a>
					<a class="dropdown-item" href="./combcst">Combinação CST</a> <a
						class="dropdown-item" href="./equipes">Equipes</a> <a
						class="dropdown-item" href="./consconsultores">Consultores e
						Ramais</a>
				</div></li>

			<li class="nav-item active dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Links Úteis </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="https://www.sankhya.com.br/"
						target="_blank">Portal Sankhya</a> <a class="dropdown-item"
						href="http://skw.sankhya.com.br/mge/rh/index.jsp" target="_blank">Portal
						RH</a> <a class="dropdown-item"
						href="https://ajuda.sankhya.com.br/hc/pt-br" target="_blank">Central
						de Ajuda</a> <a class="dropdown-item"
						href="http://place.sankhya.com.br/" target="_blank">Sankhya
						Place</a> <a class="dropdown-item"
						href="http://downloads.sankhya.com.br/" target="_blank">Downloads
						Sankhya-W</a> <a class="dropdown-item" href="#">Downloads Jiva-W</a> <a
						class="dropdown-item" href="#">Universidade</a> <a
						class="dropdown-item" href="#">Code Sankhya</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Portal NF-e</a> <a
						class="dropdown-item" href="#">Sintegra</a> <a
						class="dropdown-item" href="#">EFD/ECD/PIS/COFINS</a> <a
						class="dropdown-item" href="#">Validar Cód. Barras</a> <a
						class="dropdown-item" href="#">Validar NCM</a>
				</div></li>

			<li class="nav-item active"><a class="nav-link" href="./login">Administração
			</a></li>

			</li>

		</ul>
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
						<p><%=elogios.getElogiado()%>
							-
							<%=elogios.getAutor()%></p>
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