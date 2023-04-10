package org.akar.helper;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.akar.dao.Reporte;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.RelReporteUsuario;
import org.akar.service.RegistroService;

public class RegistroTareaHelper {
    private List<Reporte>list;
    private RelReporteUsuario reporte;
    
    public RegistroTareaHelper(){
        
    }
    public boolean addRegistro( HttpServletRequest request ){
        reporte = new RelReporteUsuario();
        reporte.getRep().setProblema( request.getParameter("desc") );
        reporte.getRep().setEstatus("Abierto");
        reporte.getRep().setFechaI( new Date() );
        reporte.getUser().setCorreo(request.getParameter("correo"));
        if( reporte.getRep().getProblema()== null || reporte.getRep().getProblema().length()==0 )
        {
            return false;
        }
        if( reporte.getRep().getEstatus()== null || reporte.getRep().getEstatus().length()==0 )
        {
            return false;
        }
        if( reporte.getRep().getFechaI()== null)
        {
            return false;
        }
        if( reporte.getUser().getCorreo()== null)
        {
            return false;
        }
                
        return new RegistroService().addReporte(reporte);
    }
    
    
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
}