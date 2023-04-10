
package org.akar.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.akar.dao.PSResPass;

public class PSResPassService {

    public PSResPassService() {
    }
    
    public boolean setToken(PSResPass resPass){
        try{
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet;
            String sql = "call sp_asignarToken(?, ?, ?)";
            int row = 0;
            
            connection = DBConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, resPass.getUsuario().getCorreo());
            preparedStatement.setString(2, resPass.getResPass().getToken());
            preparedStatement.setTimestamp(3, resPass.getResPass().getExp());
            row = preparedStatement.executeUpdate();
            DBConnection.closeConnection(connection);
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean resPass(PSResPass resPass){
        try{
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet;
            String sql = "call sp_ActualizarContrasena(?, ?)";
            int row = 0;
            
            connection = DBConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, resPass.getUsuario().getCorreo());
            preparedStatement.setString(2, resPass.getUsuario().getPassword());
            row = preparedStatement.executeUpdate();
            DBConnection.closeConnection(connection);
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    
    public PSResPass getToken( String token ){
        try{
            Connection connection;
            PreparedStatement preparedStatement;
            ResultSet resultSet;
            String sql = "call sp_recDatosToken(?)";
            int row = 0;
            
            connection = DBConnection.getConnection();
            if( connection == null ){
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, token);
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                PSResPass query = new PSResPass();
                query.getUsuario().setCorreo(resultSet.getString(1));
                query.getResPass().setToken(resultSet.getString(2));
                query.getResPass().setExp(resultSet.getTimestamp(3));
                return query;
            }
            resultSet.close();
            DBConnection.closeConnection(connection);
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
}
