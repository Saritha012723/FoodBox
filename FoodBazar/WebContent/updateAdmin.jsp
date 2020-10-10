<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="com.FoodPlaza.Dao.*"%>
<%@ page import ="com.FoodPlaza.Pojo.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update Admin</title>
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
	var aid=document.getElementById("aid").value;
	var aname=document.getElementById("aname").value;
	var aemail=document.getElementById("aemail").value;
	var aaddress=document.getElementById("aaddress").value;
	var acontact=document.getElementById("acontact").value;

	if(aid=="")
	{
	 document.getElementById("aidError").innerHTML="Please enter Admin id";
	 return false;
	}

    else
	{
	  document.getElementById("aidError").innerHTML="";
	}
	
	if(aname=="")
		{
		 document.getElementById("anameError").innerHTML="Please enter name";
		  return false;
		}
	
	else
		{
		  document.getElementById("anameError").innerHTML="";
		}
	
	if(aemail=="")
	{
	 document.getElementById("aemailError").innerHTML="Please enter Email";
	  return false;
	}

    else
	{
	  document.getElementById("aemailError").innerHTML="";
	}
	
	if(aaddress=="")
	{
	 document.getElementById("aaddressError").innerHTML="Please enter Address";
	  return false;
	}

    else
	{
	  document.getElementById("aaddressError").innerHTML="";
	}
	
	if(acontact=="")
 	{
 	  document.getElementById("acontactError").innerHTML="Please enter Contact no";
	  return false;
	}

    else
	{
	  document.getElementById("acontactError").innerHTML="";
	}
	
	return true;
}

</script>
</head>
<body>
<div align="center">
         
         <form onsubmit="return validate()" action="AdminServ" method="post">
            <fieldset>
            <legend>UPDATE ADMIN</legend>
            
            <%

            String status=(String)request.getAttribute("status");
            if(status!=null)
            {
               out.println(status);	
            }
            %>
            
            <%
                   Admin a=(Admin)request.getAttribute("Admin");
            %>
                  <table>
                      <tr>
                        <td>Admin Id : </td>
                        <td><input type="text" id="aid" name="aid" value=<%=a.getAdminId() %> readonly></td>
                        <td><span style="color:red" id="aidError">*</span></td>
                      </tr>
                      <tr>
                        <td>Admin Name : </td>
                        <td><input type="text" id="aname" name="aname" value=<%=a.getAdminName() %>></td>
                        <td><span style="color:red" id="anameError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Admin Email : </td>
                        <td><input type="email" id="aemail" name="aemail" value=<%=a.getAdminEmail() %> readonly></td>
                        <td><span style="color:red" id="aemailError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Admin Address : </td>
                        <td><input type="text" id="aaddress" name="aaddress" value=<%=a.getAdminAddress() %>></td>
                        <td><span style="color:red" id="addressError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Admin Contact No. : </td>
                        <td><input type="text" id="acontact" name="acontact" value=<%=a.getAdminContact() %>></td>
                        <td><span style="color:red" id="acontactError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td><input type="submit" value="Update"></td>
                      </tr>
                      
                  </table>
                  <a href="Index.jsp" align="center">Go to Home</a>
            </fieldset>
         </form>
                         
     </div>
</body>
</html>