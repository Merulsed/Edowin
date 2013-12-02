<%-- 
    Document   : index
    Created on : 20/11/2013, 11:48:32 PM
    Author     : YangEnrique
--%>


<%@page import="objetos.Usuario"%>
<%@page import="funciones.vidaFacil"%>
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
    try{
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
         Usuario usuario = (Usuario)session.getAttribute("user");
%>

	<div id="wrapper">

            <%@ include file="sidebar.jsp" %> 
            
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
    }}catch(Exception e){
        e.printStackTrace();
         response.sendRedirect("index.jsp");
    }
%>
</body>
</html>