/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bishal.jax.dao.impl;

import com.bishal.jax.dao.CustomerDAO;
import com.bishal.jax.entity.Customer;
import com.bishal.jax.util.DbConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Bishal
 */
public class CustomerDAOImpl implements CustomerDAO{
    private DbConnection conn=new DbConnection();
    @Override
    public int insert(Customer c) throws SQLException, ClassNotFoundException {
        conn.open();
        String sql="insert into tbl_customers (first_name,last_name,email,contact_no,status)values(?,?,?,?,?)";
        PreparedStatement stmt=conn.init(sql);
        stmt.setString(1, c.getFirstName());
        stmt.setString(2, c.getLastName());
        stmt.setString(3,c.getEmail());
        stmt.setString(4, c.getContactNo());
        stmt.setBoolean(5, c.isStatus());
        int result=conn.executeUpdate();
        conn.close();
        return result;
    }

    @Override
    public int update(Customer c) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int delete(int id) throws SQLException, ClassNotFoundException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Customer getbyId(int id) throws SQLException, ClassNotFoundException {
       for(Customer c: getAll()){
            if(id==c.getId()){
                return c;
            }
        }
        
        return null; 
    }

    @Override
    public List<Customer> getAll() throws SQLException, ClassNotFoundException {
        List<Customer> customerList = new ArrayList<>();
        conn.open();
        String sql="SELECT * from tbl_customers";
        PreparedStatement stmt= conn.init(sql);
        ResultSet rs= conn.executeQuery();
        while(rs.next()){
            Customer c=new Customer();
            c.setId(rs.getInt("id"));
            c.setFirstName(rs.getString("first_name"));
            c.setLastName(rs.getString("last_name"));
            c.setEmail(rs.getString("email"));
            c.setContactNo(rs.getString("contact_no"));
            c.setAddedDate(rs.getDate("added_date"));
            c.setModifiedDate(rs.getDate("modified_date"));
            c.setStatus(rs.getBoolean("status"));
            customerList.add(c);
            
        }
        conn.close();
        
        return customerList;   
    }
}
    
