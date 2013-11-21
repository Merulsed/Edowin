<%-- 
    Document   : consultaUsuarios
    Created on : 21/11/2013, 09:08:59 AM
    Author     : YangEnrique
--%>

<%@page import="bd.FunMysql"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    FunMysql con = new FunMysql();
    con.conectar();
    ResultSet resultados;
    resultados = con.consultarUsuarios();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Usuarios de la base</h1>
        <table border="1">
            <tr>
                <td>User ID</td>
                <td>Username</td>
                <td>Mail</td>
                <td>Nombre</td>
                <td>Apellido Paterno</td>
                <td>Apellido Materno</td>
                <td>Es Admmin</td>
            </tr>
            <%
                try{
                    while (resultados.next()) {
                        out.print("<tr>");
                            out.print("<td>");
                                out.print(resultados.getBigDecimal("ID"));
                            out.print("</td>");
                            out.print("<td>");
                                out.print(resultados.getString("username"));
                            out.print("</td>");
                            out.print("<td>");
                                out.print(resultados.getString("mail"));
                            out.print("</td>");
                            out.print("<td>");
                                out.print(resultados.getString("nombre"));
                            out.print("</td>");
                            out.print("<td>");
                                out.print(resultados.getString("apellidoP"));
                            out.print("</td>");
                            out.print("<td>");
                                out.print(resultados.getString("apellidoM"));
                            out.print("</td>");
                            out.print("<td>");
                                out.print(resultados.getString("esAdmin"));
                            out.print("</td>");
                        out.print("</tr>");
                    }
                }
                catch(Exception e){
                     e.printStackTrace();
                }
            %>
        </table>
    </body>
</html>
