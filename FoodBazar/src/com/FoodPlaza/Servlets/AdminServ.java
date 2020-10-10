package com.FoodPlaza.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FoodPlaza.Dao.AdminDaoImp;
import com.FoodPlaza.Pojo.Admin;

/**
 * Servlet implementation class AdminServ
 */
@WebServlet("/AdminServ")
public class AdminServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServ() {
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
		AdminDaoImp adao=new AdminDaoImp();
		RequestDispatcher rd;
//		if(action.equals("deleteAdmin"))
//		{
//			String adminEmail=(String)request.getParameter("adminEmail");
//			HttpSession session=request.getSession();
//			session.invalidate();
//			boolean flag=adao.deleteAdmin(adminEmail);
//			
//			if(flag==true)
//			{
//				request.setAttribute("status","<b align:center;>Admin Deleted Successfully...<b>");
//				rd=request.getRequestDispatcher("Index.jsp");
//				rd.forward(request, response);
//			}
//			else
//			{
//				request.setAttribute("status","<b align:center;>Customer Not Deleted....<b>");
//				rd=request.getRequestDispatcher("Index.jsp");
//				rd.forward(request, response);
//			}
//		}
		
		if(action.equals("updateAdmin"))
		{
			int adminid=Integer.parseInt(request.getParameter("adminId"));
			 Admin a=adao.getAdminById(adminid);
			 request.setAttribute("Admin", a);
			 rd=request.getRequestDispatcher("updateAdmin.jsp");
		     rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		//doGet(request, response);
		Admin a=new Admin();
		AdminDaoImp adao=new AdminDaoImp();
		RequestDispatcher rd;
		int adminid=Integer.parseInt(request.getParameter("aid"));
		String adminname=request.getParameter("aname");
		String adminaddress=request.getParameter("aaddress"); 
		String admincontact=request.getParameter("acontact");
		String adminemail=request.getParameter("aemail");
		
		a=new Admin(adminname, adminemail, adminaddress, admincontact);
		a.setAdminId(adminid);
		boolean flag=adao.updateAdmin(a);
		if(flag==true)
		{
			request.setAttribute("status","<b align:center;>Admin Profile Updated Successfully...<b>");
			rd=request.getRequestDispatcher("ShowAdminProfile.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("status","<b align:center;>Admin Profile Not Updated..<b>");
			rd=request.getRequestDispatcher("ShowAdminProfile.jsp");
			rd.forward(request, response);
	}
	}

}
