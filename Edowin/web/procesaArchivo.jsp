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
            String n[] =item.getName().replace("\\","Ç").split("Ç");
            nombreReal=n[n.length-1]; //nombre real del archivo para guardar
            /*item.isFormField() false=input file; true=text field*/
            /*item.isFormField() false=input file; true=text field*/
            if (! item.isFormField()){
                /*cual sera la ruta al archivo en el servidor*/
                File archivo_server = new File("c:/subidos/"+usuario.getUsername()+"/"+nombreReal);
                /*y lo escribimos en el servido*/
                item.write(archivo_server);
                url = "c:/subidos/"+usuario.getUsername()+"/"+nombreReal;
                // out.print("Nombre --> " + item.getName() );
               //  out.print("<br> Tipo --> " + item.getContentType());
                // out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
               //  out.print("<br>");
            }
        }
        
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Procesamiento del archivo</title>

	<link rel="stylesheet" type="text/css" href="front-end/adminUI.css">
	<script type="text/javascript" src="front-end/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="front-end/eduwin.js"></script>
</head>
<body>
    <div class="not-sidebar">

            <h1>Selecciona los atributos del archivo</h1>

            <form method="post" action="altaArchivo.jsp">

                <input type="text" name="nombre" value="<% out.print(nombreReal); %>" class="hidden">
                <input type="text" name="url" value="<% out.print(url); %>" class="hidden">

                <div class="inputbox">
                        <p>Selecciona el tipo del archivo</p>
                        <select name="tipo">
                            <option>Documento</option>
                            <option>Audio</option>
                            <option>Video</option>
                            <option>Foto</option>
                            <option>Otro</option>
                        </select>
                </div>
                <div class="inputbox">
                        <p>¿Es público?</p>
                        <span>Si</span> <input type="radio" name="publico" value="true">
                        <span>No</span> <input type="radio" name="publico" value="false">
                </div>

                <div class="inputbox">
                        <input type="submit" value="Finalizar">
                </div>
                
                
            </form>
            
    </div>
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
