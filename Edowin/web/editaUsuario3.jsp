<%-- 
    Document   : editaUsuario3
    Created on : 23/11/2013, 11:49:59 PM
    Author     : YangEnrique
--%>

<%@page import="funciones.vidaFacil"%>
<%@page import="objetos.Usuario"%>
<%@page import="java.sql.ResultSet"%>
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
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
         Usuario usuario = (Usuario)session.getAttribute("user");

    //el objecto con se debe pasar con sessiones miesntars estara asi
    int valor = Integer.parseInt(request.getParameter("ID"));
    vidaFacil facil = new vidaFacil();
    Usuario user = facil.obtenUsuario(valor);
    session.setAttribute("usuarioeditado", user);
%>

        <h1>Edicion de Usuario</h1>
        <form action="editaUsuario4.jsp" method="POST">
            <input type="text" name="ID" value="<% out.print(valor); %>">
            Nick <input type="text" name="username" value="<% out.print(user.getUsername()); %>"><br>
            Mail<input type ="text" name="mail" value ="<% out.print(user.getMail()); %>"><br>
            Nombre<input type="text" name="nombre" value="<% out.print(user.getNombre()); %>"><br>
            Apellido Paterno<input type="text" name="apellidoP" value="<% out.print(user.getApellidoP()); %>"><br>
            Apellido Materno <input type="text" name="apellidoM" value="<% out.print(user.getApellidoM()); %>"><br>
            <%
                if(user.getEsAdmin()==true){
                    
            %>
            Es admin <br>
            Si<input type="radio" name="esAdmin" value="true" checked="checked"><br>
            No<input type="radio" name="esAdmin" value="false"><br>
            <%
                }else{
            %>
                Si<input type="radio" name="esAdmin" value="true" checked="checked"><br>
                No<input type="radio" name="esAdmin" value="false" checked="checked"><br>
            <%          
                }    
            %>
            <input type="submit">
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