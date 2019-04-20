<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,googie.dbinfo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/Augmented/css/style.css" rel="stylesheet" type="text/css">
<link href='/Augmented/css/external.css' rel='stylesheet' type='text/css'>
	<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
	
<script src="/Augmented/js/validation.js"></script>
<script type="text/javascript">
function Main()
{
	var name=document.getElementById("txtname").value.trim();
	
	var gender=document.getElementsByName("gender")	;
	var phn=document.getElementById("txtphn").value.trim();
	
	var address=document.getElementById("txtaddress").value.trim();
	if(checkEmpty(name)==false)
	{alert("Enter Name");
	
	return false ;}

 	else if(checkEmpty(phn)==false)
	{alert("Enter Phone no.");

	return false;
	}	
 	else if(checkEmpty(address)==false)
 	{alert("Enter Address");

	return false;
	}	
 	else if(checkGender(gender)==false)
	{alert("select gender");
	return false;}
 	else if(checkLength(phn,10)==false)
	{alert("Ph no requires 10 characters");
	return false;}
	return true;



}
</script>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<% 
String info=request.getParameter("ms2");

HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
if(uid==null)
{
	response.sendRedirect("/Augmented/jsp/index.jsp?msg=Invalid Login");
}
else if(info!=null)
{%>
<div class="headerdiv" >
<p style="font-size: x-large;">Welcome&nbsp;&nbsp;&nbsp;<font><%=uid %></font></p>
<p align="right">Date:&nbsp;<b><%=new java.util.Date() %></b></p>
</div><div style="position: absolute;top: 20%;width: 90%;left: 5%">
<p class="pdecor"><%=info %></p></div>
<%
} 
else	
{	
	
%>
<div id="divmenu" style="position:absolute;top:5%;left:2%;width:100%;height:100%;">
<div class="wrap">
			
	<div class="top-nav">
		<div class="menu1">
			 <ul class="menu2">
		<li>
			<a  class="nav-icon" href=""> </a>
			<ul>
				<li>
				<a class="root-nav1" href="/Augmented/jsp/userviewevents.jsp">EVENTS</a>
					<a class="root-nav1" href="/Augmented/Logout">LOGOUT</a>
							</li>
				
			</ul>
		</li>
	</ul>
		 </div>
		 <div class="top-nav_right">
		 <div class="menu">
			<div class="cssmenu">
					<ul>
					   <li><a href="/Augmented/jsp/userprofile.jsp"><span>Home</span></a></li>
					    <li  class="has-sub"><a href="/Augmented/jsp/userprofile.jsp"><span>PROFILE</span></a>
					   	<ul>
					   	
					         <li class="has-sub"><a href="/Augmented/jsp/viewprofile.jsp"><span>VIEW</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/editprofile.jsp"><span>EDIT</span></a></li>
					      </ul>
					   </li>
					   <li  class="has-sub"><a href="#"><span>UPLOAD</span></a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/jsp/uploadgallery.jsp"><span>GALLERY</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/uploadaudios.jsp"><span>AUDIO</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/upvideo.jsp"><span>VIDEO</span></a></li>
					      </ul>
					   </li>
					   <li  class="has-sub"><a href="#"><span>MESSAGING</span></a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/jsp/compose.jsp"><span>COMPOSE</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/inbox.jsp"><span></span>INBOX</a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/sentitem.jsp"><span>SENTBOX</span></a></li>
					      </ul>
					   </li>
					   </ul>
				</div>
			<div class="clear"></div>
		</div>
		<!-- start search-->
		<!-- start social icons -->
		<div class="soc_right">
	   	
	          </div>
	          	</div>
	          	<div class="web_search">
				 	<form>
				 		<input type="text" value="Search.." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search..';}">
				 		<input type="submit" value="">
				 	</form>
	    		</div>
			
 		<div class="clear"></div>
	</div>
</div>
</div>





  




<div class="logo">
					 <a href="/Augmented/jsp/userprofile.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>
  
  
<div  style="position: absolute;top:45%;left:20%;">
<form action="/Augmented/Profile" autocomplete="on"  method="post"  onsubmit="return Main()">
<table cellspacing="15%">
<tr><td>NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><div class="input-box-grid input-box-grid-white">
<input type="text" id="txtname" name="txtname" required="required"></div></td></tr>
<tr><td>GENDER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>MALE<div class="input-box-grid input-box-grid-white">
<input type="radio" name="gender" value="Male" required="required">
FEMALE<input type="radio" name="gender" value="Female" required="required"></div></td></tr>
<tr><td>PHONE NUMBER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><div class="input-box-grid input-box-grid-white">
<input type="text" id="txtphn" name="txtphn" required="required"></div></td></tr>
<tr><td>EMAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td><div class="input-box-grid input-box-grid-white">
<input type="email" id="txtmail" name="txtmail" required="required"></div></td></tr>
<tr><td>ADDRESS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><textarea id="txtaddress" name="txtaddress"></textarea></td></tr>
<tr><td>DESIGNATION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><div class="input-box-grid input-box-grid-white">
<input type="text" id="txtdesig" name="txtdesig" required="required"></div></td></tr>
<tr><td>ABOUT YOURSELF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><textarea rows="10" cols="15" id="txtaboutme" name="txtaboutme"></textarea></td></tr>
<tr></tr>
 <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
       <div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="CREATE" /></li>
							
						</ul>
					</div></td></tr>
</table>

</form>
</div>
<%} %>
</body>
</html>