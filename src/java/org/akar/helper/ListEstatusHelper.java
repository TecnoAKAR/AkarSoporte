/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.akar.helper;

import java.io.Serializable;
import static java.lang.Integer.getInteger;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.Reporte;
import org.akar.dao.ReporteCambios;
import org.akar.service.ListEstatusService;
import org.akar.service.SolucionService;

public class ListEstatusHelper implements Serializable {
    private List<ReporteCambios>list;
    private ReporteCambios registro;
    public Date getDate( String campo )
    {
        DateFormat dateFormat = null;
        try 
        {
            if( campo == null || campo.length() == 0 )
            {
                return null;
            }
            dateFormat = new SimpleDateFormat( "yyyy-MM-dd" );
            return dateFormat.parse(campo);
        } 
        catch (ParseException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    public boolean loadList( )
    {
        list = ListEstatusService.getEstatusCService();
        return list != null && list.size() > 0;
    }
    public List<ReporteCambios> getList()
    {
        if( list == null || list.size( )== 0 )
        {
            if( !loadList( ) )
            {
                return null;
            }
        }
        return list;
    }
    public void setList(List<ReporteCambios> list) 
    {
        this.list = list;
    }
        
    public ReporteCambios getById(HttpServletRequest par){
        ReporteCambios sol= new ReporteCambios();
        sol.getRep().setIdReporte(Integer.parseInt(par.getParameter("idreporte")));
        
        if(sol.getRep().getIdReporte()== 0){
            return null;
        }
        
        ReporteCambios rep = new ListEstatusService().getById(sol);
        if(rep != null){
            return rep;
        } else{
            return null;
        }
    }
    public boolean addRegistro( HttpServletRequest request )
    {
        Date fecha=new Date();
        registro = new ReporteCambios();
        registro.getRep().setIdReporte(Integer.parseInt(request.getParameter("IdReporte")));
        if( registro.getRep().getIdReporte()==0 )
        {
            return false;
        }
        registro.getUsuario().setIdUsuario(Integer.parseInt(request.getParameter("IdUsuario")));
        if( registro.getRep().getIdReporte()==0 )
        {
            return false;
        }
        registro.setEstatusI(request.getParameter( "EstatusI" ));
        if( registro.getEstatusI()== null || registro.getEstatusI().length()==0 )
        {
            return false;
        }
        registro.getRep().setEstatus(request.getParameter( "EstatusF" ));
        if( registro.getRep().getEstatus()== null || registro.getRep().getEstatus().length()==0 )
        {
            return false;
        }
        registro.getRep().setSolucion(request.getParameter( "Solucion" ));
        if( registro.getRep().getSolucion()== null || registro.getRep().getSolucion().length()==0 )
        {
            return false;
        }
        registro.setFechaCambio(fecha);
        if( registro.getFechaCambio()== null )
        {
            return false;
        }
        return ListEstatusService.addRegistro(registro);
    }
    
    
} 

