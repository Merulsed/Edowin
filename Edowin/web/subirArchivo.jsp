<%-- 
    Document   : subirArchivo
    Created on : 28/11/2013, 05:34:41 PM
    Author     : YangEnrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Subida de archivos</h1><br>
        <form action="" method="POST" enctype="multipart/form-data">
            Nombre<input type="text" name="nombre"><br>
            Tipo<select name="tipo">
                <option>Texto</option>
                <option>Audio</option>
                <option>Video</option>
            </select><br>
            ArchivoPublico <br>
            Si<input type="radio" name="publico" value="true"><br>
            No<input type="radio" name="publico" value="false"><br>
            Subir<input type="file" name="file"/> <br>
            <input type="submit">
        </form>
    </body>
</html>
