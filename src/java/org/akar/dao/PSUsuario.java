
package org.akar.dao;

public class PSUsuario {
    
    int idRelTipUs;
    TblUsuario usuario;
    TblTipoUsuario tipo;

    public PSUsuario(TblUsuario usuario, TblTipoUsuario tipo) {
        this.usuario = usuario;
        this.tipo = tipo;
    }
    public int getIdRelTipUs() {
        return idRelTipUs;
    }

    public void setIdRelTipUs(int idRelTipUs) {
        this.idRelTipUs = idRelTipUs;
    }
    
    public TblUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUsuario usuario) {
        this.usuario = usuario;
    }
    
    public TblTipoUsuario getTipo() {
        return tipo;
    }

    public void setTipo(TblTipoUsuario tipo) {
        this.tipo = tipo;
    }
    
}
