package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Order;

public class BookOrderlmpl implements BookOrderDAO {
	
	private Connection conn;

	public BookOrderlmpl(Connection conn) {
		super();
		this.conn = conn;
	}


	/*@Override
	 public int getOrderNo() {
		int i =1;
		try
		{
			String sql = "Select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return i;
	}*/




	@Override
	public boolean saveOrder(List<Book_Order> blist) {
		boolean f = false;
		try
		{
			String sql  ="Insert into book_order(order_id,user_name,email,address,phno,book_name,author,price,payment,approval_status,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for (Book_Order b:blist)
			{
				ps.setString(1,b.getOrderId());
				ps.setString(2,b.getUserName());
				ps.setString(3,b.getEmail());
				ps.setString(4,b.getFulladd());
				ps.setString(5,b.getPhno());
				ps.setString(6,b.getBookName());
				ps.setString(7,b.getAuthor());
				ps.setString(8,b.getPrice());
				ps.setString(9,b.getPaymentType());
				ps.setString(10, b.getApprovalStatus());
				ps.setString(11, b.getStatus());
				
				//ps.setBoolean(10, b.isDuyetDonDat()); // Set the approval status
				
				ps.addBatch();
				
			}
			int [] count = ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public List<Book_Order> getBook(String email) {
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null; 
		
		try
		{
			String sql="Select * from book_order where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,email);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o = new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				
				
				o.setApprovalStatus(rs.getString(11)); // Retrieve approval status
				o.setStatus(rs.getString(12) != null ? rs.getString(12) : "Order Processing");
				list.add(o);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Book_Order> getAllOrder() {
		
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null; 
		
		try
		{
			String sql="Select * from book_order ";
			PreparedStatement ps = conn.prepareStatement(sql);	
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				o = new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				
				o.setApprovalStatus(rs.getString(11)); // Retrieve approval status
				o.setStatus(rs.getString(12) != null ? rs.getString(12) : "Order Processing");
				list.add(o);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}


	@Override
    public boolean approveOrder(String orderId) {
        boolean success = false;
        try {
            String sql = "UPDATE book_order SET approval_status = TRUE, status = 'Order Success' WHERE order_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, orderId);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }



	@Override
    public boolean updateApprovalStatus(String orderId, boolean approved) {
        boolean success = false;

        String sql = "UPDATE book_order SET approval_status = ?, status = ? WHERE order_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setBoolean(1, approved);
            ps.setString(2, approved ? "Order Success" : "Order Processing");
            ps.setString(3, orderId);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }


	@Override
	public boolean updateOrderStatus(String orderId, String status) {
		boolean success = false;
	    String sql = "UPDATE book_order SET status = ? WHERE order_id = ?";
	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, status);
	        ps.setString(2, orderId);

	        int rowsUpdated = ps.executeUpdate();
	        if (rowsUpdated > 0) {
	            success = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return success;
	}


	@Override
	public Book_Order getOrderById(String orderId) {
		Book_Order order = null;
        String sql = "SELECT * FROM book_order WHERE order_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, orderId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                order = new Book_Order();
                order.setOrderId(rs.getString("order_id"));
                order.setUserName(rs.getString("user_name"));
                order.setEmail(rs.getString("email"));
                order.setFulladd(rs.getString("fulladd"));
                order.setPhno(rs.getString("phno"));
                order.setBookName(rs.getString("book_name"));
                order.setAuthor(rs.getString("author"));
                order.setPrice(rs.getString("price"));
                order.setPaymentType(rs.getString("payment_type"));
                order.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
	}


	@Override
	public double calculateTotalApprovedAmount() {
		double totalAmount = 0.0;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT SUM(price) AS total_amount FROM book_order WHERE status = 'Order Success'";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                totalAmount = rs.getDouble("total_amount");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return totalAmount;
	}

	
}

