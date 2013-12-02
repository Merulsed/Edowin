
<%@page import="objetos.Usuario"%>
<%@page import="objetos.Archivo"%>
<%@page import="funciones.vidaFacil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<title>Crear Usuario</title>

	<link rel="stylesheet" type="text/css" href="front-end/adminUI.css">
	<script type="text/javascript" src="front-end/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="front-end/eduwin.js"></script>
</head>
<body>


        <%
             try{
                 Usuario usuario = (Usuario)session.getAttribute("user");
                 
    String cierto = (String)session.getAttribute("inicio");
    if(cierto != null){
            int id = Integer.parseInt(request.getParameter("id"));
            vidaFacil facil = new vidaFacil();
            Archivo archive = facil.obtenArchivo(id);
        %>
        
    <div id="wrapper">

            <%@ include file="sidebar.jsp" %> 

            <div class="not-sidebar">

                    <h1>Editar Archivo</h1>
                    
                    
        <form action="editaArchivo2.jsp" method="POST">
          <input type="text" class="hidden" name="idArchivo" value="<% out.print(archive.getIdArchivo()); %>"><br>
            
            <div class="inputbox">
                    <p>Tipo</p>
                    <select>
                        <option>Documento</option>
                        <option>Audio</option>
                        <option>Video</option>
                        <option>Foto</option>
                        <option>Otro</option>
                    </select>
            </div>
            <div class="inputbox">
                <p>¿Es público?</p>
                <% if(archive.getPublico()==true){ %>
                        <p>Si</p>
                        <input type="radio" name="publico" value="true" checked="checked"><br>
                        <p>No</p>
                        <input type="radio" name="publico" value="false"><br>
                <% }else{ %>
                        <p>Si</p>
                        <input type="radio" name="publico" value="true"><br>
                        <p>No</p>
                        <input type="radio" name="publico" value="false" checked="checked"><br>
                <% } %>
            </div>
            <div class="inputbox">
                <a href="borrarArchivo.jsp?id=<% out.print(archive.getIdArchivo()); %>" class="eliminar">Eliminar</a>
                <br>
                  <input type="submit" value="Crear">
            </div>
            </div>
    </div>
        


  <%          }else{
%>
        Usuario incorrecto
        <a href="index.jsp">regresar</a>
<%
    }}catch(Exception e){
        e.printStackTrace();
         response.sendRedirect("index.jsp");
    }
%>
        </form>
    </body>
</html>
