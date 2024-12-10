package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BookOrderlmpl;
import com.DB.DBConnect;

@WebServlet("/approveOrder")
public class ApproveOrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String orderId = req.getParameter("orderId");

        BookOrderlmpl dao = new BookOrderlmpl(DBConnect.getConn());
        boolean success = dao.approveOrder(orderId);

        if (success) {
            resp.sendRedirect("order.jsp"); // Redirect to user's order view
        } else {
            // Handle error case
            resp.sendRedirect("error.jsp");
        }
	}
	
}
