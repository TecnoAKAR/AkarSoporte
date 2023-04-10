
package org.akar.dao;

public class TblTipoUsuario {
    
    int idRelTipoUsuario;
    int idTipo;
    String tipo;

    public TblTipoUsuario() {
    }

    public int getIdRelTipoUsuario() {
        return idRelTipoUsuario;
    }

    public void setIdRelTipoUsuario(int idRelTipoUsuario) {
        this.idRelTipoUsuario = idRelTipoUsuario;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
}
