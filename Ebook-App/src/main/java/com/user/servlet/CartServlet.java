package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.DAO.BookDaolmpl;
import com.DAO.CartDAOlmpl;
import com.entity.BookDtls;
import com.entity.Cart;
import com.DB.DBConnect;


@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try
		{
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			BookDaolmpl dao = new BookDaolmpl(DBConnect.getConn());
			BookDtls b =dao.getBookById(bid);
			
			Cart c= new Cart();
			c.setBid(bid);
			c.setUserid(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOlmpl dao2 = new CartDAOlmpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession session = req.getSession();
			
			
			if(f)
			{
				session.setAttribute("addCart", "Book Added to cart");
				resp.sendRedirect("all_new_book.jsp");
				
			}
			else
			{
				session.setAttribute("failed", "Something wrong on server");
				resp.sendRedirect("all_new_book.jsp");
			}
		}	
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}
