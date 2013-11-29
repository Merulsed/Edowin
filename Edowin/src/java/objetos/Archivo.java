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
public class Archivo {
    private int idArchivo;
    private String Nombre;
    private String Tipo;
    private int NumPaginas;
    private String Url;
    private int NumDescargas;
    private boolean Publico;
    private Date FechaCreacion;
    private Usuario User;
    
    Archivo(String Nombre, String Tipo, int NumPaginas, String Url, boolean Publico){
        this.Nombre = Nombre;
        this.Tipo = Tipo;
        this.NumPaginas = NumPaginas;
        this.Url = Url;
        this.Publico = Publico;
    }

    public int getIdArchivo() {
        return idArchivo;
    }

    public void setIdArchivo(int idArchivo) {
        this.idArchivo = idArchivo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    public int getNumPaginas() {
        return NumPaginas;
    }

    public void setNumPaginas(int NumPaginas) {
        this.NumPaginas = NumPaginas;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String Url) {
        this.Url = Url;
    }

    public int getNumDescargas() {
        return NumDescargas;
    }

    public void setNumDescargas(int NumDescargas) {
        this.NumDescargas = NumDescargas;
    }

    public boolean getPublico() {
        return Publico;
    }

    public void setPublico(boolean Publico) {
        this.Publico = Publico;
    }

    public Date getFechaCreacion() {
        return FechaCreacion;
    }

    public void setFechaCreacion(Date FechaCreacion) {
        this.FechaCreacion = FechaCreacion;
    }

    public Usuario getUser() {
        return User;
    }

    public void setUser(Usuario User) {
        this.User = User;
    }
}
