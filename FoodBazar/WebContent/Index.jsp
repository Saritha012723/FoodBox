<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Food Plaza</title>

<style type="text/css">
.img
{
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
</style>
</head>
<body>

<h1 align="center">Welcome to FoodBox </h1>
<%
String status=(String)request.getAttribute("status");
if(status!=null)
{
   out.println(status);	
}
%>

<hr>
<%
   String active=(String)session.getAttribute("usertype");
   if(active==null)
   {
%>
   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="SignUp.jsp">SIGN UP</a>&emsp;&emsp;
   <a href="login.jsp">LOGIN</a>
   
<%   
   }
%>

<%
   String user=(String)session.getAttribute("usertype");
   if(user!=null && user=="Admin")
   {
%>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="AddFood.jsp">Add Food</a>&emsp;&emsp;
     <a href="ShowCustomers.jsp">All Customers</a>
<%
     
   }
%>

<%
 String user1=(String)session.getAttribute("usertype");
   if(user1!=null && user1=="Customer")
   {
%>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="ShowMyCart.jsp">Show My Cart</a>&emsp;&emsp;
    <a href="ShowMyProfile.jsp">Show My Profile</a>
<%   
   }
%>

 
   
<hr>
<br>
   
   


     <img align="middle" src="https://th.bing.com/th/id/OIP.muxToCvgWbEPnH8RRiUjagHaEo?w=306&h=191&c=7&o=5&dpr=1.5&pid=1.7" style="width: 650px; height: 350px;" class="img"><br>
     



<hr>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="ShowFoods.jsp">SHOW AVAILABLE FOODS</a>&emsp;&emsp;
<a href="ForgotPassword.jsp">FORGET PASSWORD</a>&emsp;&emsp;

<%
   String user2=(String)session.getAttribute("usertype");
   String email=(String)session.getAttribute("USERNAME");
   if(user2!=null && user2=="Admin")
   {
%>
    <a href="ShowAdminProfile.jsp">Show My Admin Profile</a>&emsp;&emsp;
    
    <%-- <a href="AdminServ?adminEmail=<%=email %>&action=deleteAdmin>">Delete My Admin Account</a> --%>
<%    
   }
%>

<%
   String active1=(String)session.getAttribute("usertype");
   if(active1!=null)
   {
%>
    <a href="LoginServlet">LOGOUT</a>    
<%   
   }
%>

<hr>
</body>
</html>