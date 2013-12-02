<%-- 
    Document   : borrarArchivo
    Created on : 2/12/2013, 12:51:03 AM
    Author     : YangEnrique
--%>

<%@page import="objetos.Usuario"%>
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
            try{
             String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
         Usuario usuario = (Usuario)session.getAttribute("user");
            int id = Integer.parseInt(request.getParameter("id"));
            vidaFacil facil = new vidaFacil();
            Archivo archive = facil.obtenArchivo(id);
            facil.borrarArchivo(archive);
            response.sendRedirect("consultaArchivos2.jsp");
        %>
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
