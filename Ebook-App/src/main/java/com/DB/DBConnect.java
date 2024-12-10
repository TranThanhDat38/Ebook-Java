package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
	private static Connection conn;
	public static Connection getConn()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("JDBC Driver found!");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app","root","123@dat");
		}
		catch (Exception e)
		{
			System.out.println("JDBC Driver not found!");
			e.printStackTrace();
		}
		return conn;
	}
	
}
