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
			document.getElementById("redbase").value = "N�o";
			document.getElementById("basest").value = "N�o";
			document.getElementById("valorst").value = "N�o";
		} else if (vlrcombocst == "010 - Tributado e c/ Cobran�a por ST") {
			document.getElementById("baseicms").value = "Sim";
			document.getElementById("valoricms").value = "Sim";
			document.getElementById("redbase").value = "N�o";
			document.getElementById("basest").value = "Sim";
			document.getElementById("valorst").value = "Sim";
		} else if (vlrcombocst == "020 - Com Redu��o de Base de C�lculo") {
			document.getElementById("baseicms").value = "Sim";
			document.getElementById("valoricms").value = "Sim";
			document.getElementById("redbase").value = "Sim";
			document.getElementById("basest").value = "N�o";
			document.getElementById("valorst").value = "N�o";
		} else if (vlrcombocst == "030 - Isenta e n�o Trib. e c/ Cobran�a por ST") {
			document.getElementById("baseicms").value = "N�o";
			document.getElementById("valoricms").value = "N�o";
			document.getElementById("redbase").value = "N�o";
			document.getElementById("basest").value = "Sim";
			document.getElementById("valorst").value = "Sim";
		} else if (vlrcombocst == "040 - Isenta") {
			document.getElementById("baseicms").value = "N�o";
			document.getElementById("valoricms").value = "N�o";
			document.getElementById("redbase").value = "N�o";
			document.getElementById("basest").value = "N�o";
			document.getElementById("valorst").value = "N�o";
		} else if (vlrcombocst == "041 - N�o Tributada") {
			document.getElementById("baseicms").value = "N�o";
			document.getElementById("valoricms").value = "N�o";
			document.getElementById("redbase").value = "N�o";
			document.getElementById("basest").value = "N�o";
			document.getElementById("valorst").value = "N�o";
		} else if (vlrcombocst == "050 - Suspens�o") {
			document.getElementById("baseicms").value = "N�o";
			document.getElementById("valoricms").value = "N�o";
			document.getElementById("redbase").value = "N�o";
			document.getElementById("basest").value = "N�o";
			document.getElementById("valorst").value = "N�o";
		} else if (vlrcombocst == "051 - Diferimento") {
			document.getElementById("baseicms").value = "N�o";
			document.getElementById("valoricms").value = "N�o";
			document.getElementById("redbase").value = "N�o";
			document.getElementById("basest").value = "N�o";
			document.getElementById("valorst").value = "N�o";
		} else if (vlrcombocst == "060 - ICMS Cobrado Anteriormente por ST") {
			document.getElementById("baseicms").value = "N�o";
			document.getElementById("valoricms").value = "N�o";
			document.getElementById("redbase").value = "N�o";
			document.getElementById("basest").value = "N�o";
			document.getElementById("valorst").value = "N�o";
		} else if (vlrcombocst == "070 - Com Redu��o de Base") {
			document.getElementById("baseicms").value = "Sim";
			document.getElementById("valoricms").value = "Sim";
			document.getElementById("redbase").value = "Sim";
			document.getElementById("basest").value = "Sim";
			document.getElementById("valorst").value = "Sim";
		} else if (vlrcombocst == "090 - Outras") {
			document.getElementById("baseicms").value = "Sim / N�o";
			document.getElementById("valoricms").value = "Sim / N�o";
			document.getElementById("redbase").value = "Sim / N�o";
			document.getElementById("basest").value = "Sim / N�o";
			document.getElementById("valorst").value = "Sim / N�o";
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
		<p class="cabecalho">Tabela de Combina��o de CST com Tributa��o -
			ICMS</p>

		<div class="row justify-content-center align-items-center">
			<div align="center" class="form-group col-md-4">
				<label class="corpo">C�digo Situa��o Tribut�ria</label> <select
					id="codcst" class="form-control" onchange="alimcampos();">
					<option selected></option>
					<option>000 - Tributado Integralmente</option>
					<option>010 - Tributado e c/ Cobran�a por ST</option>
					<option>020 - Com Redu��o de Base de C�lculo</option>
					<option>030 - Isenta e n�o Trib. e c/ Cobran�a por ST</option>
					<option>040 - Isenta</option>
					<option>041 - N�o Tributada</option>
					<option>050 - Suspens�o</option>
					<option>051 - Diferimento</option>
					<option>060 - ICMS Cobrado Anteriormente por ST</option>
					<option>070 - Com Redu��o de Base</option>
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