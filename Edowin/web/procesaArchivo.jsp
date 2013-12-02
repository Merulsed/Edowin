<%-- 
    Document   : procesaArchivo
    Created on : 29/11/2013, 07:49:18 PM
    Author     : YangEnrique
--%>
<%@page import="objetos.Usuario"%>
<%@page import="java.nio.file.Files"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
         Usuario usuario = (Usuario)session.getAttribute("user");
/*FileItemFactory es una interfaz para crear FileItem*/
        FileItemFactory file_factory = new DiskFileItemFactory();
 
        /*ServletFileUpload esta clase convierte los input file a FileItem*/
        ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
        /*sacando los FileItem del ServletFileUpload en una lista */
        List items = servlet_up.parseRequest(request);
        String nombreReal=null;
        String url=null;
       // File carpeta = 
                new File("C:/subidos/"+usuario.getUsername()).mkdirs();
        
        /*if(carpeta.exists()){
            carpeta.mkdir();
        }*/
 
        for(int i=0;i<items.size();i++){
            /*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
            FileItem item = (FileItem) items.get(0);
            String n[] =item.getName().replace("\\","-").split("-");
            nombreReal=n[n.length-1]; //nombre real del archivo para guardar
            /*item.isFormField() false=input file; true=text field*/
            /*item.isFormField() false=input file; true=text field*/
            if (! item.isFormField()){
                /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File("c:/subidos/"+usuario.getUsername()+"/"+nombreReal);
                /*y lo escribimos en el servido*/
                item.write(archivo_server);
                url = "c:/subidos/"+usuario.getUsername()+"/"+nombreReal;
                out.print("Nombre --> " + item.getName() );
                out.print("<br> Tipo --> " + item.getContentType());
                out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
                out.print("<br>");
            }
        }
        
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta del archivo</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post" action="altaArchivo.jsp">
            Nombre no modificar <input type="text" name="nombre" value="<% out.print(nombreReal); %>"><br><br>
            url no modificar <input type="text" name="url" value="<% out.print(url); %>">
        Tipo<select name="tipo">
            <option>Documento</option>
            <option>Audio</option>
            <option>Video</option>
            <option>Otro</option>
        </select>
        Publico<br>
        si<input type="radio" name="publico" value="true"><br>
        No<input type="radio" name="publico" value="false"><br>  
	<input type="submit"/>
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
