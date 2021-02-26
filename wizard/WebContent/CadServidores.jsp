<%@page import="java.util.List"%>
<%@page import="br.com.wizard.utils.Utils"%>
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
	<!-- VERIFICA SE HA ALGUMA SESSAO COM USUARIO LOGADO -->
	<%
		String usu = (String) session.getAttribute("usuLogado");
		if (usu == null) {
			response.sendRedirect("./login");
		}
	%>

	<%@include file="TopoAdmin.jsp"%>

	<div class="container">
		<br>
		<p class="cabecalho">Servidor 192.168.1.208 - Jiva</p>
		<div class="row">
			<%
				Utils utils = new Utils();
				Servidores servidores = new Servidores();
				ServidoresDao servidoresDao = new ServidoresDao();
				List<Servidores> s = servidoresDao.listar208();
			%>

			<!-- Alimenta Tabela de Consultores Inicio -->
			<table class="table">
				<thead>
					<tr>
						<th colspan="1" class="text-center">Porta</th>
						<th colspan="1" class="text-center">Base</th>
						<th colspan="1" class="text-center">Versão</th>
						<th colspan="1" class="text-center"></th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < s.size(); i++) {
							servidores = s.get(i);
					%>

					<tr>
						<td class="text-center"><%=servidores.getPorta()%></td>
						<td class="text-center"><%=servidores.getBase()%></td>
						<td class="text-center"><%=servidores.getVersao()%></td>
						<td align="right">
							<button type="button" class="btn btn-primary"
								onclick="parent.location.href='./AltServidores.jsp?servidor=192.168.1.208&porta=<%=servidores.getPorta()%>&base=<%=utils.encodeUrl(servidores.getBase())%>&versao=<%=utils.encodeUrl(servidores.getVersao())%>&solicitante=<%=utils.encodeUrl(servidores.getSolicitante())%>&executante=<%=utils.encodeUrl(servidores.getExecutante())%>&os=<%=servidores.getOs()%>'" type="submit">Alterar</button>
						</td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
			<!-- Alimenta Tabela de Consultores Fim -->
		</div>
		<br>
		<p class="cabecalho">Servidor 192.168.1.209 - Sankhya</p>
		<div class="row">
			<%
				List<Servidores> a = servidoresDao.listar209();
			%>

			<!-- Alimenta Tabela de Consultores Inicio -->
			<table class="table">
				<thead>
					<tr>
						<th colspan="1" class="text-center">Porta</th>
						<th colspan="1" class="text-center">Base</th>
						<th colspan="1" class="text-center">Versão</th>
						<th colspan="1" class="text-center"></th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 0; i < a.size(); i++) {
							servidores = a.get(i);
					%>

					<tr>
						<td class="text-center"><%=servidores.getPorta()%></td>
						<td class="text-center"><%=servidores.getBase()%></td>
						<td class="text-center"><%=servidores.getVersao()%></td>
						<td align="right">
							<button type="button" class="btn btn-primary"
								onclick="parent.location.href='./AltServidores.jsp?servidor=192.168.1.209&porta=<%=servidores.getPorta()%>&base=<%=utils.encodeUrl(servidores.getBase())%>&versao=<%=utils.encodeUrl(servidores.getVersao())%>&solicitante=<%=utils.encodeUrl(servidores.getSolicitante())%>&executante=<%=utils.encodeUrl(servidores.getExecutante())%>&os=<%=servidores.getOs()%>'" type="submit">Alterar</button>
						</td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
			<!-- Alimenta Tabela de Consultores Fim -->
		</div>

	</div>

</body>
</html>