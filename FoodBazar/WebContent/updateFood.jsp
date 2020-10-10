<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import ="com.FoodPlaza.Dao.*"%>
<%@ page import ="com.FoodPlaza.Pojo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Food</title>

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
	var fid=document.getElementById("foodid").value;
	var fname=document.getElementById("foodname").value;
	var ftype=document.getElementById("foodtype").value;
	var fcat=document.getElementById("foodcat").value;
	var fdesc=document.getElementById("fooddesc").value;
	var fprice=document.getElementById("foodprice").value;

	if(fid=="")
	{
	 document.getElementById("fidError").innerHTML="Please enter Food Id";
	 return false;
	}

    else
	{
	  document.getElementById("fnameError").innerHTML="";
	}
	
	if(fname=="")
		{
		 document.getElementById("fnameError").innerHTML="Please enter Food name";
		  return false;
		}
	
	else
		{
		  document.getElementById("fnameError").innerHTML="";
		}
	
	if(ftype=="")
	{
	 document.getElementById("ftypeError").innerHTML="Please enter Food type";
	  return false;
	}

    else
	{
	  document.getElementById("ftypeError").innerHTML="";
	}
	
	if(fcat=="")
	{
	 document.getElementById("fcatError").innerHTML="Please enter Food Category";
	  return false;
	}

    else
	{
	  document.getElementById("fcatError").innerHTML="";
	}
	
		
	if(fdesc=="")
	{
	 document.getElementById("fdescError").innerHTML="Please enter Food Description";
	  return false;
	}

    else
	{
	  document.getElementById("fdescError").innerHTML="";
	}
	
	if(fprice=="")
	{
	 document.getElementById("fpriceError").innerHTML="Please enter Food price";
	  return false;
	}

    else
	{
	  document.getElementById("fpriceError").innerHTML="";
	}
	
	return true;
}

</script>
</head>
<body>

  <div align="center">
         
         <form onsubmit="return validate()" action="UpdateFoodServ" method="post">
         <input type="hidden" name="food" value="updateFood">
            <fieldset>
            <legend>UPDATE FOOD</legend>
            
            <%

            String status=(String)request.getAttribute("status");
            if(status!=null)
            {
               out.println(status);	
            }
            %>
            
            <%
                   Food f=(Food)request.getAttribute("Food");
            %>
                  <table>
                      <tr>
                        <td>Food Id : </td>
                        <td><input type="text" id="foodid" name="fid" value=<%=f.getFoodId() %> readonly></td>
                        <td><span style="color:red" id="fidError">*</span></td>
                      </tr>
                      <tr>
                        <td>Food Name : </td>
                        <td><input type="text" id="foodname" name="fname" value=<%=f.getFoodName() %>></td>
                        <td><span style="color:red" id="fnameError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Food Type : </td>
                        <td><input type="text" id="foodtype" name="ftype" value=<%=f.getFoodType() %>></td>
                        <td><span style="color:red" id="ftypeError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Food Category : </td>
                        <td><input type="text" id="foodcat" name="fcategory" value=<%=f.getFoodCategory() %>></td>
                        <td><span style="color:red" id="fcatError">*</span></td>
                      </tr>
                      
                                            
                      <tr>
                        <td>Food Description : </td>
                        <td><input type="text" id="fooddesc" name="fdesc" value=<%=f.getFoodDescription() %>></td>
                        <td><span style="color:red" id="fdescError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td>Food Price : </td>
                        <td><input type="text" id="foodprice" name="fprice" value=<%=f.getPrice() %>></td>
                        <td><span style="color:red" id="fpriceError">*</span></td>
                      </tr>
                      
                      <tr>
                        <td><input type="submit" value="Submit"></td>
                      </tr>
                      
                  </table>
                  <a href="Index.jsp" align="center">Go to Home</a>
            </fieldset>
         </form>
                         
     </div>

</body>
</html>