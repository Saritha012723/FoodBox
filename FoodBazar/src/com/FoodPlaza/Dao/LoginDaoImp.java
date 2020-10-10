package com.FoodPlaza.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.FoodPlaza.Pojo.LoginPojo;
import com.FoodPlaza.Utility.DBUtility;


public class LoginDaoImp implements loginDao
{
	String str;
	PreparedStatement stmt;
	ResultSet rs;
	int row=0;
	LoginPojo l;
    static Connection con;
    
	@Override
	public boolean CustomerLogin(String username, String password) 
	{
		    con=DBUtility.connection();
	    	str="insert into CustomerLogin(username,password) values(?,?);";
	    	try
	    	{
	    	stmt=con.prepareStatement(str);
	    	stmt.setString(1,username);
	    	stmt.setString(2,password);
	    	
	    	row=stmt.executeUpdate();   //return type of executeupdate is int, it returns ROWS affected in DATABASE
	    	if(row>0)
	    		return true;
	    	else
	    		return false;
	    	}
	    	catch(SQLException e)
	    	{
	    		e.printStackTrace();
	    	}
	    	return false;
	    	 
	 }

	@Override
	public boolean AdminLogin(String username, String password) 
	{
		 con=DBUtility.connection();
	    	str="insert into AdminLogin(username,password) values(?,?);";
	    	try
	    	{
	    	stmt=con.prepareStatement(str);
	    	stmt.setString(1,username);
	    	stmt.setString(2,password);
	    	
	    	row=stmt.executeUpdate();   //return type of executeupdate is int, it returns ROWS affected in DATABASE
	    	if(row>0)
	    		return true;
	    	else
	    		return false;
	    	}
	    	catch(SQLException e)
	    	{
	    		e.printStackTrace();
	    	}
	    	return false;
	}

	
	
	
}


