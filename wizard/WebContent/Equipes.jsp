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

	<div class="container">
		<br>
		<p class="cabecalho">Equipes do Service Desk</p>

		<div class="row">
			<table class="table">
				<%
					Consultores consultores = new Consultores();
					ConsultoresDao consultoresDao = new ConsultoresDao();
					List<Consultores> lista = consultoresDao.listarEquipes();

					for (int i = 0; i < lista.size(); i++) {
						consultores = lista.get(i);
				%>
				<tbody>
					<tr>
						<td class="text-center"><%=consultores.getLider()%></td>
						<td class="text-center"><%=consultores.getNome()%></td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
		</div>
	</div>

</body>
</html>