<%-- 
    Document   : editaUsuario
    Created on : 22/11/2013, 08:48:04 PM
    Author     : YangEnrique
--%>

<%@page import="objetos.Usuario"%>
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


        <h1>Edita un usuario</h1><br>
        <form action="editaUsuario2.jsp" method="POST">
            <select name="buscador">
                <option>User Name</option>
                <option>Mail</option>
                <option>Nombre</option>
                <option>Apellido Paterno</option>
                <option>Apellido Materno</option>
                <option>Es Administrador</option>
            </select>
            <input type="text" name="valor"><br>
            <input type="submit"><br>
        </form>
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
