/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bishal.jax.service.impl;

import com.bishal.jax.dao.CustomerDAO;
import com.bishal.jax.dao.impl.CustomerDAOImpl;
import com.bishal.jax.entity.Customer;
import com.bishal.jax.service.CustomerService;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Bishal
 */
public class CustomerServiceImpl implements CustomerService{
    private CustomerDAO customerDAO=new CustomerDAOImpl();
    @Override
    public int insert(Customer c) throws SQLException, ClassNotFoundException {
        return customerDAO.insert(c);
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
        return customerDAO.getbyId(id);
    }

    @Override
    public List<Customer> getAll() throws SQLException, ClassNotFoundException {
        return customerDAO.getAll();
    }
    
}
