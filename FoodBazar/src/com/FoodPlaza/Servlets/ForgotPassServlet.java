package com.FoodPlaza.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.FoodPlaza.Utility.DBUtility;

/**
 * Servlet implementation class ForgotPassServlet
 */
@WebServlet("/ForgotPassServlet")
public class ForgotPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Connection con=DBUtility.connection();
		PreparedStatement stmt;
		RequestDispatcher rd=null;
		String username=request.getParameter("email");
		String password=request.getParameter("pass");
		String type=request.getParameter("ftype");
		
		if(type.equals("Customer"))
		{
			String str="update Customer  set CustPassword=? where CustEmail=?";
			try
	    	{
	    	stmt=con.prepareStatement(str);
	    	stmt.setString(1,password);
	    	stmt.setString(2,username);
	    	
	    	
	    	int row=stmt.executeUpdate();   //return type of executeupdate is int, it returns ROWS affected in DATABASE
	    	if(row>0)
			{
				request.setAttribute("status","<b align:center;>Your password has changed successfully,Now You can LOGIN<b>");
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
			else
			{
				request.setAttribute("status","<b align:center;>Failed to Update Password<b>");
				rd=request.getRequestDispatcher("ForgotPassword.jsp");
				rd.forward(request, response);
			}
	    	}
	    	catch(SQLException e)
	    	{
	    		e.printStackTrace();
	    	}
		}
		    
		
		if(type.equals("Admin"))
		{
			String str="update Admin  set adminPassword=? where adminEmail=?";
			try
	    	{
	    	stmt=con.prepareStatement(str);
	    	stmt.setString(1,password);
	    	stmt.setString(2,username);
	    	
	    	
	    	int row=stmt.executeUpdate();   //return type of executeupdate is int, it returns ROWS affected in DATABASE
	    	if(row>0)
			{
				request.setAttribute("status","<b align:center;>Your password has changed successfully,Now You can LOGIN<b>");
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
			else
			{
				request.setAttribute("status","<b align:center;>Failed to Update Passwords<b>");
				rd=request.getRequestDispatcher("ForgotPassword.jsp");
				rd.forward(request, response);
			}
	    	}
	    	catch(SQLException e)
	    	{
	    		e.printStackTrace();
	    	}
		}
		
    	
			
			
		
	}

}
