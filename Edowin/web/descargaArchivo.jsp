<%-- 
    Document   : descargaArchivo
    Created on : 29/11/2013, 08:13:17 PM
    Author     : YangEnrique
--%>

<%@page import="funciones.vidaFacil"%>
<%@page import="objetos.Archivo"%>
<%@page import="java.io.FileInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Descarga</h1>
        <%
            vidaFacil facil = new vidaFacil();
            int id = Integer.parseInt(request.getParameter("id"));
            Archivo archive = facil.obtenArchivo(id);
            String nomFile;
        try{
            nomFile = archive.getUrl();
            FileInputStream archivo = new FileInputStream(nomFile);
            int longitud = archivo.available();
            byte[] datos = new byte[longitud];
            archivo.read(datos);
            archivo.close();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition","attachment;filename="+nomFile);
            ServletOutputStream ouputStream = response.getOutputStream();
            ouputStream.write(datos);
            ouputStream.flush();
            ouputStream.close();
        }catch(Exception e){ 
            e.printStackTrace(); 
        } 
%>
        
    </body>
</html>
