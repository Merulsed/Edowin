<%-- 
    Document   : editaArchivo2
    Created on : 2/12/2013, 12:34:12 AM
    Author     : YangEnrique
--%>

<%@page import="objetos.Archivo"%>
<%@page import="funciones.vidaFacil"%>
<%@page import="bd.FunMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int idArchivo = Integer.parseInt(request.getParameter("idArchivo"));
            boolean publico = Boolean.parseBoolean(request.getParameter("publico"));
            String tipo = request.getParameter("tipo");
            
            FunMysql con = new FunMysql();
            vidaFacil facil = new vidaFacil();
            Archivo archive = facil.obtenArchivo(idArchivo);
            archive.setPublico(publico);
            archive.setTipo(tipo);
            
            con.conectar();
            con.updateArchivo(archive);
            response.sendRedirect("consultaArchivos2.jsp");
            
        %>
    </body>
</html>
