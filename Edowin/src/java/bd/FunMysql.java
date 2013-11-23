/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package bd;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import objetos.Usuario;

/**
 *
 * @author YangEnrique
 */
public class FunMysql {
    Connection con;
    
    public FunMysql conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String BaseDeDatos = "jdbc:mysql://localhost/edowin?user=root&password=n0m3l0s3";
            setCon(DriverManager.getConnection(BaseDeDatos));
            if(getCon() != null){
                System.out.println("Conexion Exitosa!");
            }else{
                System.out.println("Conexion Fallida!");                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this;
    }
    
    public void setCon(Connection con){
        this.con = con;
    }
    
    public Connection getCon(){
        return con;
    }
    
    //Funciones de mysql
    
    public boolean ejecutar(String sql) {
        try {
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeUpdate(sql);
            sentencia.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }        return true;
    }
   
    //Funcion de altas de usuario
    public boolean altaUsuario(Usuario user){
        try{
            //INSERT INTO Usuario (username, password, mail, nombre, esAdmin) VALUES ('ChuckNorris', 'clasico', 'yang.silva.neri@gmail.com', 'Chuck Norris', true);
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeUpdate("INSERT INTO Usuario (username,password,mail,nombre,apellidoP,apellidoM,esAdmin) VALUES ('"+user.getUsername()+"','"+user.getPassword()+"','"+user.getMail()+"','"+user.getNombre()+"','"+user.getApellidoP()+"','"+user.getApellidoM()+"','"+user.getEsAdmin()+"')");
            sentencia.close();
        }
        catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    //Funciond de cambios en usuarios
    public boolean updateUsuario(String campo, Usuario user){
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            if(campo.equals("User Name")){
                sentencia.executeUpdate("UPDATE Usuario SET username = '"+user.getUsername()+"' WHERE ID = '"+user.getID()+"'");
                return true;
            }else if(campo.equals("Password")){
                sentencia.executeUpdate("UPDATE Usuario SET password = '"+user.getPassword()+"' WHERE ID = '"+user.getID()+"'");
                return true;
            }else if(campo.equals("Mail")){
                sentencia.executeUpdate("UPDATE Usuario SET mail = '"+user.getMail()+"' WHERE ID = '"+user.getID()+"'");
                return true;
            }else if(campo.equals("Nombre")){
                sentencia.executeUpdate("UPDATE Usuario SET nombre = '"+user.getNombre()+"' WHERE ID = '"+user.getID()+"'");
                return true;
            }else if(campo.equals("Apellido Paterno")){
                sentencia.executeUpdate("UPDATE Usuario SET apellidoP = '"+user.getApellidoP()+"' WHERE ID = '"+user.getID()+"'");
                return true;
            }else if(campo.equals("Apellido Materno")){
                sentencia.executeUpdate("UPDATE Usuario SET apellidoM = '"+user.getApellidoM()+"' WHERE ID = '"+user.getID()+"'");
                return true;
            }else if(campo.equals("Es Administrador")){
                sentencia.executeUpdate("UPDATE Usuario SET esAdmin = '"+user.getEsAdmin()+"' WHERE ID = '"+user.getID()+"'");
                return true;
            }else{
                return false;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
            return false;
        }
    }
    
    //Funcion de consulta usuarios (todos los usuarios)
    public ResultSet consultarUsuarios() {
        ResultSet resultado;
        try {
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            resultado = sentencia.executeQuery("SELECT * FROM Usuario");
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }        return resultado;
    }
    
    //Fucnion de consulta de Usuario por parametros
    public ResultSet consultaUsuarioPor(String campo, String buscador){
        
        ResultSet resultado;
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            if(campo.equals("User Name")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE username = '"+buscador+"'");
                return resultado;
            }else if(campo.equals("Mail")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE mail = '"+buscador+"'");
                return resultado;
            }else if(campo.equals("Nombre")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE nombre = '"+buscador+"'");
                return resultado;
            }else if(campo.equals("Apellido Paterno")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE apellidop = '"+buscador+"'");
                return resultado;
            }else if(campo.equals("Apellido Materno")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE apellidoM = '"+buscador+"'");
                return resultado;
            }else if(campo.equals("Es Administrador")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE esAdmin = '"+buscador+"'");
                return resultado;
            }else{
                return null;
            }
        } catch(SQLException e){
            e.printStackTrace();
            return null;
        }
        
    }
}
