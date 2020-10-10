<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
<style>
   fieldset
   {
      border:2px solid green;
    -moz-border-radius:8px;
    -webkit-border-radius:8px;	
    border-radius:16px;
    background-color: yellow;
   }
</style>
<script>
function validate()
{
	var userEmail=document.getElementById("userid").value;
	var userPass=document.getElementById("userpass").value;
	var userCpass=document.getElementById("usercpass").value;
	
	if(userEmail=="")
		{
		  document.getElementById("useridError").innerHTML="Please enter Email id";
		  return false;
		}
	
	else
		{
		  document.getElementById("useridError").innerHTML=("");
		}
	
	if(userPass=="")
	{
	  document.getElementById("userpassError").innerHTML="Please enter password";
	  return false;
	}
	
	else
	{
	  document.getElementById("userpassError").innerHTML=("");
	}
	
	if(userPass.length<5 || userPass.length>8)
		{
		 document.getElementById("userpassError").innerHTML="Please enter Valid password between 5 to 8 Character";
		  return false;
		}
	
	else
	{
	  document.getElementById("userpassError").innerHTML=("");
	}
	
	if(userCpass=="")
	{
	  document.getElementById("usercpassError").innerHTML="Please re-enter password";
	  return false;
	}
	
	else
	{
	  document.getElementById("usercpassError").innerHTML=("");
	}
	
	if(userCpass!=userPass)
	{
	  document.getElementById("usercpassError").innerHTML="Confirm Password should be same as Password";
	  return false;
	}
	
	else
	{
	  document.getElementById("usercpassError").innerHTML=("");
	}
	
	return true;
}
</script>
</head>
<body>
    <div align="center">
      <h1 style="color:red">FoodBox</h1>
      <hr>
<%
String status=(String)request.getAttribute("status");
if(status!=null)
{
   out.println(status);	
}
%>
         <form onsubmit="return validate()" action="ForgotPassServlet" method="post">
            <fieldset>
            <legend>FORGOT PASSWORD</legend>
                  <table>
                  
                      <tr>
                  <%--     <%
                           String user=(String)request.getAttribute("usertype");
                           if(user!=null && user.equals("Customer"))
                           {
                      %> --%>
                        <td><INPUT TYPE="radio" NAME="ftype" VALUE="Customer">Customer</td>
                     <%--  <%
                           }
                      %> --%>
                     <%--  
                      <%
                           if(user!=null && user.equals("Admin"))
                           {
                      %> --%>
                         <td><INPUT TYPE="radio" NAME="ftype" VALUE="Admin">Admin</td>
                     <%--  <%
                           }
                      %> --%>
                        
                       
                      </tr>
                      
                      <tr>
                        <td>Email Id : </td>
                        <td><input type="email" id="userid" name="email" placeholder="Enter Email-Id"></td>
                        <td><span id="useridError" style="color:red">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Password : </td>
                        <td><input type="password" id="userpass" name="pass" placeholder="Enter password"></td>
                        <td><span id="userpassError" style="color:red">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Confirm Password : </td>
                        <td><input type="password" id="usercpass" name="cpass" placeholder="Enter same password"></td>
                        <td><span id="usercpassError" style="color:red">*</span></td>
                      </tr>
                      
                      <tr>
                        <td><a href="Index.jsp">Go to Home</a></td>
                        <td><input type="submit" value="confirm"></td>
                      </tr>
                      
                  </table>
            </fieldset>
         </form>
                         
     </div>
</body>
</html>