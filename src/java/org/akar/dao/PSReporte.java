/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.akar.dao;

/**
 *
 * @author kalid
 */
public class PSReporte {
    
    Reporte reportito;
    TblUsuario usuario;
    TblTipoUsuario tipo;
    
    public PSReporte(Reporte reporte, TblUsuario usuario,TblTipoUsuario tipo ){
        this.reportito=reporte;
        this.usuario=usuario;
        this.tipo=tipo;
    }

    public TblUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(TblUsuario usuario) {
        this.usuario = usuario;
    }

    public Reporte getReportito() {
        return reportito;
    }

    public void setReportito(Reporte reportito) {
        this.reportito = reportito;
    }
    public TblTipoUsuario getTipo() {
        return tipo;
    }

    public void setTipo(TblTipoUsuario tipo) {
        this.tipo = tipo;
    }
    
    
}
