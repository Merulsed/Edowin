<%-- 
    Document   : consultaArchivos2
    Created on : 2/12/2013, 12:49:27 AM
    Author     : YangEnrique
--%>

<%@page import="bd.FunMysql"%>
<%@page import="funciones.vidaFacil"%>
<%@page import="objetos.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
         Usuario usuario = (Usuario)session.getAttribute("user");
%>
    <body>
        <h1>Consulta Archivo</h1>
        <table border="1">
            <tr>
                <td>Id</td>
                <td>Nombre</td>
                <td>Tipo</td>
                <td>Publico</td>
                <td>Usuario</td>
                <td>Descargar</td>
                <td>Editar</td>
            </tr>
<%
            FunMysql con = new FunMysql();
            con.conectar();
             try{
             ResultSet resultado = con.consultaArchivoPor("Usuario",String.valueOf(usuario.getID()));
             Usuario user;
             vidaFacil facil = new vidaFacil();
       
                while(resultado.next()){
                    user = facil.obtenUsuario(usuario.getID());
                    out.print("<tr>");
                    out.print("<td>"+resultado.getInt("idArchivo")+"</td>");
                    out.print("<td>"+resultado.getString("nombre")+"</td>");
                    out.print("<td>"+resultado.getString("tipo")+"</td>");
                    out.print("<td>"+resultado.getString("publico")+"</td>");
                    out.print("<td>"+user.getUsername()+"</td>");
                    out.print("<td><a href='descargaArchivo.jsp?id="+resultado.getInt("idArchivo")+"'>Descargar</a></td>");
                    out.print("<td><a href='editaArchivo.jsp?id="+resultado.getInt("idArchivo")+"'>Edita</a></td>");
                    out.print("</tr>");
                 
                }
             }catch(Exception e){
                 e.printStackTrace();
             } 
             %>
         </table>  
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
