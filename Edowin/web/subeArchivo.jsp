<%-- 
    Document   : subeArchivo
    Created on : 30/11/2013, 10:16:22 AM
    Author     : YangEnrique
--%>

<%@page import="objetos.Usuario"%>
<%@page import="objetos.Archivo"%>
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
        <h1>Hello World!</h1>
        <form action="procesaArchivo.jsp" method="POST" enctype="multipart/form-data">
            Select file to upload: <input type="file" name="file" /><br>  
            <input type="submit" value="Upload" />
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
