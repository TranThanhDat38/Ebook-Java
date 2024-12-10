package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DAO.BookOrderlmpl;
import com.DB.DBConnect;

@WebServlet("/approveOrderServlet")
public class ApproveOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String orderIdStr = req.getParameter("orderId");
            if (orderIdStr != null) {
                int orderId = Integer.parseInt(orderIdStr);
                BookOrderlmpl dao = new BookOrderlmpl(DBConnect.getConn());
                boolean success = dao.approveOrder(orderId); // Approve order
                
                if (success) {
                    boolean updateStatusSuccess = dao.updateOrderStatus(orderId, "Order Success");
                    if (updateStatusSuccess) {
                        resp.sendRedirect(req.getContextPath() + "/admin/orders.jsp"); // Redirect back to admin orders page
                    } else {
                        resp.sendRedirect(req.getContextPath() + "/admin/orders.jsp?error=status_update_failed"); // Handle failure to update status
                    }
                } else {
                    resp.sendRedirect(req.getContextPath() + "/admin/orders.jsp?error=approval_failed"); // Handle failure to approve order
                }
            } else {
                resp.sendRedirect(req.getContextPath() + "/admin/orders.jsp?error=missing_order_id"); // Handle case where orderId parameter is missing
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin/orders.jsp?error=internal_error"); // Handle any internal error
        }
    }
}