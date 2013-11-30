<%-- 
    Document   : eliminaUsuario
    Created on : 30/11/2013, 11:58:39 AM
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
        <%
            String id = request.getParameter("ID");
            out.print(id);
        %>
        <h1>Hello World!</h1>
    </body>
</html>
