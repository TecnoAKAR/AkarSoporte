
package org.akar.dao;

import java.io.Serializable;
import java.util.Date;

public class MsjForo implements Serializable{
    
    int idMensaje;
    TblUsuario usuario;
    String mensaje;
    Date hora;

    public MsjForo() {
        usuario = new TblUsuario();
    }

    public int getIdMensaje() {
        return idMensaje;
    }

    public void setIdMensaje(int idMensaje) {
        this.idMensaje = idMensaje;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public TblUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUsuario usuario) {
        this.usuario = usuario;
    }
    
}
