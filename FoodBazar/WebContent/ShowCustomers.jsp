<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.FoodPlaza.Dao.*"%>
<%@ page import ="com.FoodPlaza.Pojo.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Total Customer</title>
</head>
<body>

<%
    List<Customer> l=new ArrayList<Customer>();
    CustomerDaoImp cd=new CustomerDaoImp();
    l=cd.getAllCustomer();
%>

<div align="center">
         <form  >
             <fieldset>
                       <legend><b>Available Customer</b></legend>
                       
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
            
             
            <% 
                 for(Customer c:l)
                 {
                	 int Custid=c.getCustId();
            %>
              <tr bgcolor="yellow">
                 <td><%=Custid%></td>
                 <td><%=c.getCustName()%></td>
                 <td><%=c.getCustEmail() %></td>
                 <td><%=c.getCustAddress() %></td>
                 <td><%=c.getContactNo() %></td>
                 <td><a href="CustomerServ?custId=<%=Custid %>&action=DeleteCus">Delete</a></td>
                        
                
             </tr>
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