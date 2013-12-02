<%-- 
	Document   : consultaUsuarios
	Created on : 21/11/2013, 09:08:59 AM
	Author     : YangEnrique
--%>

<%@page import="objetos.Usuario"%>
<%@page import="bd.FunMysql"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<title>Lista de usuarios</title>

	<link rel="stylesheet" type="text/css" href="front-end/adminUI.css">
	<script type="text/javascript" src="front-end/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="front-end/eduwin.js"></script>
</head>
<body>

<%
	String cierto = (String)session.getAttribute("inicio");
	if(cierto != null){
		 Usuario usuario = (Usuario)session.getAttribute("user");

	FunMysql con = new FunMysql();
	con.conectar();
	ResultSet resultados;
	resultados = con.consultarUsuarios();
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

			<h1>Lista de usuarios</h1>

			<div class="listaUsuarios">
			
				<div class="row header">
					<div class="user id">User ID</div><!-- 
					 --><div class="user username">Username</div><!-- 
					 --><div class="user mail">Mail</div><!-- 
					 --><div class="user nombre">Nombre</div><!-- 
					 --><div class="user apellidoP">Ap. Paterno</div><!-- 
					 --><div class="user apellidoM">Ap. Materno</div><!-- 
					 --><div class="user esAdmin">Admin</div><!-- 
                                         --><div class="user editar">Editar</div><!-- 
				 --></div>

                            <form method="post" action="editaUsuario3.jsp">
				<%
					try{
						while (resultados.next()) {
							out.print("<div class='row not-header'>");
								out.print("<div class='user id'>");
									out.print(resultados.getBigDecimal("ID"));
								out.print("</div>");
								out.print("<div class='user username'>");
									out.print(resultados.getString("username"));
								out.print("</div>");
								out.print("<div class='user mail'>");
									out.print(resultados.getString("mail"));
								out.print("</div>");
								out.print("<div class='user nombre'>");
									out.print(resultados.getString("nombre"));
								out.print("</div>");
								out.print("<div class='user apellidoP'>");
									out.print(resultados.getString("apellidoP"));
								out.print("</div>");
								out.print("<div class='user apellidoM'>");
									out.print(resultados.getString("apellidoM"));
								out.print("</div>");
								out.print("<div class='user esAdmin'>");
                                                                        if (Boolean.parseBoolean(resultados.getString("esAdmin")) == true)
                                                                            out.print("Admin");
                                                                        else
                                                                            out.print("");
								out.print(  "</div>");
                                                                out.print("<div class='user editar'>");
                                                                    out.print("<input type='radio' name='ID' value='"+resultados.getInt("ID")+"'>");
                                                                out.print("</div>");
                                                                
							out.print("</div>");
						}
					}
					catch(Exception e){
						 e.printStackTrace();
					}
				%>
                                <br><br><br><br>
                                <input type="submit" value="Editar usuario seleccionado" class="">
                            </form>

			</div>
				

						

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
