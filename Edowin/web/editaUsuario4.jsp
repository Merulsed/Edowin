<%-- 
    Document   : editaUsuario4
    Created on : 25/11/2013, 12:54:15 AM
    Author     : YangEnrique
--%>

<%@page import="bd.FunMysql"%>
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
    int ID = Integer.parseInt(request.getParameter("ID"));
    String username = request.getParameter("username");
    String mail = request.getParameter("mail");
    String nombre = request.getParameter("nombre");
    String apellidoP = request.getParameter("apellidoP");
    String apellidoM = request.getParameter("apellidoM");
    boolean esAdmin = Boolean.parseBoolean(request.getParameter("esAdmin"));
    
    //El suaro para se correcto deberia ser creado en la clase anterior y ser pasado
    // con sessions pero ya se vera si da tiempo lol

    Usuario user = new Usuario(username,mail,nombre,apellidoP,apellidoM,esAdmin);
    user.setID(ID);
    FunMysql con = new FunMysql();
    con.conectar();
    con.updateUsuario(user);
%>

        <h1>Exito</h1>
        <a href="index2.jsp">volver</a>
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