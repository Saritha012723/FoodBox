<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="com.FoodPlaza.Dao.*"%>
<%@ page import ="com.FoodPlaza.Pojo.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
</head>
<body>
<%
    String email=(String)session.getAttribute("USERNAME");
    CustomerDaoImp cd=new CustomerDaoImp();
    Customer c=cd.getCustById(email);
%>

<div align="center">
         <form  >
             <fieldset>
                       <legend><b>My Profile</b></legend>
                       
<%
String status=(String)request.getAttribute("status");
if(status!=null)
{
   out.println(status);	
}
%>
              
                        <table border="1" cellpadding="5">
            
            <tr bgcolor="Green">
                <td>Customer Id</td>
                <td>Customer Name</td>
                <td>Customer Email</td>
                <td>Customer Address</td>
                <td>Customer Contact</td>
                <td>Action</td>
                   
            </tr>
            
             
         
              <tr bgcolor="yellow">
                 <td><%=c.getCustId()%></td>
                 <td><%=c.getCustName()%></td>
                 <td><%=c.getCustEmail() %></td>
                 <td><%=c.getCustAddress() %></td>
                 <td><%=c.getContactNo() %></td>
                 <td><a href="CustomerServ?custId=<%=c.getCustId() %>&action=updateCus">Update</a></td>  
             </tr>
           
            
        </table>
        <a href="Index.jsp" align="center">Go to Home</a>
             </fieldset>   
         </form>
</div>
</body>
</html>