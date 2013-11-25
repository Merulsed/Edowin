<%-- 
    Document   : paltaUsuario
    Created on : 21/11/2013, 12:02:16 AM
    Author     : YangEnrique
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="bd.FunMysql"%>
<%@page import="objetos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	//Aqui se procesan las altas
	String UserName = request.getParameter("UserName");
	String Password = request.getParameter("Password");
	String Mail = request.getParameter("Mail");
	String Nombre = request.getParameter("Nombre");
	String ApellidoP = request.getParameter("ApellidoP");
	String ApellidoM = request.getParameter("ApellidoM");
	boolean EsAdmin = Boolean.parseBoolean(request.getParameter("EsAdmin"));

	Usuario user = new Usuario(UserName,Mail,Nombre,ApellidoP,ApellidoM,EsAdmin);
        user.setPassword(Password);
        FunMysql con = new FunMysql();
        con.conectar();
        boolean hola = con.altaUsuario(user);
        
        
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <%
                if(hola == true)
                    out.print("Usuario registrado con exito");
                else
                    out.print("Fallo al registrar usuario");             
            %>
            <a href="index.jsp">regresar</a>
        </h1>
    </body>
</html>
