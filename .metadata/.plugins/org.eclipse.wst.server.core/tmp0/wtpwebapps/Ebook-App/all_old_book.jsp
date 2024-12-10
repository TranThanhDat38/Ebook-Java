<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookDaolmpl" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDtls" %>
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
	<%@include file = "all_compoment/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row p-3">
				<%
			BookDaolmpl dao = new BookDaolmpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllOldBook();
			for (BookDtls b:list)
			{
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName() %>" style= "width:100px;height:150px" class="img-thumblin">
						<p><%=b.getBookName() %></p>
						<p><%=b.getAuthor() %></p>
						<p>Categories:<%=b.getBookCategory() %></p>
						<div class="row justify-content-center">
							<div class="row">
								
								<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Detail</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>$</a>
							</div>
						</div>
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