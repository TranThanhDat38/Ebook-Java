<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_compoment/allCss.jsp" %>
</head>
<body style ="background-color: #f0f1f2;">
	<%@include file = "all_compoment/navbar.jsp" %>
	<div class="container">
		<div class="text-center mt-5">
			<i class="fas fa-check-circle fa-5x text-success"></i>
			<h1>Thank you</h1>
			<h2>Your Order Successfully</h2>
			<h5>With in 7 Days Your Product will be Delivered In your Address</h5>
			<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
			<a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
		</div>
		
	</div>
</body>
</html>