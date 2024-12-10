<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>  
  <%@ page import="com.entity.User" %>
 <%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookOrderlmpl" %>
<%@ page import="com.entity.Book_Order" %>
<%@page import=" java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Book</title>
<%@include file="all_compoment/allCss.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    .order-status {
        font-weight: bold;
    }
    .order-success {
        color: green;
    }
</style>
<script>
    // Hàm cập nhật trạng thái đơn hàng động
    function updateStatus(orderId) {
        $.ajax({
            url: 'getStatus.jsp',
            type: 'GET',
            data: { orderId: orderId },
            dataType: 'text',
            success: function(status) {
                $('#status_' + orderId).text(status);
                if (status === 'Đã đặt hàng thành công') {
                    $('#status_' + orderId).removeClass('order-processing').addClass('order-success');
                } else if (status === 'Đang xử lý đơn hàng') {
                    $('#status_' + orderId).removeClass('order-success').addClass('order-processing');
                } else {
                    $('#status_' + orderId).addClass('text-danger');
                }
            },
            error: function(xhr, status, error) {
                console.error('Lỗi khi lấy trạng thái:', error);
            }
        });
    }

    // Gọi hàm updateStatus cho mỗi orderId khi tài liệu sẵn sàng
    $(document).ready(function() {
        $('.order-row').each(function() {
            var orderId = $(this).find('.order-id').text().trim(); // Lấy orderId từ phần tử HTML tương ứng
            updateStatus(orderId); // Gọi hàm updateStatus để cập nhật trạng thái đơn hàng
        });
    });
</script>
</head>
<body style ="background-color: #f0f1f2;">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file = "all_compoment/navbar.jsp" %>
	<div class="container p-1">
	<h3 class="text-center text-primary">Your Order</h3>
	
		<table class="table table-striped mt-4">
			  <thead class="bg-primary text-white">
			    <tr>
			      <th scope="col">Order ID</th>
			      <th scope="col">Name</th>
			      <th scope="col">BookName</th>
			      <th scope="col">Author</th>
			      <th scope="col">Price</th>
			      <th scope="col">Payment Type</th>
			      <th scope="col">Status</th>
			    </tr>
			  </thead>
			  <tbody>
			  
			  <%
			  User u = (User)session.getAttribute("userobj");
			  BookOrderlmpl dao = new BookOrderlmpl(DBConnect.getConn());
			  List<Book_Order> blist = dao.getBook(u.getEmail());
			  for (Book_Order b:blist)
			  {
				%>
					<tr>
				      <th scope="row"><%=b.getOrderId() %></th>
				      <td><%=b.getUserName() %></td>
				      <td><%=b.getBookName() %></td>
				      <td><%=b.getAuthor() %></td>
				      <td><%=b.getPrice() %></td>
				      <td><%=b.getPaymentType() %></td>
				      <td>
                    <span class="order-status <%= b.getStatus().equals("Order Success") ? "order-success" : "" %>">
                        <%= b.getStatus() %>
                    </span>
                  </td>
				    </tr>
				<%  
			  }
			  %>
			  
			    
			    
			  </tbody>
		</table>
	</div>
</body>
</html>