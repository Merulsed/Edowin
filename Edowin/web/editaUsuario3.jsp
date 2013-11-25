<%-- 
    Document   : editaUsuario3
    Created on : 23/11/2013, 11:49:59 PM
    Author     : YangEnrique
--%>

<%@page import="objetos.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bd.FunMysql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    //el objecto con se debe pasar con sessiones miesntars estara asi
    String valor = request.getParameter("ID");
    FunMysql con = new FunMysql();
    con.conectar();
    ResultSet resultados = con.consultaUsuarioPor("ID", valor);
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Edicion de Usuario</h1>
        <form action="" method="POST">
            
            <input typr="text" name="nombre"><br>
            <input type ="taxt" name="mail"><br>
            <input type="text" name="nombre"><br>
            <input type="text" name="apelldioP"><br>
            <input type="text" name="apellidoM"><br>
            <input type="radio" name="esAdmin" value="true"><br>
            <input type="radio" name="esAdmin" value="false"><br>
            <input type="submit">
        </form>
    </body>
</html>
