/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.akar.helper;

import java.io.Serializable;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.PSReporte;
import org.akar.dao.Reporte;
import org.akar.dao.ReporteCambios;
import org.akar.dao.TblTipoUsuario;
import org.akar.dao.TblUsuario;
import org.akar.service.ReporteGerenteMService;
import org.akar.service.ReporteGerenteService;

/**
 *
 * @author kalid
 */
public class ReporteGerenteMHelper implements Serializable{
    
    private List<Reporte> reporte;
    private List<Reporte> historial;
    private List<TblUsuario> ing;
    private List<TblUsuario> gen;
    Reporte reportito;
    TblUsuario usuario;
    ReporteCambios repCam;
    PSReporte psrep;

    public ReporteGerenteMHelper() {
    }
    
    
        public Reporte getById(HttpServletRequest par){
        Reporte rep= new Reporte();
        rep.setIdReporte( Integer.parseInt(par.getParameter("idreporte")) );
        
        if(rep.getIdReporte() == 0){
            return null;
        }
        
        Reporte report = new ReporteGerenteMService().getById(rep);
        if(report != null){
            return report;
        } else{
            return null;
        }
    }
        
    public boolean AsignarReporteIng(HttpServletRequest request){
        psrep= new PSReporte(new Reporte(), new TblUsuario(), new TblTipoUsuario());
        psrep.getReportito().setEstatus(request.getParameter("Estatus"));
        psrep.getUsuario().setNomUser(request.getParameter("idEncargado"));
        psrep.getReportito().setProblema(request.getParameter("Problema"));
        
        if(psrep.getUsuario().getNomUser().length() == 0 || psrep.getUsuario().getNomUser()== null){
            return false;
        }
        if(psrep.getReportito().getEstatus().length()==0||psrep.getReportito().getEstatus()== null){
            return false;
        }
        if(psrep.getReportito().getProblema().length() == 0 || psrep.getReportito().getProblema()== null){
            return false;
        }
        if(psrep.getReportito().getEstatus().equals("A Mantenimiento")){
            return false;
        }
        if(psrep.getReportito().getEstatus().equals("En Mantenimiento") && psrep.getUsuario().getNomUser().equals("KALID")){
            return false;
        }
        if(psrep.getReportito().getEstatus().equals("Mantenimiento Finalizado") && psrep.getUsuario().getNomUser().equals("RODRIO VIDAL")){
            return false;
        }
        
        return new ReporteGerenteMService().AsignarReporteIng(psrep.getUsuario(), psrep.getReportito());
        
    }
        public boolean AsignarReporteSop(HttpServletRequest request){
        psrep= new PSReporte(new Reporte(), new TblUsuario(),new TblTipoUsuario());
        
        psrep.getReportito().setEstatus(request.getParameter("Estatus"));
        psrep.getUsuario().setNomUser(request.getParameter("idEncargado"));
        psrep.getReportito().setProblema(request.getParameter("Problema"));
        psrep.getReportito().setSolucion(request.getParameter("Solucion"));
        
        if(psrep.getUsuario().getNomUser().length() == 0 || psrep.getUsuario().getNomUser()== null){
            return false;
        }
        if(psrep.getReportito().getEstatus().length()==0||psrep.getReportito().getEstatus()== null){
            return false;
        }
        if(psrep.getReportito().getProblema().length() == 0 || psrep.getReportito().getProblema()== null){
            return false;
        }
        if(psrep.getReportito().getSolucion().length() == 0 || psrep.getReportito().getSolucion()== null){
            return false;
        }
        if(psrep.getReportito().getEstatus().equals("A Mantenimiento")){
            return false;
        }
        if(psrep.getReportito().getEstatus().equals("En Mantenimiento") && psrep.getUsuario().getNomUser().equals("KALID")){
            return false;
        }
        if(psrep.getReportito().getEstatus().equals("Mantenimiento Finalizado") && psrep.getUsuario().getNomUser().equals("RODRIO VIDAL")){
            return false;
        }
        
        return new ReporteGerenteMService().AsignarReporteSop(psrep.getUsuario(), psrep.getReportito());
        
    }
    
    
    public boolean loadList(){
        reporte= ReporteGerenteMService.getListReporte();
        return reporte!=null && reporte.size()>0;
    }
    
    public List<Reporte>getList(){
        if(reporte==null || reporte.size()==0){
            if(!loadList()){
                return null;
            }
        }
        return reporte;
    }
    
    public void setList(List<Reporte> reporte){
        this.reporte=reporte;
    }
    

    public boolean loadlist2(){
        ing = ReporteGerenteMService.getListIng();
        return ing != null && ing.size()>0;
}
    public List<TblUsuario>getlist(){
        if(ing==null || ing.size()==0){
            if(!loadlist2()){
                return null;
            }
        }
        return ing;
    }
    
    public void setlist(List<TblUsuario> ing){
        this.ing=ing;
    }
    public boolean loadlist3(){
        gen = ReporteGerenteMService.getListGer();
        return gen != null && gen.size()>0;
}
    public List<TblUsuario>getlist2(){
        if(gen==null || gen.size()==0){
            if(!loadlist3()){
                return null;
            }
        }
        return gen;
    }
    
    public void setlist2(List<TblUsuario> gen){
        this.gen=gen;
    }
    public boolean loadlist4(){
        historial = ReporteGerenteMService.getListHistorial();
        return historial != null && historial.size()>0;
}
    public List<Reporte>getlist4(){
        if(historial==null || historial.size()==0){
            if(!loadlist4()){
                return null;
            }
        }
        return historial;
    }
       public void setlist4(List<Reporte> historial){
        this.historial=historial;
    }
}