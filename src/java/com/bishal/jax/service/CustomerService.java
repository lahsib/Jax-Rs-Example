/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bishal.jax.service;

import com.bishal.jax.entity.Customer;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Bishal
 */
public interface CustomerService {
    int insert(Customer c)throws SQLException,ClassNotFoundException;
    int update(Customer c)throws SQLException,ClassNotFoundException;
    int delete(int id)throws SQLException,ClassNotFoundException;
    Customer getbyId(int id)throws SQLException,ClassNotFoundException;
    List<Customer> getAll()throws SQLException,ClassNotFoundException;
}
