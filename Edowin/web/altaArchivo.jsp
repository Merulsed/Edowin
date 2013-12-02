<%-- 
    Document   : altaArchivo
    Created on : 29/11/2013, 07:29:48 PM
    Author     : YangEnrique
--%>

<%@page import="bd.FunMysql"%>
<%@page import="objetos.Archivo"%>
<%@page import="objetos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Subida de Archvio</title>
</head>
<body>
<%
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
         Usuario usuario = (Usuario)session.getAttribute("user");
         String nombre = request.getParameter("nombre");
         String tipo = request.getParameter("tipo");
         String url = request.getParameter("url");
         boolean publico = Boolean.parseBoolean(request.getParameter("publico"));
         
         Archivo archive = new Archivo(nombre,tipo,publico);
         archive.setUrl(url);
         archive.setUser(usuario);
         
         FunMysql con = new FunMysql();
         con.conectar();
         con.altaArchivo(archive);
         
        // Redirección automática
        String site = new String("menuArchivos.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);


         
    }else{
%>
        Usuario incorrecto
        <a href="index.jsp">regresar</a>
<%
    }
%>
</body>
</html>
