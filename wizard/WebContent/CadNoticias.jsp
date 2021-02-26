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
		<p class="cabecalho">Notícias</p>
		<br>
		<%
			String erro = (String) request.getAttribute("erro");
			if (erro != null) {
		%><div class="alert alert-danger" role="alert">${erro}</div>
		<%
			}
		%>

		<script>
			function validaCampos() {
				if (document.frm.titulo.value.trim().length < 1) {
					$("#valTitulo").modal();
					document.frm.titulo.focus();
					return false;
				} else if (document.frm.link.value.trim().length < 1) {
					$("#valLink").modal();
					document.frm.link.focus();
					return false;
				} else if (document.frm.noticia.value.trim().length < 1) {
					$("#valNoticia").modal();
					document.frm.noticia.focus();
					return false;
				}
				return true;
			}
		</script>

		<!-- MODAL DE VALIDACOES INICIO -->
		<div class="modal fade" id="valTitulo" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Título.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="valLink" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Link.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="valNoticia" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Notícia.</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>
		</div>
		<!-- MODAL DE VALIDACOES FIM -->

		<form action="CadNoticias" method="POST" name="frm"
			onsubmit="return validaCampos(this)" enctype="multipart/form-data">

			<div class="form-row">
				<div class="form-group col-md-6">
					<label class="corpo" id="labelTitulo">Título</label> <input
						type="text" class="form-control" name="titulo" maxlength="900">
				</div>
				<div class="form-group col-md-6">
					<label class="corpo" id="labelLink">Link</label> <input type="text"
						class="form-control" name="link" maxlength="900">
				</div>
			</div>
			<div class="form-row">
				<label class="corpo" id="labelNoticia">Notícia</label>
				<textarea class="form-control" name="noticia" rows="5" maxlength="900"></textarea>
			</div>

			</br>
			<div class="form-row justify-content-md-center">
				<div class="form-group col-md-1">
					<input type="submit" class="btn btn-secondary btn-lg"
						value="Salvar">
				</div>
				<div class="form-group col-md-1">
					<button type="button" class="btn btn-secondary btn-lg"
						type="submit" OnClick="parent.location.href='./consnoticias'">Voltar</button>
				</div>
			</div>
		</form>

	</div>

</body>
</html>