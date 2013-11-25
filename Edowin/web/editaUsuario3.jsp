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
        <form action="editaUsuario4.jsp" method="POST">
            <%
                try{
                    while(resultados.next()){
                        out.print("<h1>Username: "+resultados.getString("username")+"</h1><br>");
            %>
                Nick <input type="text" name="username" value="<% out.print(resultados.getString("username")); %>"><br>
                Mail<input type ="taxt" name="mail" value ="<% out.print(resultados.getString("mail")); %>"><br>
                Nombre<input type="text" name="nombre" value="<% out.print(resultados.getString("nombre")); %>"><br>
                Apellido Paterno<input type="text" name="apellidoP" value="<% out.print(resultados.getString("apellidoP")); %>"><br>
                Apellido Materno <input type="text" name="apellidoM" value="<% out.print(resultados.getString("apellidoM")); %>"><br>
                <%
                        if(resultados.getString("esAdmin").equals("true")){
                    
                %>
                Es admin <br>
                Si<input type="radio" name="esAdmin" value="true" checked="checked"><br>
                No<input type="radio" name="esAdmin" value="false"><br>
                <%
                        }else{
                %>
                Si<input type="radio" name="esAdmin" value="true" checked="checked"><br>
                No<input type="radio" name="esAdmin" value="false" checked="checked"><br>
            <%          }
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }
            %>
            <input type="submit">
        </form>
    </body>
</html>
