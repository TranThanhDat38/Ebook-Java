<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDaolmpl" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook : Index</title>
<%@include file="all_compoment/allCss.jsp" %>
<style type = "text/css">
	.back-img
	{
		background: url("img/b.jpg");
		height:50vh;
		width:100%;
		background-size:cover;
		background-repeat: no-repeat;
	}
	.crd-ho:hover
	{
		background:#f5f5f5;
	}
</style>
</head>
<body style ="background-color: #e6e3e3;">
	<%@include file = "all_compoment/navbar.jsp" %>
	
	<%
	User u =(User)session.getAttribute("userobj");
	%>
	
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Ebook Management System</h2>
	</div>
	
	<% Connection conn = DBConnect.getConn(); 
	
	%>
	
<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDaolmpl dao2 = new BookDaolmpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2)
			{
			%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName() %>" style= "width:150px;height:200px" class="img-thumblin">
							<p><%=b.getBookName() %></p>
							<p><%=b.getAuthor() %></p>
							<p>
							
							<%
							if (b.getBookCategory().equals("Old"))
							{%>
								Categories:<%=b.getBookCategory() %></p>
								<div class="row">
									
									<!-- <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>Add Cart</a> -->
									<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Detail</a>
									<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>$</a>
								</div>
							<%
							}
							else
							{
							%>
								Categories:<%=b.getBookCategory() %></p>
								<div class="row">
								
									<%
									if(u==null)
									{
									%>
										<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
									<%
									}
									else
									{
									%>
										<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
									<%	
									}
									%>
								
								
									<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Detail</a>
									<a href="" class="btn btn-danger btn-sm"><%=b.getPrice() %>$</a>
								</div>
							
							<%
							}
							
							%>
							
							
						</div>
					</div>
					
				</div>
			<%
			}
			%>
		
		
	
			
		</div>	
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
<!-- End Recent Book -->

<hr>
<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			
			
			<%
			BookDaolmpl dao = new BookDaolmpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b:list)
			{
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>" style= "width:150px;height:200px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
						<div class="row">
						
						<%
						if(u==null)
						{
						%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%
						}
						else
						{
						%>
							<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%	
						}
						%>
						
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Detail</a>
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>$</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
			
				
				
			
			
		
		
		
			
		</div>	
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
<!-- End New Book -->

<hr>
<!-- Start Old Book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDaolmpl dao3 = new BookDaolmpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3)
			{
			%>
				<div class="col-md-3">
					<div class="card crd-ho">
						<div class="card-body text-center">
							<img alt="" src="book/<%=b.getPhotoName() %>" style= "width:150px;height:200px" class="img-thumblin">
							<p><%=b.getBookName() %></p>
							<p><%=b.getAuthor() %></p>
							<p><%=b.getBookCategory() %></p>
								
							<div class="row">
								<!-- <a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a> -->
								<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Detail</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>$</a>
							</div>
							
							
						</div>
					</div>
					
				</div>
			<%
			}
			%>
				
			
				
			
		</div>	
		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	
<!-- End Old Book -->

	<%@include file = "all_compoment/footer.jsp" %>

</body>
</html>