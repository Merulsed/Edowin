<div class="sidebar">   
    <p class="logo"><a class="undecorated" href="index2.jsp">Edowin</a></p>
        <ul class="menu">
                <%
                    
                  if(usuario.getEsAdmin()){ %>
                <li><a href="altaUsuario.jsp">
                        <img src="front-end/img/menu.adduser.png">
                        Crear Usuario
                </a></li>
                <li><a href="consultaUsuarios.jsp">
                        <img src="front-end/img/menu.edituser.png">
                        Administrar Usuarios
                </a></li>
                <% } %>
                <li><a href="subeArchivo.jsp">
                        <img src="front-end/img/menu.addoc.png">
                        Crear Documento
                </a></li>
                <li><a href="consultaArchivos.jsp">
                        <img src="front-end/img/menu.alldocs.png">
                        Documentos P�blicos
                </a></li>
                <li><a href="consultaArchivos2.jsp">
                        <img src="front-end/img/menu.viewdocs.png">
                        Mis Documentos
                </a></li>
                <li><a href="endSession.jsp">
                        <img src="front-end/img/menu.close.png">
                        Cerrar Sesi�n
                </a></li>
        </ul>
        <p class="acerca-de"><a href="">Edowin ESCOM 2013</a></p>
</div>