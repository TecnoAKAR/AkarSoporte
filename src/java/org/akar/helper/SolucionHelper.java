
package org.akar.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.RelReporteEncargado;
import org.akar.dao.RelReporteUsuario;
import org.akar.dao.ReporteCambios;
import org.akar.dao.Reporte;
import org.akar.dao.TblUsuario;
import org.akar.service.SolucionService;

public class SolucionHelper {
    
    Reporte rep;
    ReporteCambios repCam;
    TblUsuario usu;
    
    public SolucionHelper(){
        rep = new Reporte();
        repCam = new ReporteCambios();
        usu = new TblUsuario();
    }
    
    public List<RelReporteEncargado> getList(){
        
        List<RelReporteEncargado> list = new SolucionService().getList();
        if(list != null){
            return list;
        } else{
            return null;
        }
    }
    
    public RelReporteUsuario getById(HttpServletRequest par){
        rep.setIdReporte( Integer.parseInt(par.getParameter("idreporte")) );
        
        if(rep.getIdReporte() == 0){
            return null;
        }
        
        RelReporteUsuario report = new SolucionService().getById(rep);
        if(report != null){
            return report;
        } else{
            return null;
        }
    }
    
    public String sp_Soporte(HttpServletRequest par){
        Date fecha = new Date();
        rep.setIdReporte( Integer.parseInt(par.getParameter("idRep")) );
        rep.setEstatus( par.getParameter("estat") );
        rep.setSolucion( par.getParameter("sol") );
        rep.setFechaF( fecha );
        repCam.setEstatusI( par.getParameter("estatI") );
        repCam.setFechaCambio( fecha );
        usu.setIdUsuario( Integer.parseInt(par.getParameter("idIng")) );
        
        if(repCam.getEstatusI() == null ||  repCam.getEstatusI().length() == 0){
            return "Estatus inicial inválido";
        }
        if(repCam.getFechaCambio() == null ){
            return "Fecha de cambio nula";
        }
        if(usu.getIdUsuario() == 0 ){
            return "ID del usuario inválida";
        }
        if(rep.getIdReporte()== 0){
            return "ID del reporte inválida";
        }
        if(rep.getSolucion() == null || rep.getSolucion().length() > 1024 || rep.getSolucion().length() == 0 || rep.getSolucion().equals(" ")){
            return "Solución inválida";
        }
        if(rep.getEstatus().equals( repCam.getEstatusI() )){
            return "Debe cambiar el estatus para continuar";
        }
        if(rep.getFechaF() == null ){
            return "Fecha final inválida";
        }
        
        return new SolucionService().sp_Soporte(rep, usu, repCam);
    }
    
}
