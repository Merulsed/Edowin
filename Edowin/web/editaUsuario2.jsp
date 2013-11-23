<%-- 
    Document   : editaUsuario2
    Created on : 23/11/2013, 12:51:28 AM
    Author     : YangEnrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
  String buscador = request.getParameter("buscador");
  String valor = request.getParameter("valor");
  
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            out.print(buscador);
        %>
        <h1>Editacion de usuario</h1>
        <form method = "POST" action = "paltaUsuario.jsp">
		User Name<input type="text" name="UserName"><br>
		Password<input type="text" name="Password"><br>
		Mail<input type="text" name="Mail"><br>
		Nombre<input type="text" name="Nombre"><br>
		Apellido Paterno<input type="text" name="ApellidoP"><br>
		Apellido Materno<input type="text" name="ApellidoM"><br>
		Es Admin<br>
		Si<input type="radio" name="EsAdmin" value="true"><br>
		No<input type="radio" name="EsAdmin" value="false"><br>
		<input type="submit">
	</form>
    </body>
</html>
