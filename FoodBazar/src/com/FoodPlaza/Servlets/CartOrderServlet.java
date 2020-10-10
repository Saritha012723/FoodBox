package com.FoodPlaza.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FoodPlaza.Dao.CartDaoImp;
import com.FoodPlaza.Dao.OrderDaoImp;

/**
 * Servlet implementation class CartOrderServlet
 */
@WebServlet("/CartOrderServlet")
public class CartOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd;
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("USERNAME");
		OrderDaoImp od=new OrderDaoImp();
		CartDaoImp cd=new CartDaoImp();
		String action=request.getParameter("action");
		
		if(action.equals("deleteCart"))
		{
			int cartId=Integer.parseInt(request.getParameter("cartId"));
		boolean flag=cd.deleteCartById(cartId);
		if(flag==true)
		{
			request.setAttribute("status","<b align:center;>Selected Cart Deleted Successfully...<b>");
			rd=request.getRequestDispatcher("ShowMyCart.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Cart Not Deleted....<b>");
			rd=request.getRequestDispatcher("ShowMyCart.jsp");
			rd.forward(request, response);
		}
		
		}
		
		if(action.equals("clearCart"))
		{
			
			
		boolean flag=cd.clearCart(email);
		if(flag==true)
		{
			request.setAttribute("status","<b align:center;>Cart Deleted Successfully...<b>");
			rd=request.getRequestDispatcher("ShowMyCart.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Cart Not Deleted....<b>");
			rd=request.getRequestDispatcher("ShowMyCart.jsp");
			rd.forward(request, response);
		}
		
		}
		
		
		if(action.equals("orderCart"))
		{
			int cartId=Integer.parseInt(request.getParameter("cartId"));
            double price=Double.parseDouble(request.getParameter("fprice"));
            String foodname=(String)request.getParameter("orderFood");
		boolean flag=od.placeOrder(email, foodname, price, cartId);
		if(flag==true)
		{
			request.setAttribute("status","<b align:center;>"+foodname+" Successfully Ordered. Your Total Bill is "+price+" <b>");
			rd=request.getRequestDispatcher("ShowFoods.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Cart Not Deleted....<b>");
			rd=request.getRequestDispatcher("ShowMyCart.jsp");
			rd.forward(request, response);
		}
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
