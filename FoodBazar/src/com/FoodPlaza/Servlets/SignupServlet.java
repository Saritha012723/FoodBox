package com.FoodPlaza.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.FoodPlaza.Dao.AdminDaoImp;
import com.FoodPlaza.Dao.CustomerDaoImp;
import com.FoodPlaza.Dao.LoginDaoImp;
import com.FoodPlaza.Pojo.Admin;
import com.FoodPlaza.Pojo.Customer;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		RequestDispatcher rd=null;
		
		
		CustomerDaoImp cd=new CustomerDaoImp();
		AdminDaoImp ad=new AdminDaoImp();
		String name=request.getParameter("sname");
		String address=request.getParameter("saddress");
		String contact=request.getParameter("scontact");
		String username=request.getParameter("email");
		String password=request.getParameter("pass");
		String type=request.getParameter("stype");
		
		    
		if(type.equals("Customer"))
		{
			Customer c=new Customer(name, username, address, contact);
			c.setCustPassword(password);
			boolean flag=cd.addCustomer(c);
			if(flag==true)
			{
				request.setAttribute("status","<b align:center;>You have succesfully signed up,Now You can LOGIN<b>");
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
			else
			{
				request.setAttribute("status","<b align:center;>Failed to sign up<b>");
				rd=request.getRequestDispatcher("SignUp.jsp");
				rd.forward(request, response);
			}
		}
			
		if(type.equals("Admin"))
		{
			Admin a=new Admin(name,username , address, contact);
			a.setAdminPassword(password);
			boolean flag=ad.addAdmin(a);
			if(flag==true)
			{
				request.setAttribute("status","<b align:center;>You have succesfully signed up,Now You can LOGIN<b>");
				rd=request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
			else
			{
				request.setAttribute("status","<b align:center;>Failed to sign up<b>");
				rd=request.getRequestDispatcher("SignUp.jsp");
				rd.forward(request, response);
			}
		}	
			
		
	}

}
