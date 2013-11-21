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
        String UserName = user.getUsername();
        String Password = user.getPassword();
        String Mail = user.getMail();
        String Nombre = user.getNombre();
        String ApellidoP = user.getApellidoP();
        String ApellidoM = user.getApellidoM();
        boolean EsAdmin = user.getEsAdmin();
        
        try{
            //INSERT INTO Usuario (username, password, mail, nombre, esAdmin) VALUES ('ChuckNorris', 'clasico', 'yang.silva.neri@gmail.com', 'Chuck Norris', true);
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeUpdate("INSERT INTO Usuario (username,password,mail,nombre,apellidoP,apellidoM,esAdmin) VALUES ('"+UserName+"','"+Password+"','"+Mail+"','"+Nombre+"','"+ApellidoP+"','"+ApellidoM+"','"+EsAdmin+"')");
            sentencia.close();
        }
        catch(SQLException e){
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
}
