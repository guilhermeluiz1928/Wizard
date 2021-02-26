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
		<p class="cabecalho">Cadastro de Consultores</p>
		<%
			String erro = (String) request.getAttribute("erro");
			if (erro != null) {
		%><div class="alert alert-danger" role="alert">${erro}</div>
		<%
			}
		%>

		<script>
			function validaCampos() {
				if (document.frm.nome.value.trim().length < 1) {
					//alert('O valor do campo não pode ser nulo.');
					$("#valNome").modal();
					document.frm.nome.focus();
					return false;
				} else if (document.frm.cargo.value.trim().length < 1) {
					$("#valCargo").modal();
					document.frm.cargo.focus();
					return false;
				} else if (document.frm.ramal.value.trim().length < 1) {
					$("#valRamal").modal();
					document.frm.ramal.focus();
					return false;
				} else if (document.frm.executante.value.trim().length < 1) {
					$("#valExecutante").modal();
					document.frm.executante.focus();
					return false;
				} else if (document.frm.hentrada.value.trim().length < 1) {
					$("#valHentrada").modal();
					document.frm.hentrada.focus();
					return false;
				} else if (document.frm.hsaialmoco.value.trim().length < 1) {
					$("#valHsaialmoco").modal();
					document.frm.hsaialmoco.focus();
					return false;
				} else if (document.frm.hretalmoco.value.trim().length < 1) {
					$("#valHretalmoco").modal();
					document.frm.hretalmoco.focus();
					return false;
				} else if (document.frm.hsaida.value.trim().length < 1) {
					$("#valHsaida").modal();
					document.frm.hsaida.focus();
					return false;
				} else if (document.frm.dtnascimento.value.trim().length < 1) {
					$("#valDtnascimento").modal();
					document.frm.dtnascimento.focus();
					return false;
				} else if (document.frm.dtcontratacao.value.trim().length < 1) {
					$("#valDtcontratacao").modal();
					document.frm.dtcontratacao.focus();
					return false;
				}
				return true;
			}

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

			function PreviewImage() {
				var oFReader = new FileReader();
				oFReader
						.readAsDataURL(document.getElementById("inputFoto").files[0]);

				oFReader.onload = function(oFREvent) {
					document.getElementById("previewFoto").src = oFREvent.target.result;
				};
			};
		</script>

		<!-- MODAL DE VALIDACOES INICIO -->

		<div class="modal fade" id="valNome" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Nome.</h5>
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
		<div class="modal fade" id="valCargo" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Cargo.</h5>
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
		<div class="modal fade" id="valHentrada" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Hora de Entrada.</h5>
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
		<div class="modal fade" id="valDtnascimento" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Data de Nascimento.</h5>
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
		<div class="modal fade" id="valRamal" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Ramal.</h5>
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
		<div class="modal fade" id="valHsaialmoco" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Hora de Saída Almoço.</h5>
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
		<div class="modal fade" id="valHretalmoco" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Horário de Retorno Almoço.</h5>
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
		<div class="modal fade" id="valHsaida" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Hora de Saída.</h5>
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
		<div class="modal fade" id="valDtcontratacao" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="Label">Favor preencher o campo
							Data de Contratação.</h5>
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

		<form action="CadConsultores" method="POST" name="frm"
			onsubmit="return validaCampos(this)" enctype="multipart/form-data">

			<div class="form-row">
				<div class="form-group col-md-12">
					<label class="corpo" id="labelNome">Nome</label> <input type="text"
						class="form-control" name="nome" maxlength="100">
				</div>
			</div>

			<%
				Opcoes opcoes = new Opcoes();
				OpcoesDao opcoesDao = new OpcoesDao();
				opcoes.setTabela("CONSULTORES");
				opcoes.setCampo("CARGO");
				List<Opcoes> cargo = opcoesDao.listar(opcoes);
			%>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label class="corpo">Cargo</label> <select name="cargo"
						class="form-control">
						<option selected></option>
						<%
							for (int i = 0; i < cargo.size(); i++) {
								opcoes = cargo.get(i);
						%>
						<option><%=opcoes.getOpcao()%></option>
						<%
							}
						%>
					</select>
				</div>

				<%
					opcoes.setTabela("CONSULTORES");
					opcoes.setCampo("ESPECIALIDADE");
					List<Opcoes> espec = opcoesDao.listar(opcoes);
				%>

				<div class="form-group col-md-6">
					<label class="corpo">Especialidade</label> <select
						name="especialidade" class="form-control">
						<option selected></option>
						<%
							for (int i = 0; i < espec.size(); i++) {
								opcoes = espec.get(i);
						%>
						<option><%=opcoes.getOpcao()%></option>
						<%
							}
						%>
					</select>
				</div>

			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label class="corpo">Ramal</label> <input type="text"
						class="form-control" name="ramal"
						onkeypress="return somenteNumeros(event)" maxlength="5">
				</div>

				<div class="form-group col-md-6">
					<label class="corpo">Executante</label> <input type="text"
						class="form-control" name="executante"
						onkeypress="return somenteNumeros(event)" maxlength="5">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-3">
					<label class="corpo">Hora de Entrada</label> <input type="time"
						class="form-control" name="hentrada">
				</div>

				<div class="form-group col-md-3">
					<label class="corpo">Hora de Saída Almoço</label> <input
						type="time" class="form-control" name="hsaialmoco">
				</div>

				<div class="form-group col-md-3">
					<label class="corpo">Hora de Retorno Almoço</label> <input
						type="time" class="form-control" name="hretalmoco">
				</div>

				<div class="form-group col-md-3">
					<label class="corpo">Hora de Saída</label> <input type="time"
						class="form-control" name="hsaida">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group col-md-3">
					<label class="corpo">Data de Nascimento</label> <input type="date"
						class="form-control" name="dtnascimento">
				</div>

				<div class="form-group col-md-3">
					<label class="corpo">Data de Contratação</label> <input type="date"
						class="form-control" name="dtcontratacao">
				</div>

				<%
					Consultores consultores = new Consultores();
					ConsultoresDao consultoresDao = new ConsultoresDao();
					List<Consultores> lstLideres = consultoresDao.listarLider();
				%>
				<!-- NOVA ALTERACAO INICIO -->
				<div class="form-group col-md-6">
					<label class="corpo">Lider de Célula</label> <select name="lider"
						class="form-control">
						<option selected></option>
						<%
							for (int i = 0; i < lstLideres.size(); i++) {
								consultores = lstLideres.get(i);
						%>
						<option><%=consultores.getNome()%></option>
						<%
							}
						%>
					</select>
				</div>
				<!-- NOVA ALTERACAO FIM -->

			</div>

			<div class="form-row justify-content-md-center">
				<img
					style="width: 300px; height: 300px; object-fit: contain; border-radius: 100%; object-fit: cover;"
					src="./resources/imagens/sem_foto.png" id="previewFoto">
			</div>
			<div class="form-row justify-content-md-center">
				<div class="form-group col-md-4">
					<input type="file" name="foto" id="inputFoto" accept="image/*"
						onchange="PreviewImage();" class="form-control-file">
				</div>
			</div>
	</div>
	</br>

	<div class="form-row justify-content-md-center">
		<div class="form-group col-md-1">
			<input type="submit" class="btn btn-secondary btn-lg" value="Salvar">
		</div>
		<div class="form-group col-md-1">
			<button type="button" class="btn btn-secondary btn-lg" type="submit"
				OnClick="parent.location.href='./consultores'">Voltar</button>
		</div>
	</div>

	</form>
	</br>

	</div>

</body>
</html>