package com.DAO;

import java.util.List;

import com.entity.Book_Order;

public interface BookOrderDAO {
	
	//public int getOrderNo();
	
	public boolean saveOrder(List<Book_Order> b);
	
	public List<Book_Order> getBook(String email);
	
	public List<Book_Order> getAllOrder();
	
	public boolean approveOrder(String orderId);
	
	public boolean updateApprovalStatus(String orderId, boolean approved);
	
	public boolean updateOrderStatus(String orderId, String status);
	
	public Book_Order getOrderById(String orderId);
	
	public double calculateTotalApprovedAmount();
}
