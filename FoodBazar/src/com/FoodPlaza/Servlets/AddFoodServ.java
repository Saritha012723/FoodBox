package com.FoodPlaza.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.FoodPlaza.Dao.FoodDaoImp;
import com.FoodPlaza.Pojo.Food;

/**
 * Servlet implementation class Food
 */
@WebServlet("/AddFoodServ")
public class AddFoodServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFoodServ() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//doGet(request, response);
		Food f=new Food();
		FoodDaoImp fdao=new FoodDaoImp();
		RequestDispatcher rd;
		
		
		
	
		
		String foodname=request.getParameter("fname");
		String foodtype=request.getParameter("ftype"); 
		String foodcategory=request.getParameter("fcategory"); 
		String foodDes=request.getParameter("fdesc"); 
		double foodprice=Double.parseDouble(request.getParameter("fprice")); 
		
		f=new Food(foodname, foodtype, foodcategory, foodDes, foodprice);
		boolean flag=fdao.addFood(f);
		if(flag==true)
		{
			request.setAttribute("status","<b align:center;>Food Added Successfully...<b>");
			rd=request.getRequestDispatcher("AddFood.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Food Not Added..<b>");
			rd=request.getRequestDispatcher("AddFood.jsp");
			rd.forward(request, response);
		}
	
	
	
	}

}
