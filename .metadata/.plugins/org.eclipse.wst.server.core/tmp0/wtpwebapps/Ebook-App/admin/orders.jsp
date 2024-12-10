<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>  
  <%@ page import="com.entity.User" %>
 <%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookOrderlmpl" %>
<%@ page import="com.DAO.BookOrderDAO" %>
<%@ page import="com.entity.Book_Order" %>
<%@page import=" java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@include file = "allCss.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    .order-status {
        font-weight: bold;
    }
    .order-success {
        color: green;
    }
</style>

<script>
    function confirmApprove(orderId) {
        if (confirm('Are you sure you want to approve this order?')) {
            // Update hidden input value to confirm
            document.getElementById('confirmAction_' + orderId).value = 'confirm';
            // Submit the form
            document.getElementById('approveForm_' + orderId).submit();
        } else {
            // Do nothing or handle cancel action
        }
    }
</script>


</head>
<body>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>

	<%@include file ="navbar.jsp" %>
	<div class="container mt-3">
        <div class="row">
            <div class="col-md-6">
                <h1 style="color:red">Hello Admin</h1>
            </div>
            <div class="col-md-6">
                <div class="form-group row">
                    <label class="col-sm-6 col-form-label text-right"><strong>Total Approved Amount:</strong></label>
                    <div class="col-sm-6">
                        <%
                        BookOrderlmpl dao2 = new BookOrderlmpl(DBConnect.getConn());
                        double totalApprovedAmount = dao2.calculateTotalApprovedAmount();
                        %>
                        <input type="text" class="form-control" readonly value="<%= String.format("%.2f", totalApprovedAmount) %>">
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<table class="table table-striped mt-3 ">
		  <thead class="bg-primary text-white">
		    <tr>
		      <th scope="col">Order ID</th>
		      <th scope="col">Name</th>
		      <th scope="col">Email</th>
		      <th scope="col">Address</th>
		      <th scope="col">Ph No</th>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author</th>
		      <th scope="col">Price</th>
		      <th scope="col">Payment type</th>
		       <th scope="col">Status</th>
                <th scope="col">Approve</th>
		    	
		    </tr>
		  </thead>
		  <tbody>
		  
		  <%
		  BookOrderlmpl dao = new BookOrderlmpl(DBConnect.getConn());
		  List<Book_Order> blist=dao.getAllOrder();
		  for (Book_Order b:blist)
		  {
			%>
				<tr>
			      <th scope="row"><%=b.getOrderId() %></th>
			      <td><%=b.getUserName() %></td>
			      <td><%=b.getEmail() %></td>
			      <td><%=b.getFulladd() %></td>
			      <td><%=b.getPhno() %></td>
			      <td><%=b.getBookName() %></td>
			      <td><%=b.getAuthor() %></td>
			      <td><%=b.getPrice() %></td>
			      <td><%=b.getPaymentType() %></td>
			      <td>
                    <span class="order-status <%= b.getStatus().equals("Order Success") ? "order-success" : "" %>">
                        <%= b.getStatus() %>
                    </span>
                  </td>
                <td>
                    <%-- Approve button/form --%>
                    <form id="approveForm_<%= b.getOrderId() %>" action="approveOrder.jsp" method="POST">
                        <input type="hidden" name="orderId" value="<%= b.getOrderId() %>">
                        <input type="hidden" id="confirmAction_<%= b.getOrderId() %>" name="confirmAction" value="">
                        <button type="button" onclick="confirmApprove('<%= b.getOrderId() %>')" class="btn btn-primary">Approve</button>
                    </form>
                </td>
			    	
			    </tr>
			<%  
		  }
		  %>
		  
		    
		  
		  </tbody>
	</table>


</body>
</html>