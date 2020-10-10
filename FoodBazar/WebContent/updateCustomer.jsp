<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="com.FoodPlaza.Dao.*"%>
<%@ page import ="com.FoodPlaza.Pojo.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Customer</title>
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
	var cid=document.getElementById("custid").value;
	var cname=document.getElementById("custname").value;
	var cemail=document.getElementById("custemail").value;
	var caddress=document.getElementById("custAddress").value;
	var cContact=document.getElementById("custContact").value;

	if(cid=="")
	{
	 document.getElementById("cidError").innerHTML="Please enter Customer Id";
	 return false;
	}

    else
	{
	  document.getElementById("cidError").innerHTML="";
	}
	
	if(cname=="")
		{
		 document.getElementById("cnameError").innerHTML="Please enter name";
		  return false;
		}
	
	else
		{
		  document.getElementById("cnameError").innerHTML="";
		}
	
	if(cemail=="")
	{
	 document.getElementById("cemailError").innerHTML="Please enter Email";
	  return false;
	}

    else
	{
	  document.getElementById("cemailError").innerHTML="";
	}
	
	if(caddress=="")
	{
	 document.getElementById("cAddError").innerHTML="Please enter Address";
	  return false;
	}

    else
	{
	  document.getElementById("cAddError").innerHTML="";
	}
	
	if(cContact=="")
 	{
 	  document.getElementById("cContactError").innerHTML="Please enter Contact no";
	  return false;
	}

    else
	{
	  document.getElementById("cContactError").innerHTML="";
	}
	
	return true;
}

</script>
</head>
<body>
<div align="center">
         
         <form onsubmit="return validate()" action="CustomerServ" method="post">
            <fieldset>
            <legend>UPDATE CUSTOMER</legend>
            
            <%

            String status=(String)request.getAttribute("status");
            if(status!=null)
            {
               out.println(status);	
            }
            %>
            
            <%
                   Customer c=(Customer)request.getAttribute("Customer");
            %>
                  <table>
                      <tr>
                        <td>Customer Id : </td>
                        <td><input type="text" id="custid" name="cid" value=<%=c.getCustId() %> readonly></td>
                        <td><span style="color:red" id="cidError">*</span></td>
                      </tr>
                      <tr>
                        <td>Customer Name : </td>
                        <td><input type="text" id="custname" name="cname" value=<%=c.getCustName() %>></td>
                        <td><span style="color:red" id="cnameError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Customer Email : </td>
                        <td><input type="email" id="custemail" name="cemail" value=<%=c.getCustEmail() %> readonly></td>
                        <td><span style="color:red" id="cemailError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Customer Address : </td>
                        <td><input type="text" id="custAddress" name="caddress" value=<%=c.getCustAddress() %>></td>
                        <td><span style="color:red" id="cAddError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Customer Contact No. : </td>
                        <td><input type="text" id="custContact" name="ccontact" value=<%=c.getContactNo() %>></td>
                        <td><span style="color:red" id="cContactError">*</span></td>
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