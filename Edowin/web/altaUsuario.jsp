<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE>

<html>
<head>
	<meta charset="utf-8">
	<title></title>

	<link rel="stylesheet" type="text/css" href="front-end/adminUI.css">
	<script type="text/javascript" src="front-end/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="front-end/eduwin.js"></script>
</head>
<body>

	<div id="wrapper">
		<div class="sidebar">
			<p class="logo">Eduwin</p>
			<ul class="menu">
				<li><a href="">
					<img src="front-end/img/menu.adduser.png">
					Crear Usuario
				</a></li>
				<li><a href="">
					<img src="front-end/img/menu.edituser.png">
					Administrar Usuarios
				</a></li>
				<li><a href="">
					<img src="front-end/img/menu.addoc.png">
					Crear Documento
				</a></li>
				<li><a href="">
					<img src="front-end/img/menu.viewdocs.png">
					Administrar Documentos
				</a></li>
				<li><a href="">
					<img src="front-end/img/menu.settings.png">
					Configuración
				</a></li>
				<li><a href="">
					<img src="front-end/img/menu.close.png">
					Cerrar Sesión
				</a></li>
				<li><a href="">
					<img src="front-end/img/menu.help.png">
					Ayuda
				</a></li>
			</ul>
			<p class="acerca-de"><a href="">Edowin ESCOM 2013</a></p>
		</div>

		<div class="not-sidebar">

			<h1>Crear Usuario</h1>

			<form method="POST" action="paltaUsuario.jsp">


				<div class="inputbox">
					<p>Nombre de usuario</p>
					<input type="text" placeholder="Username" name="UserName">
				</div>
				<div class="inputbox">
					<p>Password</p>
					<input type="text" placeholder="password" name="Password">
				</div>
				<div class="inputbox">
					<p>Mail</p>
					<input type="text" placeholder="e-mail" name="Mail">
				</div>
				<div class="inputbox">
					<p>Nombre</p>
					<input type="text" placeholder="Nombre" name="Nombre">
				</div>
				<div class="inputbox">
					<p>Apellido Paterno</p>
					<input type="text" placeholder="Nombre" name="ApellidoP">
				</div>
				<div class="inputbox">
					<p>Apellido Materno</p>
					<input type="text" placeholder="Nombre" name="ApellidoM">
				</div>
				<div class="inputbox">
					<p>Es Admin</p>
					<span>Si</span> <input type="radio" name="EsAdmin" value="true">
					<span>No</span> <input type="radio" name="EsAdmin" value="false">
				</div>
				<div class="inputbox">
					<input type="submit" value="Crear">
				</div>

			</form>

		</div>
	</div>

</body>
</html>