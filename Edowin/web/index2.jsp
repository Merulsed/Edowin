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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
         Usuario usuario = (Usuario)session.getAttribute("user");
%>

        <h1>Index temporal <% out.print(usuario.getUsername()); %></h1>
        <%
        if(usuario.getEsAdmin()){
        %>
        <a href="altaUsuario.jsp">Alta Usuario</a>
        <a href="consultaUsuarios.jsp">Consulta Usuarios</a>
        <% } %>
        <a href="editaUsuario.jsp">Edita usuario</a>
        <a href="subeArchivo.jsp">Alta de Archivos</a>
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