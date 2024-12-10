<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDaolmpl" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="all_compoment/allCss.jsp" %>

<style type = "text/css">
	
	.crd-ho:hover
	{
		background:#f5f5f5;
	}
</style>
</head>
<body>
	<%
	User u =(User)session.getAttribute("userobj");
	%>
	<%@include file = "all_compoment/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row p-3">
				<%
				BookDaolmpl dao2 = new BookDaolmpl(DBConnect.getConn());
				List<BookDtls> list2 = dao2.getAllRecentBook();
				for (BookDtls b : list2)
				{
				%>
					<div class="col-md-3">
						<div class="card crd-ho mt-4">
							<div class="card-body text-center">
								<img alt="" src="book/<%=b.getPhotoName() %>" style= "width:100px;height:150px" class="img-thumblin">
								<p><%=b.getBookName() %></p>
								<p><%=b.getAuthor() %></p>
								<p>
								<div class= "row justify-content-center"></div>
								<%
								if (b.getBookCategory().equals("Old"))
								{%>
									Categories:<%=b.getBookCategory() %></p>
									<div class="row justify-content-center">
									<div class="row">
										
										<!-- <a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>Add Cart</a> -->
										<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-8">View Detail</a>
										<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>$</a>
									</div>
									</div>
								<%
								}
								else
								{
								%>
									Categories:<%=b.getBookCategory() %></p>
									<div class="row justify-content-center">
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
		</div>
</body>
</html>