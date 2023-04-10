/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.akar.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import org.akar.dao.RelReporteUsuario;
import org.akar.dao.Reporte;
import org.akar.dao.TblUsuario;
import static org.akar.service.DBConnection.closeConnection;
import static org.akar.service.DBConnection.getConnection;

public class RegistroService {

    public RegistroService() {
    }
    
    public static boolean addReporte( RelReporteUsuario reporte )
    {
        Connection connection = null;        
        String sql = null;
        PreparedStatement preparedStatement = null;
        int row = 0;
        try 
        {
            if( reporte == null)
            {
                return false;
            }
            connection = getConnection( );
            if( connection == null )
            {
                return false;
            }
            sql = "call sp_addReporte(?, ?, ?, ?);";
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, reporte.getRep().getProblema());
            preparedStatement.setString(2, reporte.getRep().getEstatus());
            preparedStatement.setDate(3, new Date(reporte.getRep().getFechaI().getTime()));
            preparedStatement.setString(4, reporte.getUser().getCorreo());
            row = preparedStatement.executeUpdate();
            if( row == 0 )
            {
                return false;
            }
            preparedStatement.close();
            closeConnection(connection);
            return true;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public List<TblUsuario> getListU(){
        List<TblUsuario> list = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        TblUsuario usuario = null;
        String query = "select Usuario.NomUsuario, Usuario.correo from RelTipoUsuario inner join Usuario on RelTipoUsuario.idUsuario = Usuario.idUsuario where RelTipoUsuario.idTipo <=4;";
        
        try 
        {
            connection = DBConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            if( resultSet == null )
            {
                return null;
            }
            list = new ArrayList<>();
            while( resultSet.next() )
            {
                usuario = new TblUsuario();
                usuario.setNomUser(resultSet.getString(1) );
                usuario.setCorreo(resultSet.getString(2) );
                list.add(usuario);
            }
            resultSet.close();
            DBConnection.closeConnection(connection);
            return list;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
}
