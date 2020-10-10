<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
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
<script type="text/javascript">
function validate()
{
	var userEmail=document.getElementById("userid").value;
	var userPass=document.getElementById("userpass").value;
	
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
}
</script>
</head>
<body>

   <div align="center">
      <h1 style="color:red">FoodBox</h1>
      
<%
String status=(String)request.getAttribute("status");
if(status!=null)
{
   out.println(status);	
}
%>
         <form onsubmit="return validate()" action="LoginServlet" method="post">
            <fieldset>
            <legend>Login</legend>
                  <table>
                       
                       <tr>
                        <td><INPUT TYPE="radio" NAME="type" VALUE="Customer">Customer</td>
                        <td><INPUT TYPE="radio" NAME="type" VALUE="Admin">Admin</td>
                       
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
                        <td><a href="ForgotPassword.jsp" style="color:red">forgot password</a></td>
                        <td><input type="submit" value="login"></td>
                      </tr>
                      
                  </table>
                  <a href="Index.jsp" align="center">Go to Home</a>
            </fieldset>
         </form>
                         
     </div>
</body>
</html>