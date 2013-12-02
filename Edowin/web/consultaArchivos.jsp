<%-- 
    Document   : consultaArchivos
    Created on : 1/12/2013, 10:18:11 PM
    Author     : YangEnrique
--%>

<%@page import="java.sql.ResultSet"%>
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
         
         FunMysql con = new FunMysql();
         con.conectar();
         
         if(usuario.getEsAdmin()){
%>
        <h1>Consulta de Archvivos Administrador</h1>
        <table border="1">
            <tr>
                <td>Id</td>
                <td>Nombre</td>
                <td>Tipo</td>
                <td>Publico</td>
                <td>Descargar</td>
                <td>Editar</td>
            </tr>
<%
             try{
             ResultSet resultado = con.consultaArchivos();
                while(resultado.next()){
                    out.print("<tr>");
                    out.print("<td>"+resultado.getInt("idArchivo")+"</td>");
                    out.print("<td>"+resultado.getString("nombre")+"</td>");
                    out.print("<td>"+resultado.getString("tipo")+"</td>");
                    out.print("<td>"+resultado.getString("publico")+"</td>");
                    out.print("<td><a href='descargaArchivo.jsp&id="+resultado.getInt("idArchivo")+"'>Descargar</a></td>");
                    out.print("<td><a href='editaArchivo.jsp&id="+resultado.getInt("idArchivo")+"'>Edita</a></td>");
                    out.print("</tr>");
                 
                }
             }catch(Exception e){
                 e.printStackTrace();
             }
%>
            
<%
             
         }else{
%>
        <h1>Consulta de Archvivos</h1>
        
<%
         }
    }else{
%>
        Usuario incorrecto
        <a href="index.jsp">regresar</a>
<%
    }
%>
    </body>
</html>
