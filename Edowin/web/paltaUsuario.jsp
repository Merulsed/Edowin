<%-- 
    Document   : paltaUsuario
    Created on : 21/11/2013, 12:02:16 AM
    Author     : YangEnrique
--%>

<%@page import="funciones.vidaFacil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bd.FunMysql"%>
<%@page import="objetos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try{
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
         Usuario usuario = (Usuario)session.getAttribute("user");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
	//Aqui se procesan las altas
	String UserName = request.getParameter("UserName");
	String Password = request.getParameter("Password");
	String Mail = request.getParameter("Mail");
	String Nombre = request.getParameter("Nombre");
	String ApellidoP = request.getParameter("ApellidoP");
	String ApellidoM = request.getParameter("ApellidoM");
	boolean EsAdmin = Boolean.parseBoolean(request.getParameter("EsAdmin"));
        vidaFacil facil = new vidaFacil();
        if(facil.checaUsuario(UserName)){
            Usuario user = new Usuario(UserName,Mail,Nombre,ApellidoP,ApellidoM,EsAdmin);
            user.setPassword(Password);
            FunMysql con = new FunMysql();
            con.conectar();
            boolean hola = con.altaUsuario(user);
        
        
%>

        <h1>
            <%
                if(hola == true) {
                    // Redirección automática
                    String site = new String("consultaUsuarios.jsp");
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                }
                else
                    out.print("Fallo al registrar usuario");  
                response.sendRedirect("consultaUsuarios.jsp"); 
        }else{
            response.sendRedirect("altaUsuario.jsp");
        }
            %>
        </h1>
<%
    }else{
%>
        Usuario incorrecto
        <a href="index.jsp">regresar</a>
<%
    }}catch(Exception e){
        e.printStackTrace();
         response.sendRedirect("index.jsp");
    }
%>
</body>
</html>