<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="com.FoodPlaza.Dao.*"%>
<%@ page import ="com.FoodPlaza.Pojo.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Profile</title>
</head>
<body>
<%
    String email=(String)session.getAttribute("USERNAME");
    AdminDaoImp ad=new AdminDaoImp();
    Admin a=ad.getAdminById(email);
%>

<div align="center">
         <form  >
             <fieldset>
                       <legend><b>Admin Profile</b></legend>
                       
<%
String status=(String)request.getAttribute("status");
if(status!=null)
{
   out.println(status);	
}
%>
              
                        <table border="1" cellpadding="5">
            
            <tr bgcolor="Green">
                <td>Admin Id</td>
                <td>Admin Name</td>
                <td>Admin Email</td>
                <td>Admin Address</td>
                <td>Admin Contact</td>
                <td>Action</td>
                   
            </tr>
            
             
         
              <tr bgcolor="yellow">
                 <td><%=a.getAdminId()%></td>
                 <td><%=a.getAdminName()%></td>
                 <td><%=a.getAdminEmail() %></td>
                 <td><%=a.getAdminAddress() %></td>
                 <td><%=a.getAdminContact() %></td>
                 <td><a href="AdminServ?adminId=<%=a.getAdminId() %>&action=updateAdmin">Update</a></td>  
             </tr>
           
            
        </table>
        <a href="Index.jsp" align="center">Go to Home</a>
             </fieldset>   
         </form>
</div>

</body>
</html>