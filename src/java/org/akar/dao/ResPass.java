
package org.akar.dao;

import java.io.Serializable;
import java.sql.Timestamp;

public class ResPass implements Serializable{
    
    int idToken;
    String token;
    Timestamp exp;

    public ResPass() {
    }

    public int getIdToken() {
        return idToken;
    }

    public void setIdToken(int idToken) {
        this.idToken = idToken;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Timestamp getExp() {
        return exp;
    }

    public void setExp(Timestamp exp) {
        this.exp = exp;
    }    
    
}
