<%-- 
    Document   : subeArchivo
    Created on : 30/11/2013, 10:16:22 AM
    Author     : YangEnrique
--%>

<%@page import="objetos.Usuario"%>
<%@page import="objetos.Archivo"%>
<%@page import="bd.FunMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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
        String cierto = (String)session.getAttribute("inicio");
        if(cierto != null){
            Usuario usuario = (Usuario)session.getAttribute("user");
    %>
        
      	<div id="wrapper">
		<div class="sidebar">
                    <p class="logo"><a class="undecorated" href="index2.jsp">Eduwin</a></p>
			<ul class="menu">
                                <% if(usuario.getEsAdmin()){ %>
				<li><a href="altaUsuario.jsp">
					<img src="front-end/img/menu.adduser.png">
					Crear Usuario
				</a></li>
				<li><a href="consultaUsuarios.jsp">
					<img src="front-end/img/menu.edituser.png">
					Administrar Usuarios
				</a></li>
                                <% } %>
				<li><a href="subeArchivo.jsp">
					<img src="front-end/img/menu.addoc.png">
					Crear Documento
				</a></li>
				<li><a href="menuArchivos.jsp">
					<img src="front-end/img/menu.viewdocs.png">
					Administrar Documentos
				</a></li>
				<li><a href="editaUsuario.jsp">
					<img src="front-end/img/menu.settings.png">
					Configuración
				</a></li>
				<li><a href="iniciosesion.jsp">
					<img src="front-end/img/menu.close.png">
					Cerrar Sesión
				</a></li>
				<li><a href="">
					<img src="front-end/img/menu.help.png">
					Ayuda
				</a></li>
			</ul>
			<p class="acerca-de"><a href="">Edowin ESCOM 2013</a></p>
		</div>

		<div class="not-sidebar">

			<h1>Subir un Archivo</h1>
                        
                        <form action="procesaArchivo.jsp" method="POST" enctype="multipart/form-data">
                                <div class="inputbox">
					<p>Selecciona el archivo</p>
					<input type="file" name="file">
				</div>
                            
				<div class="inputbox">
					<input type="submit" value="Subir">
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
    }
%>
    </body>
</html>
