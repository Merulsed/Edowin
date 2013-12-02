<%-- 
    Document   : index
    Created on : 20/11/2013, 11:48:32 PM
    Author     : YangEnrique
--%>


<%@page import="objetos.Usuario"%>
<%@page import="funciones.vidaFacil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

			<h1>Bienvenido, <% out.print(usuario.getUsername()); %></h1>
                        
                        <p>Selecciona una opción del menú a tu izquierda para comenzar.</p>


		</div>
	</div>

    <% } else {
       %>
    	<div id="wrapper">


		<div class="not-sidebar">

			<h1>Usuario incorrecto</h1>
                        
                        <a href="index.jsp">regresar</a>
		</div>
	</div>

<%
    }
%>
</body>
</html>