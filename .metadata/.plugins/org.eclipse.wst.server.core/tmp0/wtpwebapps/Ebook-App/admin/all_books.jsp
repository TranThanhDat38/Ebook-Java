<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="com.DAO.BookDaolmpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDtls" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@include file = "allCss.jsp" %>

</head>
<body>
	<%@include file ="navbar.jsp" %>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>
	
	<h3 class="text-center">Hello Admin</h3>
	
	<c:if test="${not empty succMsg }">
		<h5 class = "text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
					
	<c:if test="${not empty failedMsg }">
		<h5 class = "text-center text-danger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session"/>
	</c:if>
	
	<table class="table table-striped ">
		  <thead class="bg-primary text-white">
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Image</th>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author</th>
		      <th scope="col">Price</th>
		      <th scope="col">Categories</th>
		      <th scope="col">Status</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  	
		  	<%
			  BookDaolmpl dao = new BookDaolmpl(DBConnect.getConn());
			  List<BookDtls> list = dao.getAllBooks();
			  for (BookDtls b: list)
			  {
				  %>
				  <tr>
					      <td><%=b.getBookId() %></td>
					      <td><img src="../book/<%=b.getPhotoName() %>" style="width:100px;height:100px;"></td>
					      <td><%=b.getBookName() %></td>
					      <td><%=b.getAuthor() %></td>
					      <td><%=b.getPrice() %></td>
					      <td><%=b.getBookCategory() %></td>
					      <td><%=b.getStatus() %></td>
					      <td>
					      	<a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
					      	<a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a>
					      </td>
			    	</tr>
				  <% 
			  }
			  
			  %>
			  
		  
		  </tbody>
	</table>
	<div style = "margin-top:380px;">
		<%@include file = "footer.jsp" %>
	</div>
</body>
</html>
