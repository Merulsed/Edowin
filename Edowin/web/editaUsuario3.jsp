<%-- 
	Document   : editaUsuario3
	Created on : 23/11/2013, 11:49:59 PM
	Author     : YangEnrique
--%>

<%@page import="funciones.vidaFacil"%>
<%@page import="objetos.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bd.FunMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<title>Crear Usuario</title>

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

	//el objecto con se debe pasar con sessiones miesntars estara asi
	int valor = Integer.parseInt(request.getParameter("ID"));
	vidaFacil facil = new vidaFacil();
	Usuario user = facil.obtenUsuario(valor);
	session.setAttribute("usuarioeditado", user);
%>

	<div id="wrapper">

              <%@ include file="sidebar.jsp" %> 

		<div class="not-sidebar">

			<h1>Editar Usuario</h1>

			<form action="editaUsuario4.jsp" method="POST">

				<input type="text" name="ID" class="hidden" value="<% out.print(valor); %>">

				<div class="inputbox">
					<p>Nombre de usuario</p>
					<input type="text" placeholder="Username" name="username"  value="<% out.print(user.getUsername()); %>">
				</div>
				<div class="inputbox">
					<p>Mail</p>
					<input type="text" placeholder="e-mail" name="mail"  value="<% out.print(user.getMail()); %>">
				</div>
				<div class="inputbox">
					<p>Nombre</p>
					<input type="text" placeholder="Nombre" name="nombre" value="<% out.print(user.getNombre()); %>">
				</div>
				<div class="inputbox">
					<p>Apellido Paterno</p>
					<input type="text" placeholder="Apellido Paterno" name="apellidoP"  value="<% out.print(user.getApellidoP()); %>">
				</div>
				<div class="inputbox">
					<p>Apellido Materno</p>
					<input type="text" placeholder="Apellido Materno" name="apellidoM" value="<% out.print(user.getApellidoM()); %>">
				</div>
				<div class="inputbox">
					<p>Es Administrador?</p>
                                        <% if(user.getEsAdmin()==true){ %>
                                                Si<input type="radio" name="esAdmin" value="true" checked="checked"><br>
                                                No<input type="radio" name="esAdmin" value="false"><br>
                                        <% }else{ %>
                                                Si<input type="radio" name="esAdmin" value="true"><br>
                                                No<input type="radio" name="esAdmin" value="false" checked="checked"><br>
                                        <% } %>
				</div>
				<div class="inputbox">
                                        <a href="eliminaUsuario.jsp?ID=<% out.print(valor); %>" class="eliminar">Eliminar Usuario</a>
                                        <br>
                                        <input type="submit" value="Actualizar">
				</div>

			</form>

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