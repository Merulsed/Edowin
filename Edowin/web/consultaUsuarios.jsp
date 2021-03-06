
<%@page import="objetos.Usuario"%>
<%@page import="bd.FunMysql"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<title>Lista de usuarios</title>

	<link rel="stylesheet" type="text/css" href="front-end/adminUI.css">
	<script type="text/javascript" src="front-end/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="front-end/eduwin.js"></script>
</head>
<body>

<%
    try{
        if ((String)session.getAttribute("inicio") == null)
            response.sendRedirect("index.jsp");

    
	String cierto = (String)session.getAttribute("inicio");
	if(cierto != null){
		 Usuario usuario = (Usuario)session.getAttribute("user");

	FunMysql con = new FunMysql();
	con.conectar();
	ResultSet resultados;
	resultados = con.consultarUsuarios();
%>

	<div id="wrapper">

            <%@ include file="sidebar.jsp" %> 

		<div class="not-sidebar">

			<h1>Lista de usuarios</h1>

			<div class="listaUsuarios">
			
				<div class="row header">
					<div class="user id">User ID</div><!-- 
					 --><div class="user username">Username</div><!-- 
					 --><div class="user mail">Mail</div><!-- 
					 --><div class="user nombre">Nombre</div><!-- 
					 --><div class="user apellidoP">Ap. Paterno</div><!-- 
					 --><div class="user apellidoM">Ap. Materno</div><!-- 
					 --><div class="user esAdmin">Admin</div><!-- 
                                         --><div class="user editar">Editar</div><!-- 
				 --></div>

				<%
					try{
						while (resultados.next()) {
							out.print("<div class='row not-header'>");
								out.print("<div class='user id'>");
									out.print(resultados.getBigDecimal("ID"));
								out.print("</div>");
								out.print("<div class='user username'>");
									out.print(resultados.getString("username"));
								out.print("</div>");
								out.print("<div class='user mail'>");
									out.print(resultados.getString("mail"));
								out.print("</div>");
								out.print("<div class='user nombre'>");
									out.print(resultados.getString("nombre"));
								out.print("</div>");
								out.print("<div class='user apellidoP'>");
									out.print(resultados.getString("apellidoP"));
								out.print("</div>");
								out.print("<div class='user apellidoM'>");
									out.print(resultados.getString("apellidoM"));
								out.print("</div>");
								out.print("<div class='user esAdmin'>");
                                                                        if (Boolean.parseBoolean(resultados.getString("esAdmin")) == true)
                                                                            out.print("Admin");
                                                                        else
                                                                            out.print("");
								out.print(  "</div>");
                                                                out.print("<div class='user editar'>");
                                                                    out.print("<a href='editaUsuario3.jsp?ID="+resultados.getInt("ID")+"'>Editar</a>");
                                                                out.print("</div>");
                                                                
							out.print("</div>");
						}
					}
					catch(Exception e){
						 e.printStackTrace();
					}
				%>
                              

			</div>
				
                                <a href="altaUsuario.jsp" class="superboton">Crear usuario</a>
						

		</div>
	</div>


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
