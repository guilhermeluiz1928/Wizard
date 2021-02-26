<%@page import="br.com.wizard.model.Servidores"%>
<%@page import="br.com.wizard.dao.ServidoresDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	Servidores servidores = new Servidores();
	ServidoresDao servidoresDao = new ServidoresDao(); 
	%>

	<div class="container">

		<div class="row">
			<div class="col">
				<br>
				<p class="cabecalho">Servidor 192.168.1.208 - Jiva</p>
			</div>
		</div>

		<div class="row">
			<div class="col-sm">
				<div class="jumbotron">
					<p class="corpo_serv">
						<%
						servidores.setServidor("192.168.1.208");
						servidores.setPorta(8080);
						servidoresDao.listarServidores(servidores);					    			    
					    %>												
						Base: <%= servidores.getBase()%> <br>
						Versão: <%= servidores.getVersao()%> <br>
						Solicitante: <%= servidores.getSolicitante()%> <br>												
						Executante: <%= servidores.getExecutante()%> <br>
						Data: <%= servidores.getData()%> <br>
						OS: <%= servidores.getOs()%>
					</p>
					<a href="http://192.168.1.208:8080/mge/" target="_blank" class="btn btn-primary">Acessar a Porta 8080</a>
				</div>
			</div>
			<div class="col-sm">
				<div class="jumbotron">
						<p class="corpo_serv">
						<%
						servidores.setServidor("192.168.1.208");
						servidores.setPorta(8180);
						servidoresDao.listarServidores(servidores);					    			    
					    %>												
						Base: <%= servidores.getBase()%> <br>
						Versão: <%= servidores.getVersao()%> <br>
						Solicitante: <%= servidores.getSolicitante()%> <br>												
						Executante: <%= servidores.getExecutante()%> <br>
						Data: <%= servidores.getData()%> <br>
						OS: <%= servidores.getOs()%>
					</p>
					<a href="http://192.168.1.208:8180/mge/" target="_blank" class="btn btn-primary">Acessar a Porta 8180</a>
				</div>
			</div>
			<div class="col-sm">
				<div class="jumbotron">
					<p class="corpo_serv">
						<%
						servidores.setServidor("192.168.1.208");
						servidores.setPorta(8280);
						servidoresDao.listarServidores(servidores);					    			    
					    %>												
						Base: <%= servidores.getBase()%> <br>
						Versão: <%= servidores.getVersao()%> <br>
						Solicitante: <%= servidores.getSolicitante()%> <br>	 											
						Executante: <%= servidores.getExecutante()%> <br>
						Data: <%= servidores.getData()%> <br>
						OS: <%= servidores.getOs()%>
					</p>
					<a href="http://192.168.1.208:8280/mge/" target="_blank" class="btn btn-primary">Acessar a Porta 8280</a>
				</div>
			</div>
			<div class="col-sm">
				<div class="jumbotron">
					<p class="corpo_serv">
						<%
						servidores.setServidor("192.168.1.208");
						servidores.setPorta(8380);
						servidoresDao.listarServidores(servidores);					    			    
					    %>												
						Base: <%= servidores.getBase()%> <br>
						Versão: <%= servidores.getVersao()%> <br>
						Solicitante: <%= servidores.getSolicitante()%> <br>												
						Executante: <%= servidores.getExecutante()%> <br>
						Data: <%= servidores.getData()%> <br>
						OS: <%= servidores.getOs()%>
					</p>
					<a href="http://192.168.1.208:8380/mge/" target="_blank" class="btn btn-primary">Acessar a Porta 8380</a>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col">				
				<p class="cabecalho">Servidor 192.168.1.209 - Sankhya</p>
			</div>
		</div>

		<div class="row">
			<div class="col-sm">
				<div class="jumbotron">
					<p class="corpo_serv">
						<%
						servidores.setServidor("192.168.1.209");
						servidores.setPorta(8080);
						servidoresDao.listarServidores(servidores);					    			    
					    %>												
						Base: <%= servidores.getBase()%> <br>
						Versão: <%= servidores.getVersao()%> <br>
						Solicitante: <%= servidores.getSolicitante()%> <br>												
						Executante: <%= servidores.getExecutante()%> <br>
						Data: <%= servidores.getData()%> <br>
						OS: <%= servidores.getOs()%>
					</p>
					<a href="http://192.168.1.209:8080/mge/" target="_blank" class="btn btn-primary">Acessar a Porta 8080</a>
				</div>
			</div>
			<div class="col-sm">
				<div class="jumbotron">
					<p class="corpo_serv">
						<%
						servidores.setServidor("192.168.1.209");
						servidores.setPorta(8180);
						servidoresDao.listarServidores(servidores);					    			    
					    %>												
						Base: <%= servidores.getBase()%> <br>
						Versão: <%= servidores.getVersao()%> <br>
						Solicitante: <%= servidores.getSolicitante()%> <br>												
						Executante: <%= servidores.getExecutante()%> <br>
						Data: <%= servidores.getData()%> <br>
						OS: <%= servidores.getOs()%>
					</p>
					<a href="http://192.168.1.209:8180/mge/" target="_blank" class="btn btn-primary">Acessar a Porta 8180</a>
				</div>
			</div>
			<div class="col-sm">
				<div class="jumbotron">
					<p class="corpo_serv">
						<%
						servidores.setServidor("192.168.1.209");
						servidores.setPorta(8280);
						servidoresDao.listarServidores(servidores);					    			    
					    %>												
						Base: <%= servidores.getBase()%> <br>
						Versão: <%= servidores.getVersao()%> <br>
						Solicitante: <%= servidores.getSolicitante()%> <br>												
						Executante: <%= servidores.getExecutante()%> <br>
						Data: <%= servidores.getData()%> <br>
						OS: <%= servidores.getOs()%>
					</p>
					<a href="http://192.168.1.209:8280/mge/" target="_blank" class="btn btn-primary">Acessar a Porta 8280</a>
				</div>
			</div>
			<div class="col-sm">
				<div class="jumbotron">
					<p class="corpo_serv">
						<%
						servidores.setServidor("192.168.1.209");
						servidores.setPorta(8380);
						servidoresDao.listarServidores(servidores);					    			    
					    %>												
						Base: <%= servidores.getBase()%> <br>
						Versão: <%= servidores.getVersao()%> <br>
						Solicitante: <%= servidores.getSolicitante()%> <br>												
						Executante: <%= servidores.getExecutante()%> <br>
						Data: <%= servidores.getData()%> <br>
						OS: <%= servidores.getOs()%>
					</p>
					<a href="http://192.168.1.209:8380/mge/" target="_blank" class="btn btn-primary">Acessar a Porta 8380</a>
				</div>
			</div>
		</div>

	</div>

</body>