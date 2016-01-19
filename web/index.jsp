<%-- 
    Document   : index
    Created on : Dec 10, 2015, 11:09:39 AM
    Author     : Bishal
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customerServiceImpl" class="com.bishal.jax.service.impl.CustomerServiceImpl"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Practice</title>
        <script src="jquery.js"></script>
        <link href="bootstrap.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container">
           
        <h1>Customers</h1>
        <form id="form"  method="post">
            <div class="form-group">
            <label>First Name</label>
            <input type="text" class="form-control" id="first_name" name="first_name"/>
            </div>
            <div class="form-group">
            <label>Last Name</label>
            <input type="text" class="form-control" id="last_name" name="last_name"/>
            </div>
            <div class="form-group">
            <label>Email</label>
            <input type="email" class="form-control" name="email" id="email"/>
            </div>
            <div class="form-group">
            <label>Contact No</label>
            <input type="text" name="contactNo" class="form-control" id="contact_no"/>
            </div>
            <div class="checkbox">
                <label>Status</label><input type="checkbox" id="status" name="status"/>
            </div>
            <button type="submit" name="status" class="btn btn-success" id="save-btn">Save</button>
        </form>
        
        <table class="table table-bordered table-hover table-striped">
	<tr>
		<th>Id</th>
		<th>Full Name</th>
		<th>Email</th>
                <th>Contact</th>
		<th>Status</th>
	</tr>
        <c:forEach var="customer" items="${customerServiceImpl.getAll()}">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.firstName} ${customer.lastName}</td>
                <td>${customer.email}</td>
                <td>${customer.contactNo}</td>
                <td>${customer.status}</td>
                
            </tr>
        </c:forEach>
        
        </table>
        <!-- Modal -->
<div class="modal fade" id="customer-dialog" tabindex="-1" role="dialog" aria-labelledby="student-label" style="display:none">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="customer-label"></h4>
      </div>
      <div class="modal-body">
        <form id="customer-form">
        <div class="form-group">
	        <label>First Name</label>
	        <input type="text" id="first_name" name="first_name" placeholder="Enter First Name" required="required"class="form-control"/>
        </div>
        <div class="form-group">
	        <label>Last Name</label>
	        <input type="text" id="last_name" name="last_name" placeholder="Enter Last Name" required="required" class="form-control"/>
        </div> 
        <div class="form-group">
	        <label>Email</label>
	        <input type="email" id="email" name="email" placeholder="Enter Email" required="required" class="form-control"/>
        </div>  
        <div class="form-group">
	        <label>Contact No</label>
	        <input type="text" id="contact_no" name="contact_no" placeholder="Enter Contact No" required="required" class="form-control"/>
        </div> 
         <div class="checkbox">
	        <label>
	        <input type="checkbox" id="status" name="status" />
	        Status </label>
        </div>                      
        <input type="hidden" id="id" name="id"/>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="save-button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
        </div>
        <script>
            $(document).on("ready",function(){
                $("#edit").on('click',function(){
		var id=$(this).attr("rel");
		$.getJSON("http://localhost:8080/Practice/api/customer/",+id,function(data){
			$("#customer-dialog").html("Edit Customer");
			$("#id").val(data.id);
			$("#first_name").val(data.firstName);
			$("#last_name").val(data.lastName);
			$("#email").val(data.email);
                        $("#contact_no").val(data.contactNo);
			$("#status").val(data.status);
			$("#customer-dialog").modal();
			
		});

	});
               $("#save-btn").on('click',function(){
               $.post("http://localhost:8080/Practice/api/customer/save",$("#form").serialize(),function(data){
                    if(data!=null){
                      alert("Data successfully added");
                    }
                });
               return false;
        });
                
                $.getJSON("http://localhost:8080/Practice/api/customer/list",function(data){
                var $result=$("#result");
                var content="";
                $.each(data,function(i,o){
                    content +="<li class='row' rel='"+o.id+"' >" + o.firstName + " " + o.lastName + "</li>"
                });
                $result.html(content);
                    $(".row").on('click',function(){
                        
                        var $loading=$("#loading");
                        $loading.show();
                        var id=$(this).attr("rel");
                        $.getJSON("http://localhost:8080/Practice/api/customer/"+id,function(data){
                            $("#first_name").val(data.firstName);
                            $("#last_name").val(data.lastName);
                            $("#email").val(data.email);
                            $("#contact_no").val(data.contactNo);
                            $loading.hide();
                        });
                        
                    });
                });    
            });
        </script>
    </body>
</html>
