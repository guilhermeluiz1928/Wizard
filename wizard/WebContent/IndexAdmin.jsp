<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="br.com.wizard.dao.ElogiosDao"%>
<%@page import="br.com.wizard.model.Elogios"%>
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
<!-- <link rel="icon" href="../../../../favicon.ico"> -->

<link href="./resources/style/style.css" rel="stylesheet" />

</head>
<body>

	<!-- VERIFICA SE HA ALGUMA SESSAO COM USUARIO LOGADO -->
	<%
	String usu = (String) session.getAttribute("usuLogado"); 
	if(usu==null){
		response.sendRedirect("./login");
	}
	%>

	<%@include file="TopoAdmin.jsp"%>

</body>