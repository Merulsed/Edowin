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
import objetos.Archivo;
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
    public boolean updateUsuario(Usuario user){
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeUpdate("UPDATE Usuario SET username='"+user.getUsername()+"', mail='"+user.getMail()+"', nombre='"+user.getNombre()+"', apellidoP='"+user.getApellidoP()+"', apellidoM='"+user.getApellidoM()+"', esAdmin='"+user.getEsAdmin()+"' WHERE ID='"+user.getID()+"'");
        }
        catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    //Funcion de eliminacion de usuarios
    public boolean deleteUsuario(Usuario user){
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeQuery("DELETE FROM Usuario WHERE ID = '"+user.getID()+"'");
        } catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
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
    public ResultSet consultaUsuarioPor(String buscador, String valor){
        
        ResultSet resultado;
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            if(buscador.equals("ID")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE ID = '"+valor+"'");
                return resultado;
            } else if(buscador.equals("User Name")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE username = '"+valor+"'");
                return resultado;
            }else if(buscador.equals("Mail")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE mail = '"+valor+"'");
                return resultado;
            }else if(buscador.equals("Nombre")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE nombre = '"+valor+"'");
                return resultado;
            }else if(buscador.equals("Apellido Paterno")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE apellidop = '"+valor+"'");
                return resultado;
            }else if(buscador.equals("Apellido Materno")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE apellidoM = '"+valor+"'");
                return resultado;
            }else if(buscador.equals("Es Administrador")){
                resultado = sentencia.executeQuery("SELECT * FROM Usuario WHERE esAdmin = '"+valor+"'");
                return resultado;
            }else{
                return null;
            }
        } catch(SQLException e){
            e.printStackTrace();
            return null;
        }
        
    }
    
    //Empiezan las funciones con los archivos 
    //Alta de archivos
    public boolean altaArchivo(Archivo archives){
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeUpdate("INSERT INTO Archivo (nombre, tipo, url, publico) VALUES ('"+archives.getNombre()+"','"+archives.getTipo()+"','"+archives.getUrl()+"','"+archives.getPublico()+"')");
            sentencia.close();
        }
        catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    //Update en los Archivos
    public boolean updateArchivo(Archivo archive){
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeUpdate("UPDATE Archivo SET nombre='"+archive.getNombre()+"', tipo='"+archive.getTipo()+"', url='"+archive.getUrl()+"', publico='"+archive.getPublico()+"', userID='"+archive.getUser().getID()+"'");
        }
        catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    //Delete en los archivos
    public boolean deleteArchivo(Archivo archive){
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeQuery("DELETE FROM Archivo WHERE idArchivo = '"+archive.getIdArchivo()+"'");
        } catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    //Consulta de archvios
    public ResultSet consultaArchivos(){
        ResultSet resultado;
        try {
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            resultado = sentencia.executeQuery("SELECT * FROM Archivos");
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }        return resultado;
    }
    
    //Consulta de archivos por parametros
    public ResultSet consultaArchivo(String buscador, String valor){
         ResultSet resultado;
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            if(buscador.equals("Id Archivo")){
                resultado = sentencia.executeQuery("SELECT * FROM Archivo WHERE idArchivo = '"+valor+"'");
                return resultado;
            } else if(buscador.equals("Nombre")){
                resultado = sentencia.executeQuery("SELECT * FROM Archivo WHERE nombre = '"+valor+"'");
                return resultado;
            }else if(buscador.equals("Tipo")){
                resultado = sentencia.executeQuery("SELECT * FROM Archivo WHERE tipo = '"+valor+"'");
                return resultado;
            }else if(buscador.equals("Publico")){
                resultado = sentencia.executeQuery("SELECT * FROM Archivo WHERE publico = '"+valor+"'");
                return resultado;
            }else if(buscador.equals("Usuario")){
                resultado = sentencia.executeQuery("SELECT * FROM Archivo WHERE userID = '"+valor+"'");
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
