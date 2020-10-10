<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.FoodPlaza.Dao.*"%>
<%@ page import ="com.FoodPlaza.Pojo.*"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Available Food</title>
</head>
<body>

<%
    List<Food> l=new ArrayList<Food>();
    FoodDaoImp fd=new FoodDaoImp();
    l=fd.getAllFood();
    String user=(String)session.getAttribute("usertype");
%>

<div align="center">
         <form  >
             <fieldset>
                       <legend><b>Available Foods</b></legend>
                       
<%
String status=(String)request.getAttribute("status");
if(status!=null)
{
   out.println(status);	
}
%>

              <table border="1" cellpadding="5">
              
            <tr bgcolor="Red">
                <td>Food Id</td>
                <td>Food Name</td>
                <td>Food Type</td>
                <td>Food Category</td>
                <td>Food Description</td>
                <td>Food Price</td>
                
                
           <% 
           if(user!=null && user=="Admin")
             {
           %>
                 <td colspan="2">Action</td>
           <%
             }  
           %>
           
            <% 
           if(user!=null && user=="Customer")
             {
           %>
               <!--   <td>Quantity</td> -->
                 <td>Action</td>
           <%
             }  
           %>   
                
            </tr>
            
             
            <% 
                 for(Food f:l)
                 {
                	 int foodid=f.getFoodId();
                	 String foodname=f.getFoodName();
            %>
              <tr bgcolor="yellow">
                 <td><%=foodid%></td>
                 <td><%=foodname%></td>
                 <td><%=f.getFoodType() %></td>
                 <td><%=f.getFoodCategory() %></td>
                 <td><%=f.getFoodDescription() %></td>
                 <td><%=f.getPrice()%></td>
                 
                 
                  <% 
           if(user!=null && user=="Customer")
             {
           %>
              <!--  <td><input type="text" name="quantity"></td> -->
               <td><a href="UpdateFoodServ?foodId=<%=foodid %>&<%-- quantity=<%=(String)request.getParameter("quantity") %> --%>&foodName=<%=foodname %>&price=<%=f.getPrice() %>&action=addToCart">Add to Cart</a></td>                
               </tr>
           <%
             }  
           %>    
                 
             <% 
           if(user!=null && user=="Admin")
             {
           %>
               <td><a href="UpdateFoodServ?foodId=<%=foodid %>&action=Delete">Delete</a></td>
               <td><a href="UpdateFoodServ?foodId=<%=foodid %>&action=Update">Update</a></td>  
               </tr>
           <%
             }  
           %> 
           
            
                             
             
            <%
              }
            %>
           
            
        </table>
        <a href="Index.jsp" align="center">Go to Home</a>
             </fieldset>   
         </form>
</div>
         
</body>
</html>