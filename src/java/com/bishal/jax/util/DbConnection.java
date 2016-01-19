/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bishal.jax.util;

import com.bishal.jax.constant.DbConstant;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Bishal
 */
public class DbConnection {
    Connection connection=null;
    PreparedStatement stmt=null;
    
    public DbConnection(){
    }
    
    public void open() throws SQLException,ClassNotFoundException{
        Class.forName(DbConstant.DB_DRIVER);
        connection=DriverManager.getConnection(DbConstant.DB_URL,DbConstant.DB_USER,DbConstant.DB_PASSWORD);
    }
    
    public PreparedStatement init(String sql) throws SQLException{
        stmt=connection.prepareStatement(sql);
        return stmt;
    }
    
    public int executeUpdate() throws SQLException{
        return stmt.executeUpdate();
    }
    
    public ResultSet executeQuery() throws SQLException{
        return stmt.executeQuery();
    }
    
    public void close() throws SQLException{
        if(connection!=null && !connection.isClosed()){
            connection.close();
            connection=null;
        }
    }   
}
