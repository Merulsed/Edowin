/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package funciones;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

/**
 *
 * @author YangEnrique
 */
public class vidaFacil {
    public void imprimeConsultas(ResultSet result,boolean titulos){
        ResultSetMetaData resultmt;
        int contador;
        try{
            resultmt = result.getMetaData();
            contador = resultmt.getColumnCount();
            
            if(titulos == true){
                
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
