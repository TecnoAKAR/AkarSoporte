
package org.akar.dao;

import java.io.Serializable;

public class PSResPass implements Serializable{
    
    TblUsuario usuario;
    ResPass resPass;

    public PSResPass() {
        this.usuario = new TblUsuario();
        this.resPass = new ResPass();
    }

    public TblUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUsuario usuario) {
        this.usuario = usuario;
    }

    public ResPass getResPass() {
        return resPass;
    }

    public void setResPass(ResPass resPass) {
        this.resPass = resPass;
    }
    
}
