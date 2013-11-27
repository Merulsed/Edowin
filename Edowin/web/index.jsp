<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE>
<%
    session.setAttribute("inicio", "cierto");
%>
<html>
<head>
	<meta charset="utf-8">
	<title></title>

	<link rel="stylesheet" type="text/css" href="front-end/adminUI.css">
	<script type="text/javascript" src="front-end/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="front-end/eduwin.js"></script>
</head>
<body>

	<div id="wrapper" class="loginwrapper">
		<div class="login">
			<h1>Inicia Sesión</h1>
			<form class="width1" method="POST" action="iniciosesion.jsp">
				<div class="inputbox">
					<input type="text" placeholder="Nombre de Usuario" name="username">
				</div>
				<br>
				<div class="inputbox">
					<input type="password" placeholder="Password" name="password">
				</div>
				<div class="inputbox">
					<input type="submit" value="Entrar">
				</div>
			</form>
		</div>
	</div>

</body>
</html>