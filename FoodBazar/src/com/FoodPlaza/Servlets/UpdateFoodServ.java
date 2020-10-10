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
import com.FoodPlaza.Dao.FoodDaoImp;
import com.FoodPlaza.Pojo.Cart;
import com.FoodPlaza.Pojo.Food;

/**
 * Servlet implementation class updateFoodServ
 */
@WebServlet("/UpdateFoodServ")
public class UpdateFoodServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFoodServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
//		int quantity=

		
		String action=(String)request.getParameter("action");
		Food f=new Food();
		FoodDaoImp fdao=new FoodDaoImp();
		RequestDispatcher rd;
		
		
	if(action.equals("Delete"))
	{
		int foodid=Integer.parseInt(request.getParameter("foodId"));
		boolean flag=fdao.deleteFoodById(foodid);
		if(flag==true)
		{
			request.setAttribute("status","<b align:center;>Food Deleted Successfully...<b>");
			rd=request.getRequestDispatcher("ShowFoods.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Food Not Deleted....<b>");
			rd=request.getRequestDispatcher("ShowFoods.jsp");
			rd.forward(request, response);
		}
	}
		
	
	
	if(action.equals("addToCart"))
	{
		int foodid=Integer.parseInt(request.getParameter("foodId"));
		int quantity=2;
		String foodName=(String)request.getParameter("foodName");
		HttpSession session=request.getSession() ;
		Cart c=new Cart();
		double price=Double.parseDouble(request.getParameter("price"));
		price=price*quantity;
		
		String username=(String)session.getAttribute("USERNAME");
		CartDaoImp cdao=new CartDaoImp();
		c.setFoodId(foodid);
		c.setQuantity(quantity);
		c.setEmail(username);
        c.setFoodName(foodName);
        c.setPrice(price);
        boolean flag=cdao.addToCart(c);
		if(flag==true)
		{
			request.setAttribute("foodName", foodName);
			request.setAttribute("status","<b align:center;>Food Successfully Added to Cart....<b>");
			rd=request.getRequestDispatcher("ShowFoods.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Food Not Added to Cart..<b>");
			rd=request.getRequestDispatcher("ShowFoods.jsp");
			rd.forward(request, response);
		}
		
	}
	
	if(action.equals("Update"))
	{
		int foodid=Integer.parseInt(request.getParameter("foodId"));
	    f=fdao.getFoodById(foodid);
	    request.setAttribute("Food", f);
	    rd=request.getRequestDispatcher("updateFood.jsp");
		rd.forward(request, response);
	    	
	}
	
	
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Food f=new Food();
		FoodDaoImp fdao=new FoodDaoImp();
		RequestDispatcher rd;
		int foodid=Integer.parseInt(request.getParameter("fid"));
		String foodname=request.getParameter("fname");
		String foodtype=request.getParameter("ftype"); 
		String foodcategory=request.getParameter("fcategory"); 
		String foodDes=request.getParameter("fdesc"); 
		double foodprice=Double.parseDouble(request.getParameter("fprice")); 
		
		f=new Food(foodname, foodtype, foodcategory, foodDes, foodprice);
		f.setFoodId(foodid);
		boolean flag=fdao.updateFood(f);
		if(flag==true)
		{
			request.setAttribute("status","<b align:center;>Food Updated Successfully...<b>");
			rd=request.getRequestDispatcher("ShowFoods.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Food Not Updated..<b>");
			rd=request.getRequestDispatcher("ShowFoods.jsp");
			rd.forward(request, response);
		}
		
	}

}
