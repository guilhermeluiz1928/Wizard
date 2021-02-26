<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="br.com.wizard.dao.ElogiosDao"%>
<%@page import="br.com.wizard.model.Elogios"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wizard - Service Desk</title>
<!-- <link rel="icon" href="../../../../favicon.ico"> -->

<link href="./resources/style/style.css" rel="stylesheet" />

</head>
<body>

	<%@include file="Topo.jsp"%>

	<div class="container">
		<br>
		<p class="cabecalho">Noticias</p>

		<%
			Noticias noticias = new Noticias();
			NoticiasDao noticiasDao = new NoticiasDao();
			List<Noticias> listaNoticiasUm = noticiasDao.listarum();
			List<Noticias> listaNoticiasDois = noticiasDao.listardois();
		%>

		<div class="row">

			<%
				for (int i = 0; i < listaNoticiasUm.size(); i++) {
					noticias = listaNoticiasUm.get(i);
			%>

			<div class="col-sm-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"><%=noticias.getTitulo()%></h5>
						<p class="card-text"><%=noticias.getNoticia()%></p>
						<a href="<%=noticias.getLink()%>" target="_blank"
							class="btn btn-primary">Saiba mais</a>
					</div>
				</div>
			</div>

			<%
				}
			%>

		</div>

		<br>

		<div class="row">

			<%
				for (int i = 0; i < listaNoticiasDois.size(); i++) {
					noticias = listaNoticiasDois.get(i);
			%>

			<div class="col-sm-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title"><%=noticias.getTitulo()%></h5>
						<p class="card-text"><%=noticias.getNoticia()%></p>
						<a href="<%=noticias.getLink()%>" target="_blank"
							class="btn btn-primary">Saiba mais</a>
					</div>
				</div>
			</div>

			<%
				}
			%>

		</div>

	</div>
	<br>

</body>