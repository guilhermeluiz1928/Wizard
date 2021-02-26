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
		<p class="cabecalho">
			Servidor:
			<%=request.getParameter("servidor")%>:<%=request.getParameter("porta")%></p>
		<br>
		<%
			String erro = (String) request.getAttribute("erro");
			if (erro != null) {
		%><div class="alert alert-danger" role="alert">${erro}</div>
		<%
			}
		%>

		<script>
			function somenteNumeros(e) {
				var tecla = (window.event) ? event.keyCode : e.which;
				if ((tecla > 47 && tecla < 58))
					return true;
				else {
					if (tecla == 8 || tecla == 0)
						return true;
					else
						return false;
				}
			}

			function validaCampos() {
				if (document.frm.base.value.trim().length < 1) {
					$("#valBase").modal();
					document.frm.base.focus();
					return false;
				} else if (document.frm.versao.value.trim().length < 1) {
					$("#valVersao").modal();
					document.frm.versao.focus();
					return false;
				} else if (document.frm.solicitante.value.trim().length < 1) {
					$("#valSolicitante").modal();
					document.frm.solicitante.focus();
					return false;
				} else if (document.frm.executante.value.trim().length < 1) {
					$("#valExecutante").modal();
					document.frm.executante.focus();
					return false;
				} else if (document.frm.os.value.trim().length < 1) {
					$("#valOs").modal();
					document.frm.os.focus();
					return false;
				}
				return true;
			}
		</script>

		<!-- MODAL DE VALIDACOES INICIO -->
		<div class="modal fade" id="valBase" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Base.</h5>
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
		<div class="modal fade" id="valVersao" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Versão.</h5>
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
		<div class="modal fade" id="valSolicitante" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Solicitante.</h5>
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
		<div class="modal fade" id="valExecutante" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Executante.</h5>
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
		<div class="modal fade" id="valOs" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							OS.</h5>
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

		<form action="AltServidores" method="POST" name="frm"
			onsubmit="return validaCampos(this)" enctype="multipart/form-data">

			<input type="hidden" class="form-control" name="servidor"
				value="<%=request.getParameter("servidor")%>"> <input
				type="hidden" class="form-control" name="porta"
				value="<%=request.getParameter("porta")%>">

			<div class="form-row">
				<div class="form-group col-md-6">
					<label class="corpo">Base</label> <input type="text"
						class="form-control" name="base" maxlength="50"
						value="<%=request.getParameter("base")%>">
				</div>

				<div class="form-group col-md-6">
					<label class="corpo">Versão</label> <input type="text"
						class="form-control" name="versao" maxlength="50"
						value="<%=request.getParameter("versao")%>">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-4">
					<label class="corpo">Solicitante</label> <input type="text"
						class="form-control" name="solicitante" maxlength="50"
						value="<%=request.getParameter("solicitante")%>">
				</div>

				<div class="form-group col-md-4">
					<label class="corpo">Executante</label> <input type="text"
						class="form-control" name="executante" maxlength="50"
						value="<%=request.getParameter("executante")%>">
				</div>

				<div class="form-group col-md-4">
					<label class="corpo">OS</label> <input type="text"
						class="form-control" name="os"
						onkeypress="return somenteNumeros(event)" maxlength="10"
						value="<%=request.getParameter("os")%>">
				</div>
			</div>
			</br>

			<div class="form-row justify-content-md-center">
				<div class="form-group col-md-1">
					<input type="submit" class="btn btn-secondary btn-lg"
						value="Salvar">
				</div>
				<div class="form-group col-md-1">
					<button type="button" class="btn btn-secondary btn-lg"
						type="submit" OnClick="parent.location.href='./cadservidores'">Voltar</button>
				</div>
			</div>

		</form>

	</div>

</body>
</html>