<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wizard - Service Desk</title>

<link href="./resources/style/style.css" rel="stylesheet" />

<script>
	function alimcampos() {
		var cst = document.getElementById("codcst");
		var vlrcombocst = cst.options[cst.selectedIndex].text;
		if (vlrcombocst == "000 - Tributado Integralmente") {
			document.getElementById("baseicms").value = "Sim";
			document.getElementById("valoricms").value = "Sim";
			document.getElementById("redbase").value = "Não";
			document.getElementById("basest").value = "Não";
			document.getElementById("valorst").value = "Não";
		} else if (vlrcombocst == "010 - Tributado e c/ Cobrança por ST") {
			document.getElementById("baseicms").value = "Sim";
			document.getElementById("valoricms").value = "Sim";
			document.getElementById("redbase").value = "Não";
			document.getElementById("basest").value = "Sim";
			document.getElementById("valorst").value = "Sim";
		} else if (vlrcombocst == "020 - Com Redução de Base de Cálculo") {
			document.getElementById("baseicms").value = "Sim";
			document.getElementById("valoricms").value = "Sim";
			document.getElementById("redbase").value = "Sim";
			document.getElementById("basest").value = "Não";
			document.getElementById("valorst").value = "Não";
		} else if (vlrcombocst == "030 - Isenta e não Trib. e c/ Cobrança por ST") {
			document.getElementById("baseicms").value = "Não";
			document.getElementById("valoricms").value = "Não";
			document.getElementById("redbase").value = "Não";
			document.getElementById("basest").value = "Sim";
			document.getElementById("valorst").value = "Sim";
		} else if (vlrcombocst == "040 - Isenta") {
			document.getElementById("baseicms").value = "Não";
			document.getElementById("valoricms").value = "Não";
			document.getElementById("redbase").value = "Não";
			document.getElementById("basest").value = "Não";
			document.getElementById("valorst").value = "Não";
		} else if (vlrcombocst == "041 - Não Tributada") {
			document.getElementById("baseicms").value = "Não";
			document.getElementById("valoricms").value = "Não";
			document.getElementById("redbase").value = "Não";
			document.getElementById("basest").value = "Não";
			document.getElementById("valorst").value = "Não";
		} else if (vlrcombocst == "050 - Suspensão") {
			document.getElementById("baseicms").value = "Não";
			document.getElementById("valoricms").value = "Não";
			document.getElementById("redbase").value = "Não";
			document.getElementById("basest").value = "Não";
			document.getElementById("valorst").value = "Não";
		} else if (vlrcombocst == "051 - Diferimento") {
			document.getElementById("baseicms").value = "Não";
			document.getElementById("valoricms").value = "Não";
			document.getElementById("redbase").value = "Não";
			document.getElementById("basest").value = "Não";
			document.getElementById("valorst").value = "Não";
		} else if (vlrcombocst == "060 - ICMS Cobrado Anteriormente por ST") {
			document.getElementById("baseicms").value = "Não";
			document.getElementById("valoricms").value = "Não";
			document.getElementById("redbase").value = "Não";
			document.getElementById("basest").value = "Não";
			document.getElementById("valorst").value = "Não";
		} else if (vlrcombocst == "070 - Com Redução de Base") {
			document.getElementById("baseicms").value = "Sim";
			document.getElementById("valoricms").value = "Sim";
			document.getElementById("redbase").value = "Sim";
			document.getElementById("basest").value = "Sim";
			document.getElementById("valorst").value = "Sim";
		} else if (vlrcombocst == "090 - Outras") {
			document.getElementById("baseicms").value = "Sim / Não";
			document.getElementById("valoricms").value = "Sim / Não";
			document.getElementById("redbase").value = "Sim / Não";
			document.getElementById("basest").value = "Sim / Não";
			document.getElementById("valorst").value = "Sim / Não";
		} else {
			document.getElementById("baseicms").value = "";
			document.getElementById("valoricms").value = "";
			document.getElementById("redbase").value = "";
			document.getElementById("basest").value = "";
			document.getElementById("valorst").value = "";
		}

	}
</script>


</head>
<body>
	<%@include file="Topo.jsp"%>

	<div class="container">
		<br>
		<p class="cabecalho">Tabela de Combinação de CST com Tributação -
			ICMS</p>

		<div class="row justify-content-center align-items-center">
			<div align="center" class="form-group col-md-4">
				<label class="corpo">Código Situação Tributária</label> <select
					id="codcst" class="form-control" onchange="alimcampos();">
					<option selected></option>
					<option>000 - Tributado Integralmente</option>
					<option>010 - Tributado e c/ Cobrança por ST</option>
					<option>020 - Com Redução de Base de Cálculo</option>
					<option>030 - Isenta e não Trib. e c/ Cobrança por ST</option>
					<option>040 - Isenta</option>
					<option>041 - Não Tributada</option>
					<option>050 - Suspensão</option>
					<option>051 - Diferimento</option>
					<option>060 - ICMS Cobrado Anteriormente por ST</option>
					<option>070 - Com Redução de Base</option>
					<option>090 - Outras</option>
				</select>
			</div>
		</div>

		<div class="row justify-content-center align-items-center">
			<div align="center" class="form-group col-md-2">
				<label class="corpo">Base Icms</label> <input type="text"
					class="form-control" id="baseicms" readonly>
			</div>
			<div align="center" class="form-group col-md-2">
				<label class="corpo">Valor Icms</label> <input type="text"
					class="form-control" id="valoricms" readonly>
			</div>
			<div align="center" class="form-group col-md-2">
				<label class="corpo">Red. Base</label> <input type="text"
					class="form-control" id="redbase" readonly>
			</div>
			<div align="center" class="form-group col-md-2">
				<label class="corpo">Base ST</label> <input type="text"
					class="form-control" id="basest" readonly>
			</div>
			<div align="center" class="form-group col-md-2">
				<label class="corpo">Valor ST</label> <input type="text"
					class="form-control" id="valorst" readonly>
			</div>


		</div>



	</div>

</body>
</html>