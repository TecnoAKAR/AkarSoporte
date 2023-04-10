
package org.akar.dao;

import java.io.Serializable;

public class RelReporteUsuario implements Serializable{
    
    int idRelReporteUsuario;
    Reporte rep;
    TblUsuario user;

    public RelReporteUsuario() {
        this.rep = new Reporte();
        this.user = new TblUsuario();
    }

    public int getIdRelReporteUsuario() {
        return idRelReporteUsuario;
    }

    public void setIdRelReporteUsuario(int idRelReporteUsuario) {
        this.idRelReporteUsuario = idRelReporteUsuario;
    }

    public Reporte getRep() {
        return rep;
    }

    public void setRep(Reporte rep) {
        this.rep = rep;
    }

    public TblUsuario getUser() {
        return user;
    }

    public void setUser(TblUsuario user) {
        this.user = user;
    }

}
