<%-- 
    Document   : altaArchivo
    Created on : 29/11/2013, 07:29:48 PM
    Author     : YangEnrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload Demo</title>
</head>
<body>
	<center>
		<form method="post" action="procesaArchivo.jsp" enctype="multipart/form-data">
			Select file to upload: 
			<input type="file" name="file" /> 
			<br/><br/> 
			<input type="submit" value="Upload" />
		</form>
	</center>
</body>
</html>
