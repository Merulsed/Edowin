<%-- 
    Document   : iniciosesion
    Created on : 26/11/2013, 10:22:24 PM
    Author     : YangEnrique
--%>

<%@page import="objetos.Usuario"%>
<%@page import="funciones.vidaFacil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    vidaFacil facil = new vidaFacil();
    Usuario user = facil.obtenUsuarioXUsername(username);
    if(user.getID() != 0){
        if(user.getPassword().equals(password)){
            session.setAttribute("user", user);
            session.setAttribute("inicio", "cierto");
            response.sendRedirect("index2.jsp");
        }else{
            session.removeAttribute("user");
            session.removeAttribute("inicio");
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
    }
    else{
        session.removeAttribute("user");
        session.removeAttribute("inicio");
        session.invalidate(); 
        response.sendRedirect("index.jsp");    
    }
        

%>