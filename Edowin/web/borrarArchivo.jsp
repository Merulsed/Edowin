<%-- 
    Document   : borrarArchivo
    Created on : 2/12/2013, 12:51:03 AM
    Author     : YangEnrique
--%>

<%@page import="objetos.Archivo"%>
<%@page import="funciones.vidaFacil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            vidaFacil facil = new vidaFacil();
            Archivo archive = facil.obtenArchivo(id);
            facil.borrarArchivo(archive);
            response.sendRedirect("consultaArchivos2.jsp");
        %>
    </body>
</html>
