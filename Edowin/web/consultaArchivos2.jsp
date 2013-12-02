<%-- 
	Document   : consultaArchivos2
	Created on : 2/12/2013, 12:49:27 AM
	Author     : YangEnrique
--%>

<%@page import="bd.FunMysql"%>
<%@page import="funciones.vidaFacil"%>
<%@page import="objetos.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<title>Mis Documentos</title>

	<link rel="stylesheet" type="text/css" href="front-end/adminUI.css">
	<script type="text/javascript" src="front-end/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="front-end/eduwin.js"></script>
</head>

	<%
        try{
	String cierto = (String)session.getAttribute("inicio");
	if(cierto != null){
		 Usuario usuario = (Usuario)session.getAttribute("user");
	%>
	
<body>
	<div id="wrapper">

		<%@ include file="sidebar.jsp" %> 

		<div class="not-sidebar">

			<h1>Mis Documentos</h1>

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
			FunMysql con = new FunMysql();
			con.conectar();
			 try{
			 ResultSet resultado = con.consultaArchivoPor("Usuario",String.valueOf(usuario.getID()));
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

		<a href="subeArchivo.jsp" class="superboton">Crear Documento</a>

	</div>
</div>
		 <%
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
