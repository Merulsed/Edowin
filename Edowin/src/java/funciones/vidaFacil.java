/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package funciones;

import bd.FunMysql;
import java.sql.ResultSet;
import objetos.Archivo;
import objetos.Usuario;

/**
 *
 * @author YangEnrique
 */
public class vidaFacil {
    
    //Esta funcion solo sirve tomando en cuanta que no hay username repetidos
    public Usuario obtenUsuario(int ID2){
        int ID=0;
        String username=null;
        String password=null;
        String mail=null;
        String nombre=null;
        String apellidoP=null;
        String apellidoM=null;
        boolean esAdmin=false;
        FunMysql con = new FunMysql();
        con.conectar();
        ResultSet resultado = con.consultaUsuarioPor("ID", String.valueOf(ID2));
        try{
            while(resultado.next()){
                ID = resultado.getInt("ID");
                username = resultado.getString("username");
                password = resultado.getString("password");
                mail = resultado.getString("mail");
                nombre = resultado.getString("nombre");
                apellidoP = resultado.getString("apellidoP");
                apellidoM = resultado.getString("apellidoM");
                esAdmin = Boolean.parseBoolean(resultado.getString("esAdmin"));
            }
            Usuario user = new Usuario(username,mail,nombre,apellidoP,apellidoM,esAdmin);
            user.setID(ID);
            user.setPassword(password);
            return user;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public Usuario obtenUsuarioXUsername(String username2){
        int ID=0;
        String username=null;
        String password=null;
        String mail=null;
        String nombre=null;
        String apellidoP=null;
        String apellidoM=null;
        boolean esAdmin=false;
        FunMysql con = new FunMysql();
        con.conectar();
        ResultSet resultado = con.consultaUsuarioPor("User Name", username2);
        try{
            while(resultado.next()){
                ID = resultado.getInt("ID");
                username = resultado.getString("username");
                password = resultado.getString("password");
                mail = resultado.getString("mail");
                nombre = resultado.getString("nombre");
                apellidoP = resultado.getString("apellidoP");
                apellidoM = resultado.getString("apellidoM");
                esAdmin = Boolean.parseBoolean(resultado.getString("esAdmin"));
            }
            Usuario user = new Usuario(username,mail,nombre,apellidoP,apellidoM,esAdmin);
            user.setID(ID);
            user.setPassword(password);
            return user;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    
    public Archivo obtenArchivo(int idArchivo2){
        int idArchivo=0;
        String nombre=null;
        String tipo=null;
        String url = null;
        boolean publico = false;
        int userid = 0;
        Usuario user = null;
        FunMysql con = new FunMysql();
        con.conectar();
        ResultSet resultado = con.consultaArchivo("Id Archivo", String.valueOf(idArchivo2));
        try{
            while(resultado.next()){
                idArchivo = resultado.getInt("idArchivo");
                nombre = resultado.getString("nombre");
                tipo = resultado.getString("tipo");
                url = resultado.getString("url");
                publico = Boolean.parseBoolean(resultado.getString("publico"));
                userid = resultado.getInt("userID");
            }
            user = obtenUsuario(userid);
            Archivo archive = new Archivo(nombre,tipo, publico);
            archive.setUrl(url);
            archive.setIdArchivo(idArchivo);
            archive.setUser(user);
            return archive;
        }
        catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
