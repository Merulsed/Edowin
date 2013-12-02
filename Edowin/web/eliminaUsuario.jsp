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
            try{
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
            int id = Integer.parseInt(request.getParameter("ID"));
            vidaFacil facil = new vidaFacil();
            Usuario user = facil.obtenUsuario(id);
            FunMysql con = new FunMysql();
            con.conectar();
            facil.borrarArchivoUsuario(user);
            con.deleteUsuario(user);
            
            // Redirección automática
            String site = new String("consultaUsuarios.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
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
            
        %>
    </body>
</html>
