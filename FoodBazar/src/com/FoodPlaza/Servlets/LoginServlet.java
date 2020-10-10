package com.FoodPlaza.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FoodPlaza.Utility.DBUtility;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		RequestDispatcher rd;
		session.invalidate();
		String statusString="<b >Successfully Logged Out.....</b>";
		request.setAttribute("status",statusString);
		rd=request.getRequestDispatcher("Index.jsp");
		rd.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		RequestDispatcher rd;
		PreparedStatement stmt;
		ResultSet rs;
		Connection con=DBUtility.connection();
		String USERNAME=request.getParameter("email");
		String PASSWORD=request.getParameter("pass");
		int count=0;
		
		String type=request.getParameter("type");
		
		if(type.equals("Customer"))
		{
			
			String str="select * from Customer";
			try
			{
				stmt= con.prepareStatement(str);
				rs=stmt.executeQuery();
				while(rs.next())
				{		
					
					if(USERNAME.equals(rs.getString("CustEmail"))&& PASSWORD.equals(rs.getString("CustPassword")))
					{
						count=1;
					}
					
				}
				if(count==1)
				{
					String statusString="You have Successfully Logined as "+"<b style=color:red;>"+USERNAME+"<b>";
					request.setAttribute("status",statusString);
					
					rd=request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);
					HttpSession session=request.getSession();
					session.setAttribute("USERNAME",USERNAME);
					session.setAttribute("usertype","Customer");
					
					count=0;
				}
				else
				{
					String statusString="<b>Failed to Login... Please try again...</b>";
					request.setAttribute("status",statusString);
					rd=request.getRequestDispatcher("Index.jsp");
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
			String str="select * from Admin";
			try
			{
				stmt= con.prepareStatement(str);
				rs=stmt.executeQuery();
				while(rs.next())
				{		
					
					if(USERNAME.equals(rs.getString("adminEmail"))&& PASSWORD.equals(rs.getString("adminPassword")))
					{
						count=1;
					}
					
				}
				if(count==1)
				{
					String statusString="You have Successfully Logined as "+"<b style=color:red;>"+USERNAME+"<b>";
					request.setAttribute("status",statusString);
					HttpSession session=request.getSession();
					session.setAttribute("USERNAME",USERNAME);
					session.setAttribute("usertype","Admin");
					rd=request.getRequestDispatcher("Index.jsp");
					rd.forward(request, response);
					
					count=0;
				}
				else
				{
					String statusString="<b >Failed to Login... Please try again...</b>";
					request.setAttribute("status",statusString);
					rd=request.getRequestDispatcher("Index.jsp");
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
