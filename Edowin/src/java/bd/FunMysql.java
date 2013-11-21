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
            String BaseDeDatos = "jdbc:mysql://localhost/?user=root&password=''";
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
    
    public boolean altaUsuario(Usuario user){
        String UserName = user.getUsername();
        String Password = user.getPassword();
        String Mail = user.getPassword();
        String Nombre = user.getNombre();
        String ApellidoP = user.getApellidoP();
        String ApellidoM = user.getApellidoM();
        boolean EsAdmin = user.getEsAdmin();
        
        try{
            Statement sentencia = getCon().createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
            sentencia.executeQuery("INSERT INTO Usuario (username,password,mail,apellidop,apellidom,esAdmin) VALUES ('"+UserName+"','"+Password+"','"+Mail+"','"+Nombre+"','"+ApellidoP+"','"+ApellidoM+"','"+EsAdmin+"')");
            sentencia.close();
        }
        catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
