<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up </title>
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
	var userName=document.getElementById("uname").value;
	var userAddress=document.getElementById("uaddress").value;
	var userContact=document.getElementById("ucontact").value;
	
	if(userName=="")
	{
	  document.getElementById("unameError").innerHTML="Please enter Name";
	  return false;
	}

    else
	{
	  document.getElementById("unameError").innerHTML=("");
	}
	
	if(userAddress=="")
	{
	  document.getElementById("uaddressError").innerHTML="Please enter Address";
	  return false;
	}

    else
	{
	  document.getElementById("uaddressError").innerHTML=("");
	}
	
	if(userContact=="")
	{
	  document.getElementById("ucontactError").innerHTML="Please enter Contact";
	  return false;
	}

    else
	{
	  document.getElementById("ucontactError").innerHTML=("");
	}
	
	
	
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
      <h1>WELCOME TO FOOD PLAZA</h1>
      
<%
String status=(String)request.getAttribute("status");
if(status!=null)
{
   out.println(status);	
}
%>
         <form onsubmit="return validate()" action="SignupServlet" method="post">
        
            <fieldset>
            <legend>SIGN UP</legend>
                  <table>
                  
                       <tr>
                        <td><INPUT TYPE="radio" NAME="stype" VALUE="Customer">Customer</td>
                        <td><INPUT TYPE="radio" NAME="stype" VALUE="Admin">Admin</td>
                      </tr>
                      
                      <tr>
                        <td>Name : </td>
                        <td><input type="text" id="uname" name="sname" placeholder="Enter Name "></td>
                        <td><span id="unameError" style="color:red">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Address : </td>
                        <td><input type="text" id="uaddress" name="saddress" placeholder="Enter Address "></td>
                        <td><span id="uaddressError" style="color:red">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Contact No : </td>
                        <td><input type="text" id="ucontact" name="scontact" placeholder="Enter Contact "></td>
                        <td><span id="ucontactError" style="color:red">*</span></td>
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
                        <td><input type="submit" value="Register"></td>
                      </tr>
                      
                  </table>
                  <a href="login.jsp">login</a>
                  <a href="Index.jsp" align="center">Go to Home</a>
            </fieldset>
         </form>
                         
     </div>
</body>
</html>