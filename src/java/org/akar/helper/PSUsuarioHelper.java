package org.akar.helper;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.MsjForo;
import org.akar.dao.PSUsuario;
import org.akar.dao.TblTipoUsuario;
import org.akar.dao.TblUsuario;
import org.akar.service.PSUsuarioService;

public class PSUsuarioHelper implements Serializable {
    
    TblUsuario usuario,usuario2;
    TblTipoUsuario tipo,tipo2;
    PSUsuario psUser;
    MsjForo msjForo;
    
    public PSUsuarioHelper(){
        
    }
    
    public PSUsuario SignUp(HttpServletRequest request){
        
        psUser=new PSUsuario(new TblUsuario(), new TblTipoUsuario());
        
        psUser.getUsuario().setNom( request.getParameter("nombre"));
        psUser.getUsuario().setApellidoP( request.getParameter("apellido_p"));
        psUser.getUsuario().setApellidoM( request.getParameter("apellido_m"));
        psUser.getUsuario().setFechaNac(getDate(request.getParameter("fecha_nac")));
        psUser.getUsuario().setCorreo( request.getParameter("correo_e"));
        psUser.getUsuario().setNomUser( request.getParameter("usuario"));
        psUser.getTipo().setIdTipo( Integer.parseInt( request.getParameter("tipoUsuario") ));
        psUser.getUsuario().setPassword( request.getParameter("pass"));
        
        if(psUser.getUsuario().getNom().length() == 0 || psUser.getUsuario().getNom() == null){
            return null;
        }
        if(psUser.getUsuario().getApellidoP().length() == 0 || psUser.getUsuario().getApellidoP() == null){
            return null;
        }
        if(psUser.getUsuario().getApellidoM().length() == 0 || psUser.getUsuario().getApellidoM() == null){
            return null;
        }
        if(psUser.getUsuario().getFechaNac() == null){
            return null;
        }
        if(psUser.getUsuario().getCorreo().length() == 0 || psUser.getUsuario().getCorreo() == null){
            return null;
        }
        if(psUser.getUsuario().getNomUser().length() == 0 || psUser.getUsuario().getNomUser() == null){
            return null;
        }
        if( psUser.getTipo().getIdTipo() == 0 ){
            return null;
        }
        if(psUser.getUsuario().getPassword().length() == 0 || psUser.getUsuario().getPassword() == null){
            return null;
        }
        
        return new PSUsuarioService().SignUp(psUser.getUsuario(), psUser.getTipo());
    }
    public PSUsuario SignUp2(HttpServletRequest request){
        
        psUser = new PSUsuario(new TblUsuario(), new TblTipoUsuario());
        PSUsuario psUser2 = new PSUsuario(new TblUsuario(), new TblTipoUsuario());
        
        psUser.getUsuario().setNom( request.getParameter("nombre"));
        psUser.getUsuario().setApellidoP( request.getParameter("apellido_p"));
        psUser.getUsuario().setApellidoM( request.getParameter("apellido_m"));
        psUser.getUsuario().setFechaNac(getDate(request.getParameter("fecha_nac")));
        psUser.getUsuario().setCorreo( request.getParameter("correo_e"));
        psUser.getUsuario().setNomUser( request.getParameter("usuario"));
        psUser.getTipo().setIdTipo( Integer.parseInt( request.getParameter("tipoUsuario") ));
        psUser.getUsuario().setPassword( request.getParameter("pass"));
        psUser2.getUsuario().setCorreo( request.getParameter("correo_e_tutor"));
        
        if(psUser.getUsuario().getNom().length() == 0 || psUser.getUsuario().getNom() == null){
            return null;
        }
        if(psUser.getUsuario().getApellidoP().length() == 0 || psUser.getUsuario().getApellidoP() == null){
            return null;
        }
        if(psUser.getUsuario().getApellidoM().length() == 0 || psUser.getUsuario().getApellidoM() == null){
            return null;
        }
        if(psUser.getUsuario().getFechaNac() == null){
            return null;
        }
        if(psUser.getUsuario().getCorreo().length() == 0 || psUser.getUsuario().getCorreo() == null){
            return null;
        }
        if(psUser.getUsuario().getNomUser().length() == 0 || psUser.getUsuario().getNomUser() == null){
            return null;
        }
        if( psUser.getTipo().getIdTipo() == 0 ){
            return null;
        }
        if(psUser.getUsuario().getPassword().length() == 0 || psUser.getUsuario().getPassword() == null){
            return null;
        }
        if(psUser2.getUsuario().getCorreo().length() == 0 || psUser2.getUsuario().getCorreo() == null){
            return null;
        }
        
        return new PSUsuarioService().SignUp2(psUser,psUser2);
    }
    
    public PSUsuario Login(HttpServletRequest request){
        psUser = new PSUsuario(new TblUsuario(), new TblTipoUsuario());
        
        psUser.getUsuario().setNomUser(request.getParameter( "nomU" ) );
        psUser.getUsuario().setPassword( request.getParameter( "pass" ) );
        
        if(psUser.getUsuario().getNomUser().length() == 0 || psUser.getUsuario().getNomUser() == null){
            return null;
        }
        if(psUser.getUsuario().getPassword().length() == 0 || psUser.getUsuario().getPassword() == null){
            return null;
        }
        
        return new PSUsuarioService().Login(psUser);
    }
    
    public PSUsuario update(HttpServletRequest request){
        
        psUser = new PSUsuario(new TblUsuario(), new TblTipoUsuario());
        
        psUser.getUsuario().setNomUser( request.getParameter( "nomU" ) );
        psUser.getUsuario().setNom( request.getParameter( "nom" ) );
        psUser.getUsuario().setApellidoP( request.getParameter( "aPat" ) );
        psUser.getUsuario().setApellidoM( request.getParameter( "aMat" ) );
        psUser.getTipo().setIdTipo( Integer.parseInt(request.getParameter( "id" )) );
        
        if(psUser.getUsuario().getNomUser().length() == 0 || psUser.getUsuario().getNomUser() == null){
            return null;
        }
        if(psUser.getUsuario().getNom().length() == 0 || psUser.getUsuario().getNom() == null){
            return null;
        }
        if(psUser.getUsuario().getApellidoP().length() == 0 || psUser.getUsuario().getApellidoP() == null){
            return null;
        }
        if(psUser.getUsuario().getApellidoM().length() == 0 || psUser.getUsuario().getApellidoM() == null){
            return null;
        }
        if( psUser.getTipo().getIdTipo() == 0 ){
            return null;
        }
        
        return new PSUsuarioService().Update(psUser);
    }
    
    public boolean sendMsg(HttpServletRequest request){
        msjForo = new MsjForo();
        msjForo.setMensaje( request.getParameter("msj") );
        msjForo.getUsuario().setIdUsuario( Integer.parseInt(request.getParameter("idAutor")) );
        msjForo.setHora( new Date() );
        
        if(msjForo.getUsuario().getIdUsuario() == 0){
            return false;
        }
        if(msjForo.getMensaje().length() == 0 || msjForo.getMensaje() == null){
            return false;
        }
        if(msjForo.getHora() == null){
            return false;
        }
        
        return new PSUsuarioService().sendMsg(msjForo);
    }
    
    public List<MsjForo> getMsg(){
        List<MsjForo> list = new PSUsuarioService().getMsg();
        if(list != null){
            return list;
        } else{
            return null;
        }
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
