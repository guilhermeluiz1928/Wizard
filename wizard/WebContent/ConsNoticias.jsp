<%@page import="br.com.wizard.utils.Utils"%>
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

<style>
td {
	max-width: 100px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
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
		<p class="cabecalho">Notícias</p>
		<%
			String erro = (String) request.getAttribute("erro");
			if (erro != null) {
		%><div class="alert alert-danger" role="alert">${erro}</div>
		<%
			}
		%>

		<div class="row">
			<input class="form-control" id="pesquisa" type="text"
				placeholder="Pesquisar...">
		</div>

		<div class="row">
			<%
				Utils utils = new Utils();
				Noticias noticias = new Noticias();
				NoticiasDao noticiasDao = new NoticiasDao();
				List<Noticias> lst = noticiasDao.listar();
			%>

			<!-- Alimenta Tabela de Consultores Inicio -->
			<table class="table">
				<thead>
					<tr>
						<th colspan="1" class="text-center">Titulo</th>
						<th colspan="1" class="text-center">Link</th>
						<th colspan="1" class="text-center">Noticia</th>
						<th colspan="1" class="text-center"></th>
						<th colspan="1" class="text-center"></th>
					</tr>
				</thead>
				<tbody id="tabela">
					<%
						for (int i = 0; i < lst.size(); i++) {
							noticias = lst.get(i);
					%>

					<!-- JavaScript que passa parâmetro para o Modal Inicio-->
					<script>
						function setaId(id) {
							document.getElementById('notId').value = id;
						}
					</script>
					<!-- JavaScript que passa parâmetro para o Modal Fim-->

					<tr>
						<td class="text-center"><%=noticias.getTitulo()%></td>
						<td class="text-center"><%=noticias.getLink()%></td>
						<td class="text-center"><%=noticias.getNoticia()%></td>
						<td align="right">
							<button type="button" class="btn btn-primary"
								onclick="parent.location.href='./AltNoticias.jsp?id=<%=noticias.getId()%>&titulo=<%=utils.encodeUrl(noticias.getTitulo())%>&link=<%=utils.encodeUrl(noticias.getLink())%>&noticia=<%=utils.encodeUrl(noticias.getNoticia())%>'"
								type="submit">Alterar</button>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#confirmaexclusao"
								onclick="setaId('<%=noticias.getId()%>')">Excluir</button>
						</td>
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

			<!-- Cria Modal de Exclusão do Elogio Inicio -->
			<div class="modal fade" id="confirmaexclusao" tabindex="-1"
				role="dialog" aria-labelledby="Label" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="Label">Deseja realmente excluir
								a noticia?</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Não</button>

							<form action="DelNoticias" method="POST">
								<!-- O "id" recebe o parametro via JavaScript para passar para o Servlet Inicio-->
								<input type="hidden" name="id" id="notId"> <input
									type="submit" class="btn btn-primary" value="Sim">
								<!-- O "id" recebe o parametro via JavaScript para passar para o Servlet Fim-->
							</form>
							<br>
							<p class="msgerro">${erro}</p>

						</div>
					</div>
				</div>
			</div>
			<!-- Cria Modal de Exclusão do Elogio Fim -->

		</div>


		<div class="row justify-content-md-center">
			<button OnClick="parent.location.href='./cadnoticias'" type="submit"
				class="btn btn-secondary btn-lg">Cadastrar</button>
		</div>
		<br>

	</div>


</body>
</html>