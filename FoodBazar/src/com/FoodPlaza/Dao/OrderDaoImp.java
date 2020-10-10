package com.FoodPlaza.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.FoodPlaza.Pojo.Order;
import com.FoodPlaza.Utility.DBUtility;

public class OrderDaoImp implements OrderDao
{
	    Order o;
	    String str;
	    PreparedStatement stmt;
	    ResultSet rs;
	    int row=0,row1=0;
	    static Connection con=DBUtility.connection();
	    
		@Override
		public boolean placeOrder(String email,String foodName,double price,int cartId) 
		{
		   double bill;
		   LocalDate ld=LocalDate.now();
		   String date=ld.toString();
		 
		   try {
				String str1;
				str1="insert into FoodOrder(Email,Date,Total_Bill,FoodName) values (?,?,?,?)";
				stmt=con.prepareStatement(str1);
				stmt.setString(1,email);
				stmt.setString(2,date);
				stmt.setDouble(3,price);
				stmt.setString(4,foodName);
				row=stmt.executeUpdate();
	
		   }
		   catch(SQLException e)
		   {
			   System.out.println(e);
		   }
		   if(row>0)
		   {
			   String sql="delete from cart where CartId=?";
			   try {
			   stmt=con.prepareStatement(sql);
				stmt.setInt(1,cartId);
				row1=stmt.executeUpdate();
			   }
			   
			   catch(Exception e)
			   {
				   e.printStackTrace();
			   }
		   }
			   
		   if(row>0&&row1>0)
		   {
			   return true;
		   }
		   else
		   {
			   return false;
		   }
		}
		@Override
		public List<Order> showOrder(String email) 
		{
		     Order od=null;
		     List<Order> oli=new ArrayList<>();
		     
		     try 
		     {
		    	 String str="select * from FoodOrder where Email=?";
		    	 stmt=con.prepareStatement(str);
		    	 stmt.setString(1,email);
		    	 rs=stmt.executeQuery();
		    	 while(rs.next())
		    	 {
		    		 od=new Order();
		    		 od.setOrderId(rs.getInt("OrderId"));
		    		 od.setEmail(rs.getString("Email"));
		    		 od.setDate(rs.getString("Date"));
		    		 od.setTotalBill(rs.getInt("Total_Bill"));
		    		 oli.add(od);
		    	 }
		     }
		     catch(SQLException e)
		     {
		    	 e.printStackTrace();
		     }
		     
		     return oli;
		}

	
	
}
