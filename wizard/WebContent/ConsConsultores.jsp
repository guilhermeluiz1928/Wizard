<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="br.com.wizard.utils.Utils"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.List"%>
<%@page import="br.com.wizard.dao.ConsultoresDao"%>
<%@page import="br.com.wizard.model.Consultores"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wizard - Service Desk</title>

<link href="./resources/style/style.css" rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>

	<%@include file="Topo.jsp"%>

	<div class="container">
		<br>
		<p class="cabecalho">Consultores</p>

		<div class="row">
			<input class="form-control" id="pesquisa" type="text"
				placeholder="Pesquisar...">
		</div>

		<div class="row">
			<%
				ConsultoresDao consultoresDao = new ConsultoresDao();
				List<Consultores> c = consultoresDao.listar();
			%>
			<!-- Alimenta Tabela de Consultores Inicio -->
			<table class="table">
				<thead>
					<tr>
						<th colspan="1" class="text-center">Nome</th>
						<th colspan="1" class="text-center">Cargo</th>
						<th colspan="1" class="text-center">Especialidade</th>
						<th colspan="1" class="text-center">Ramal</th>
						<th colspan="1" class="text-center">Executante</th>
						<th colspan="1" class="text-center">Expediente</th>
					</tr>
				</thead>
				<tbody id="tabela">
					<%
						for (int i = 0; i < c.size(); i++) {
							Consultores consultores = c.get(i);

							String especialidade;
							if (consultores.getEspecialidade().equals("N")) {
								especialidade = "";
							} else {
								especialidade = consultores.getEspecialidade();
							}
					%>

					<tr>
						<td class="text-center"><%=consultores.getNome()%></td>
						<td class="text-center"><%=consultores.getCargo()%></td>
						<td class="text-center"><%=especialidade%></td>
						<td class="text-center"><%=consultores.getRamal()%></td>
						<td class="text-center"><%=consultores.getExecutante()%></td>
						<td class="text-center"><%=consultores.getExpediente()%></td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
			<!-- Alimenta Tabela de Consultores Fim -->
			
			<script>
			$(document).ready(function(){
			  $("#pesquisa").on("keyup", function() {
			    var value = $(this).val().toLowerCase();
			    $("#tabela tr").filter(function() {
			      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			    });
			  });
			});
			</script>

			<br>
		</div>
	</div>

</body>
</html>