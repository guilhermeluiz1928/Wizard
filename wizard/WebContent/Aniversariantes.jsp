<%@page import="java.util.List"%>
<%@page import="br.com.wizard.dao.AniversariantesDao"%>
<%@page import="br.com.wizard.model.Aniversariantes"%>
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
	<%
		Aniversariantes aniversariantes = new Aniversariantes();
		AniversariantesDao aniversariantesDao = new AniversariantesDao();
		aniversariantesDao.mesAtual(aniversariantes);
	%>

	<div class="container">
		<br>
		<p class="cabecalho">
			Parabéns aos aniversariantes do mês de
			<%=aniversariantes.getMesAtual()%>!
		</p>
		<div class="row">
			<%
				List<Aniversariantes> a = aniversariantesDao.listar();
			%>
			<!-- Alimenta Tabela de Anoversariantes Inicio -->
			<table class="table">
				<thead>
					<tr>
						<th colspan="1" class="text-center">Nome</th>
						<th colspan="1" class="text-center">Cargo</th>
						<th colspan="1" class="text-center">Especialidade</th>
						<th colspan="1" class="text-center">Dia</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < a.size(); i++) {
							aniversariantes = a.get(i);

							String especialidade;
							if (aniversariantes.getEspecialidade().equals("N")) {
								especialidade = "";
							} else {
								especialidade = aniversariantes.getEspecialidade();
							}
					%>

					<tr>
						<td class="text-center"><%=aniversariantes.getNome()%></td>
						<td class="text-center"><%=aniversariantes.getCargo()%></td>
						<td class="text-center"><%=especialidade%></td>
						<td class="text-center"><%=aniversariantes.getDia()%></td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
			<!-- Alimenta Tabela de Aniversariantes Fim -->
			<br>
		</div>
	</div>
	<br>

</body>
</html>