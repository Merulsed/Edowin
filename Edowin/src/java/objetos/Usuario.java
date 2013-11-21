/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package objetos;

import java.util.Date;

/**
 *
 * @author YangEnrique
 */
public class Usuario {
    private int ID;
    private String Username;
    private String Password;
    private String Mail;
    private String Nombre;
    private String ApellidoP;
    private String ApellidoM;
    private boolean EsAdmin;
    private Date UltimoAcceso;
    
    public Usuario(String Username,String Password, String Mail, String Nombre, String ApellidoP, String ApellidoM, boolean EsAdmin){
        this.Username = Username;
        this.Password = Password;
        this.Mail = Mail;
        this.Nombre = Nombre;
        this.ApellidoP = ApellidoP;
        this.ApellidoM = ApellidoM;
        this.EsAdmin = EsAdmin;
    }
    
    public int getID(){
        return ID;
    }
    
    public void getID(int ID){
        this.ID = ID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getMail() {
        return Mail;
    }

    public void setMail(String Mail) {
        this.Mail = Mail;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellidoP() {
        return ApellidoP;
    }

    public void setApellidoP(String ApellidoP) {
        this.ApellidoP = ApellidoP;
    }
    
    public String getApellidoM(){
        return ApellidoM;
    }
    
    public void setApellidoM(String ApellidoM){
        this.ApellidoM = ApellidoM;
    }

    public boolean getEsAdmin() {
        return EsAdmin;
    }

    public void setEsAdmin(boolean EsAdmin) {
        this.EsAdmin = EsAdmin;
    }

    public Date getUltimoAcceso() {
        return UltimoAcceso;
    }

    public void setUltimoAcceso(Date UltimoAcceso) {
        this.UltimoAcceso = UltimoAcceso;
    }
}
