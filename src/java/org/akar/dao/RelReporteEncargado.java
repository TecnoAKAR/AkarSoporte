package org.akar.dao;

import java.io.Serializable;

public class RelReporteEncargado implements Serializable {

    int idRel;
    TblUsuario encargado;
    Reporte rep;

    public RelReporteEncargado() {
        encargado = new TblUsuario();
        rep = new Reporte();
    }

    public int getIdRel() {
        return idRel;
    }

    public void setIdRel(int idRel) {
        this.idRel = idRel;
    }

    public TblUsuario getEncargado() {
        return encargado;
    }

    public void setEncargado(TblUsuario encargado) {
        this.encargado = encargado;
    }

    public Reporte getRep() {
        return rep;
    }

    public void setRep(Reporte rep) {
        this.rep = rep;
    }
    
}
