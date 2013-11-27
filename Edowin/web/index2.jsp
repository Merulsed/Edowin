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
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String inicio = (String)session.getAttribute("inicio");
    
    vidaFacil facil = new vidaFacil();
    Usuario user = facil.obtenUsuario(username);
    if(inicio != null){
        if(user.getPassword().equals(password)){
            session.setAttribute("user", user);
            session.setAttribute("inicio", "cierto");
%>

        <h1>Index temporal</h1>
        <a href="altaUsuario.jsp">Alta Usuario</a>
        <a href="consultaUsuarios.jsp">Consulta Usuarios</a>
        <a href="editaUsuario.jsp">Edita usuario</a>
    </body>
</html>
<%  }
    } else{
%>
        Usuario incorrecto
        <a href="index.jsp">regresar</a>
<%
    }
%>
    </body>
</html>