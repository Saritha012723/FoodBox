<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="com.FoodPlaza.Dao.*"%>
<%@ page import ="com.FoodPlaza.Pojo.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
</head>
<body>
<%
    String user=(String)session.getAttribute("usertype");
    String email=(String)session.getAttribute("USERNAME");
    List<Cart> l=new ArrayList<Cart>();
    CartDaoImp cd=new CartDaoImp();
    l=cd.showCart(email);
%>

<div align="center">
         <form  >
             <fieldset>
                       <legend><b>My Cart</b></legend>
                       
<%
String status=(String)request.getAttribute("status");
if(status!=null)
{
   out.println(status);	
}
%>

              <table border="1" cellpadding="5">
              
            <tr bgcolor="red">
                <td>Cart Id</td>
                <td>Food Id</td>
                <td>Food Name</td>
                <td>Quantity</td>
                <td>Price</td> 
                <td colspan="2">Action</td>
            </tr>
            
             
            <% 
                 for(Cart c:l)
                 {
                	 int cartid=c.getCartId();
                	 int foodid=c.getFoodId();
            %>
              <tr bgcolor="yellow">
                 <td><%=cartid%></td>
                 <td><%=foodid%></td>
                 <td><%=c.getFoodName()%></td>
                 <td><%=c.getQuantity()%></td>
                 <td><%=c.getPrice() %></td>   
                 <td><a href="CartOrderServlet?cartId=<%=cartid%>&action=orderCart&orderFood=<%=c.getFoodName()%>&fprice=<%=c.getPrice()%>">Order</a></td>
                 <td><a href="CartOrderServlet?cartId=<%=cartid%>&action=deleteCart">Delete</a></td>  
               </tr>
           <%
             }  
           %>    
           
           
            
        </table>
<%
 String user1=(String)session.getAttribute("usertype");
   if(user1!=null && user1=="Customer")
   {
%>
   <a href="CartOrderServlet?action=clearCart">Clear My Cart</a>
<%  
   }
%>
   <a href="Index.jsp" align="center">Go to Home</a>
        
             </fieldset>   
         </form>
</div>
</body>
</html>