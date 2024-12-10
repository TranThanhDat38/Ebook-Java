<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookOrderlmpl" %>
<%@ page import="com.entity.Book_Order" %>
<%@ page import="java.util.List" %>
<%
    String orderId = request.getParameter("orderId");
    BookOrderlmpl dao = new BookOrderlmpl(DBConnect.getConn());
    Book_Order order = dao.getOrderById(orderId);
    String status = order.getStatus(); // Lấy trạng thái từ đối tượng Order

    // Chuyển đổi status thành các giá trị người dùng hiểu được
    if (status == null) {
        status = "Order Processing"; // Mặc định khi chưa có trạng thái
    } else if (status.equals("Order Success")) {
        status = "Đã đặt hàng thành công";
    } else if (status.equals("Order Processing")) {
        status = "Đang xử lý đơn hàng";
    } else {
        status = "Trạng thái không xác định";
    }

    // Trả về trạng thái dưới dạng plain text
    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(status);
%>
