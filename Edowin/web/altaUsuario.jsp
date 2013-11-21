<%-- 
    Document   : altaUsuario
    Created on : 21/11/2013, 12:01:36 AM
    Author     : YangEnrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Alta Usuario</title>
</head>
<body>
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
