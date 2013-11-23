<%-- 
    Document   : editaUsuario
    Created on : 22/11/2013, 08:48:04 PM
    Author     : YangEnrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edita un usuario</h1><br>
        <form action="editaUsuario2.jsp" method="POST">
            <select name="buscador">
                <option>User Name</option><br>
                <option>Mail</option>
                <option>Nombre</option>
                <option>Apellido Paterno</option>
                <option>Apellido Materno</option>
                <option>Es Administrador</option>
            </select>
            <input type="text" name="valor"><br>
            <input type="submit"><br>
        </form>
    </body>
</html>
