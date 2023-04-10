
package org.akar.helper;

import java.sql.Timestamp;
import java.time.Instant;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.PSResPass;
import org.akar.extConnections.Correo;
import org.akar.security.Tokens;
import org.akar.service.PSResPassService;

public class PSResPassHelper {
    
    PSResPass resPass;

    public PSResPassHelper() {
        resPass = new PSResPass();
    }
    
    public boolean setToken(HttpServletRequest request){
        Tokens tok = new Tokens();
        
        resPass.getUsuario().setCorreo(request.getParameter("CorreoRec"));
        resPass.getResPass().setToken(tok.genToken());
        resPass.getResPass().setExp(Timestamp.from(Instant.now()));
        
        if(resPass.getUsuario().getCorreo().length() == 0 || resPass.getUsuario().getCorreo() == null){
            return false;
        }
        if(resPass.getResPass().getToken().length() == 0 || resPass.getResPass().getToken() == null){
            return false;
        }
        if(resPass.getResPass().getExp() == null){
            return false;
        }
        
        if(new PSResPassService().setToken(resPass) == true){
            new Correo().resPass(resPass.getUsuario().getCorreo(), resPass.getResPass().getToken());
            return true;
        }else{
            return false;
        }
    }
    
    public boolean resPass(HttpServletRequest request){
        resPass.getUsuario().setCorreo(request.getParameter("Correo"));
        resPass.getUsuario().setPassword(request.getParameter("newPass"));
        
        if(resPass.getUsuario().getCorreo().length() == 0 || resPass.getUsuario().getCorreo() == null){
            return false;
        }
        if(resPass.getUsuario().getPassword().length() == 0 || resPass.getUsuario().getPassword() == null){
            return false;
        }
        
        if(new PSResPassService().resPass(resPass) == true){
            return true;
        }else{
            return false;
        }
    }
    
    public boolean getToken(HttpServletRequest request){
        
        PSResPass resPass = new PSResPass();
        resPass = new PSResPassService().getToken(request.getParameter("token"));
        Timestamp ts = Timestamp.from(Instant.now());
        if(resPass != null){
            if(ts.compareTo(resPass.getResPass().getExp()) < 0){
                return true;
            }
            else{
                return false;
            }
        }else{
            return false;
        }
    }
    
}
