package com.bishal.jax.api;

import com.bishal.jax.entity.Customer;
import com.bishal.jax.service.CustomerService;
import com.bishal.jax.service.impl.CustomerServiceImpl;
import java.sql.SQLException;
import java.util.List;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path(value = "/customer")

public class CustomerAPI{
     private CustomerService customerService=new CustomerServiceImpl();
     
    @GET
    @Produces("text/html")
    public String index(){
        return "<h1>hello world</h1>";
    }
    @Path(value = "/list")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Customer> list() throws SQLException, ClassNotFoundException{
        return customerService.getAll();
    }
    @Path(value="/{id}")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Customer byId(@PathParam("id") int id) throws SQLException, ClassNotFoundException
    {
        return customerService.getbyId(id);
    }
    
    @POST
    @Path(value = "/save")
    public int save(@FormParam("first_name")String firstName,@FormParam("last_name")String lastName,@FormParam("email")String email,@FormParam("contactNo")String contactNo,@FormParam("status")Boolean status) throws SQLException, ClassNotFoundException{
        Customer c=new Customer();
        c.setFirstName(firstName);
        c.setLastName(lastName);
        c.setEmail(email);
        c.setContactNo(contactNo);
        c.setStatus(status);
        int result=customerService.insert(c);
        return result;        
    }   

}
