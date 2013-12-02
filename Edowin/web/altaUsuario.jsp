<%@page import="objetos.Usuario"%>
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
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
         Usuario usuario = (Usuario)session.getAttribute("user");
%>
	<div id="wrapper">

            <%@ include file="sidebar.jsp" %> 

            <div class="not-sidebar">

                    <h1>Crear Usuario</h1>

                    <form method="POST" action="paltaUsuario.jsp">


                            <div class="inputbox">
                                    <p>Nombre de usuario</p>
                                    <input type="text" placeholder="Username" name="UserName">
                            </div>
                            <div class="inputbox">
                                    <p>Password</p>
                                    <input type="text" placeholder="password" name="Password">
                            </div>
                            <div class="inputbox">
                                    <p>Mail</p>
                                    <input type="text" placeholder="e-mail" name="Mail">
                            </div>
                            <div class="inputbox">
                                    <p>Nombre</p>
                                    <input type="text" placeholder="Nombre" name="Nombre">
                            </div>
                            <div class="inputbox">
                                    <p>Apellido Paterno</p>
                                    <input type="text" placeholder="Apellido Paterno" name="ApellidoP">
                            </div>
                            <div class="inputbox">
                                    <p>Apellido Materno</p>
                                    <input type="text" placeholder="Apellido Materno" name="ApellidoM">
                            </div>
                            <div class="inputbox">
                                    <p>¿Es Administrador?</p>
                                    <span>Si</span> <input type="radio" name="EsAdmin" value="true">
                                    <span>No</span> <input type="radio" name="EsAdmin" value="false">
                            </div>
                            <div class="inputbox">
                                    <input type="submit" value="Crear">
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