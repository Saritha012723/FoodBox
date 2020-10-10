package com.FoodPlaza.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.FoodPlaza.Dao.CustomerDaoImp;
import com.FoodPlaza.Pojo.Customer;

/**
 * Servlet implementation class CustomerServ
 */
@WebServlet("/CustomerServ")
public class CustomerServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action=(String)request.getParameter("action");
		CustomerDaoImp cdao=new CustomerDaoImp();
		
		RequestDispatcher rd;
		
		
	if(action.equals("DeleteCus"))
	{
		int Custid=Integer.parseInt(request.getParameter("custId"));
		boolean flag=cdao.deleteCustomer(Custid);
		if(flag==true)
		{
			request.setAttribute("status","<b align:center;>Customer Deleted Successfully...<b>");
			rd=request.getRequestDispatcher("ShowCustomers.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Customer Not Deleted....<b>");
			rd=request.getRequestDispatcher("ShowCustomers.jsp");
			rd.forward(request, response);
		}
	}
	
	if(action.equals("updateCus"))
	{
		int Custid=Integer.parseInt(request.getParameter("custId"));
		 Customer c=cdao.getCustById(Custid);
		 request.setAttribute("Customer", c);
		 rd=request.getRequestDispatcher("updateCustomer.jsp");
	     rd.forward(request, response);
	}
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Customer c=new Customer();
		CustomerDaoImp cdao=new CustomerDaoImp();
		RequestDispatcher rd;
		int custid=Integer.parseInt(request.getParameter("cid"));
		String cname=request.getParameter("cname");
		String caddress=request.getParameter("caddress"); 
		String ccontact=request.getParameter("ccontact");
		String cemail=request.getParameter("cemail");
		
		c=new Customer(cname, cemail, caddress, ccontact);
		c.setCustId(custid);
		boolean flag=cdao.updateCustomer(c);
		if(flag==true)
		{
			request.setAttribute("status","<b align:center;>Profile Updated Successfully...<b>");
			rd=request.getRequestDispatcher("ShowMyProfile.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Profile Not Updated..<b>");
			rd=request.getRequestDispatcher("ShowMyProfile.jsp");
			rd.forward(request, response);
	}
		
	}

}
