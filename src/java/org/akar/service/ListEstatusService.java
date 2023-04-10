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
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.akar.dao.Reporte;
import org.akar.dao.ReporteCambios;
import static org.akar.service.DBConnection.*;

/**
 *
 * @author 52553
 */
public class ListEstatusService {

    public ListEstatusService() {
    }
    
    public static List<ReporteCambios> getEstatusCService( )
    {
        List<ReporteCambios> ListEstatusC = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        ReporteCambios listEstatusC = null;
        
        try 
        {
            connection = getConnection( );
            if( connection == null )
            {
                return null;
            }
            statement = connection.createStatement( );
            if( statement == null )
            {
                return null;
            }
            resultSet = statement.executeQuery("select distinct Reporte.idReporte, Problema,FechaI, Estatus, Usuario.Correo from Reporte inner join RelReporteUsuario on RelReporteUsuario.idReporte=Reporte.idReporte inner join Usuario on Usuario.idUsuario=RelReporteUsuario.idUsuario inner join RelReporteEncargado on Reporte.IdReporte=RelReporteEncargado.IdReporte where RelReporteEncargado.IdEncargado=5");
            if( resultSet == null )
            {
                return null;
            }
            
            ListEstatusC = new ArrayList<>();
            while( resultSet.next() )
            {
                listEstatusC = new ReporteCambios();
                listEstatusC.getRep().setIdReporte(resultSet.getInt(1));
                listEstatusC.getRep().setProblema(resultSet.getString(2));
                listEstatusC.getRep().setFechaI(resultSet.getDate(3));
                listEstatusC.getRep().setEstatus(resultSet.getString(4));
                listEstatusC.getUsuario().setCorreo(resultSet.getString(5));
                ListEstatusC.add(listEstatusC);
            }
            resultSet.close();
            closeConnection(connection);
            return ListEstatusC;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
        public ReporteCambios getById(ReporteCambios solucion){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ReporteCambios sol = null;
        String sql = "select distinct Reporte.idReporte, Problema,FechaI, Estatus, Usuario.Correo, Solucion from Reporte inner join RelReporteUsuario on RelReporteUsuario.idReporte=Reporte.idReporte inner join Usuario on Usuario.idUsuario=RelReporteUsuario.idUsuario inner join RelReporteEncargado on Reporte.IdReporte=RelReporteEncargado.IdReporte where RelReporteEncargado.IdReporte=?";
        try 
        {
            connection = DBConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1,solucion.getRep().getIdReporte());
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                sol = new ReporteCambios();
                sol.getRep().setIdReporte(resultSet.getInt(1));
                sol.getRep().setProblema(resultSet.getString(2));
                sol.getRep().setFechaI(resultSet.getDate(3));
                sol.setEstatusI(resultSet.getString(4));
                sol.getUsuario().setCorreo(resultSet.getString(5));
                sol.getRep().setSolucion(resultSet.getString(6));
            }
            resultSet.close();
            DBConnection.closeConnection(connection);
            return sol;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
        public static boolean addRegistro( ReporteCambios registro )
    {
        Connection connection = null;        
        String sql = null;
        PreparedStatement preparedStatement = null;
        int row = 0;
        try 
        {
            if( registro == null)
            {
                return false;
            }
            connection = getConnection( );
            if( connection == null )
            {
                return false;
            }
            sql = "call sp_mantenimiento(?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setInt(1, registro.getRep().getIdReporte());
            preparedStatement.setInt(2,5);
            preparedStatement.setString(3, registro.getEstatusI());
            preparedStatement.setString(4, registro.getRep().getEstatus());
            preparedStatement.setString(5, registro.getRep().getSolucion());
            preparedStatement.setDate(6, new Date(registro.getFechaCambio().getTime()) );
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
}
