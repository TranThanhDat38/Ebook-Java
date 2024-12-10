<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookOrderlmpl" %>
<%@ page import="com.entity.Book_Order" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>

<%
    String orderId = request.getParameter("orderId");
    String confirmAction = request.getParameter("confirmAction");

    if (orderId != null && !orderId.isEmpty() && confirmAction != null && confirmAction.equals("confirm")) {
        try {
            BookOrderlmpl dao = new BookOrderlmpl(DBConnect.getConn());

            // Perform the approval action
            boolean approved = dao.approveOrder(orderId);

            if (approved) {
                // Redirect back to order.jsp after approval
                response.sendRedirect(request.getContextPath() + "/admin/orders.jsp");
            } else {
                // Handle approval failure, if needed
                out.println("<h3>Approval failed. Please try again.</h3>");
            }
        } catch (Exception e) {
            // Handle exception if any error occurs during approval process
            out.println("<h3>Error processing approval. Please try again later.</h3>");
            e.printStackTrace();
        }
    } else {
        // Handle invalid request scenario
        out.println("<h3>Invalid request. Please try again.</h3>");
    }
%>
