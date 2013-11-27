<%-- 
    Document   : editaUsuario2
    Created on : 23/11/2013, 12:51:28 AM
    Author     : YangEnrique
--%>

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
%>

<% 
    //el objecto con se debe pasar con sessiones miesntars estara asi
  String buscador = request.getParameter("buscador");
  String valor = request.getParameter("valor");
  FunMysql con = new FunMysql();
  con.conectar();
  ResultSet resultados = con.consultaUsuarioPor(buscador, valor);

%>
        <h1>Usuarios Encontrados con los siguientes parametros</h1>
        <form method ="POST" action="editaUsuario3.jsp">
        <table border="1">
            <tr>
                <td>User ID</td>
                <td>Username</td>
                <td>Mail</td>
                <td>Nombre</td>
                <td>Apellido Paterno</td>
                <td>Apellido Materno</td>
                <td>Es Admmin</td>
                <td>Editar</td>
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
                            %>
                            <td><input type="radio" name="ID" value="<% out.print(resultados.getBigDecimal("ID")); %>"></td>
                            <%
                        out.print("</tr>");
                    }
            } catch(Exception e){
                e.printStackTrace();
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
