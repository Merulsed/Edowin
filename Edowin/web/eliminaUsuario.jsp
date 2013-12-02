<%-- 
    Document   : eliminaUsuario
    Created on : 30/11/2013, 11:58:39 AM
    Author     : YangEnrique
--%>

<%@page import="bd.FunMysql"%>
<%@page import="objetos.Usuario"%>
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
            int id = Integer.parseInt(request.getParameter("ID"));
            vidaFacil facil = new vidaFacil();
            Usuario user = facil.obtenUsuario(id);
            FunMysql con = new FunMysql();
            con.conectar();
            con.deleteArchivoUsuario(user);
            con.deleteUsuario(user);
            
        %>
        <h1>Usuario ELiminado con exito</h1>
        <a href="index2.jsp">Regresar</a>
    </body>
</html>
