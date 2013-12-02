<%-- 
    Document   : editaArchivo
    Created on : 1/12/2013, 11:14:51 PM
    Author     : YangEnrique
--%>

<%@page import="objetos.Archivo"%>
<%@page import="funciones.vidaFacil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            vidaFacil facil = new vidaFacil();
            Archivo archive = facil.obtenArchivo(id);
        %>
        <h1>Edicion de Archivos</h1>
        <form action="editaArchivo2.jsp" method="POST">
            id no modificar <input type="text" name="idArchivo" value="<% out.print(archive.getIdArchivo()); %>"><br>
            Tipo<select>
                <option>Documento</option>
                <option>Audio</option>
                <option>Video</option>
                <option>Foto</option>
                <option>Otro</option>
            </select>
            <% if(archive.getPublico()==true){ %>
		Si<input type="radio" name="publico" value="true" checked="checked"><br>
		No<input type="radio" name="publico" value="false"><br>
	    <% }else{ %>
		Si<input type="radio" name="publico" value="true"><br>
		No<input type="radio" name="publico" value="false" checked="checked"><br>
	    <% } %>
            <input type="submit">
            <a href="borrarArchivo.jsp?id=<% out.print(archive.getIdArchivo()); %>">Borrar</a>
        </form>
    </body>
</html>
