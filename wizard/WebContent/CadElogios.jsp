<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wizard - Service Desk</title>

<link href="./resources/style/style.css" type="text/css"
	rel="stylesheet" />
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
		<p class="cabecalho">Elogios</p>
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
				if (document.frm.elogiado.value.trim().length < 1) {
					$("#valElogiado").modal();
					document.frm.elogiado.focus();
					return false;
				} else if (document.frm.autor.value.trim().length < 1) {
					$("#valAutor").modal();
					document.frm.autor.focus();
					return false;
				} else if (document.frm.elogio.value.trim().length < 1) {
					$("#valElogio").modal();
					document.frm.elogio.focus();
					return false;
				}
				return true;
			}
		</script>

		<!-- MODAL DE VALIDACOES INICIO -->
		<div class="modal fade" id="valElogiado" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Elogiado.</h5>
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

		<div class="modal fade" id="valAutor" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Autor.</h5>
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

		<div class="modal fade" id="valElogio" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Elogio.</h5>
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

		<form action="CadElogios" method="POST" name="frm"
			onsubmit="return validaCampos(this)" enctype="multipart/form-data">

			<div class="form-row">
				<div class="form-group col-md-6">
					<label class="corpo" id="labelElogiado">Elogiado</label> <input
						type="text" class="form-control" name="elogiado" maxlength="100">
				</div>
				<div class="form-group col-md-6">
					<label class="corpo" id="labelAutor">Autor</label> <input
						type="text" class="form-control" name="autor" maxlength="100">
				</div>
			</div>
			<div class="form-row">
				<label class="corpo" id="labelElogio">Elogio</label>
				<textarea class="form-control" name="elogio" rows="5" maxlength="290"></textarea>
			</div>

			</br>
			<div class="form-row justify-content-md-center">
				<div class="form-group col-md-1">
					<input type="submit" class="btn btn-secondary btn-lg"
						value="Salvar">
				</div>
				<div class="form-group col-md-1">
					<button type="button" class="btn btn-secondary btn-lg"
						type="submit" OnClick="parent.location.href='./elogios'">Voltar</button>
				</div>
			</div>
		</form>

	</div>

</body>
</html>