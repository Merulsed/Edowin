<%-- 
	Document   : consultaArchivos
	Created on : 1/12/2013, 10:18:11 PM
	Author     : YangEnrique
--%>

<%@page import="funciones.vidaFacil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bd.FunMysql"%>
<%@page import="objetos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<title>Documentos Públicos</title>

	<link rel="stylesheet" type="text/css" href="front-end/adminUI.css">
	<script type="text/javascript" src="front-end/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="front-end/eduwin.js"></script>
</head>
<body>

<%
    try{
	String cierto = (String)session.getAttribute("inicio");
	if(cierto != null){
		 Usuario usuario = (Usuario)session.getAttribute("user");
		 
		 FunMysql con = new FunMysql();
		 con.conectar();
		 
		 if(usuario.getEsAdmin()){
%>


	<div id="wrapper">

		<%@ include file="sidebar.jsp" %> 

		<div class="not-sidebar">

			<h1>Documentos Públicos</h1>

			<div class="listaUsuarios">

				<div class="row header">
					<div class="user id">ID</div><!-- 
                                        --><div class="user random16">Nombre</div><!-- 
                                        --><div class="user random8">Tipo</div><!-- 
                                        --><div class="user random4">¿Público?</div><!-- 
                                        --><div class="user random8">Dueño</div><!-- 
                                        --><div class="user descargar">Descargar</div><!--
                                        --><div class="user editar">Editar</div><!-- 
				 --></div>

<%
			 try{
			 ResultSet resultado = con.consultaArchivos();
			 Usuario user;
			 vidaFacil facil = new vidaFacil();
	   
				while(resultado.next()){
                                    out.print("<div class='row not-header'>");
					user = facil.obtenUsuario(resultado.getInt("userID"));

					out.print("<div class='user id'>"+resultado.getInt("idArchivo")+"</div>");
					out.print("<div class='user random16'>"+resultado.getString("nombre")+"</div>");
					out.print("<div class='user random8'>"+resultado.getString("tipo")+"</div>");
					out.print("<div class='user random4'>"+resultado.getString("publico")+"</div>");
					out.print("<div class='user random8'>"+user.getUsername()+"</div>");
					out.print("<div class='user descargar'><a href='descargaArchivo.jsp?id="+resultado.getInt("idArchivo")+"'>Descargar</a></div>");
					out.print("<div class='user editar'><a href='editaArchivo.jsp?id="+resultado.getInt("idArchivo")+"'>Editar</a></div>");
                                        
                                    out.print("</div>");
				 
				}
			 }catch(Exception e){
				 e.printStackTrace();
			 }
%>
                            
			</div>
		</div>
	</div>

		<h1>Consulta de Archvivos Administrador</h1>
		<table border="1">


			
<%
			 
		 }else{
%>
		<h1>Consulta de Archvivos</h1>
		<table border="1">
			<tr>
				<td>Id</td>
				<td>Nombre</td>
				<td>Tipo</td>
				<td>Usuario</td>
				<td>Descargar</td>
			</tr>
<%
			 try{
			 ResultSet resultado = con.consultaArchivoPor("Publico", "true");
			 Usuario user;
			 vidaFacil facil = new vidaFacil();
	   
				while(resultado.next()){
					user = facil.obtenUsuario(resultado.getInt("userID"));
					out.print("<tr>");
					out.print("<td>"+resultado.getInt("idArchivo")+"</td>");
					out.print("<td>"+resultado.getString("nombre")+"</td>");
					out.print("<td>"+resultado.getString("tipo")+"</td>");
					out.print("<td>"+user.getUsername()+"</td>");
					out.print("<td><a href='descargaArchivo.jsp?id="+resultado.getInt("idArchivo")+"'>Descargar</a></td>");
					out.print("</tr>");
				 
				}
			 }catch(Exception e){
				 e.printStackTrace();
			 }
%>
<%
		 }
	}else{
%>
		Usuario incorrecto
		<a href="index.jsp">regresar</a>
<%
	}}catch(Exception e){
        e.printStackTrace();
         response.sendRedirect("index.jsp");
    }
%>

	</body>
</html>
