<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,javax.servlet.*,googie.dbinfo.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="/Augmented/js/validation.js"></script>
<script type="text/javascript">
function Main()
{
	var name=document.getElementById("txtname").value.trim();
	
	var gender=document.getElementsByName("gender")	;
	var phn=document.getElementById("txtphn").value.trim();
	
	var address=document.getElementById("txtaddress").value.trim();
	var desig=document.getElementById("txtdesig").value.trim();
	var about=document.getElementById("txtaboutme").value.trim();
	if(checkEmpty(name)==false)
	{alert("Enter Name");
	
	return false ;}

 	else if(checkEmpty(phn)==false)
	{alert("Enter Phone no.");

	return false;
	}	
 	else if(checkEmpty(desig)==false)
 		{
 		alert("Enter designation");
 		return false;
 		}
 	else if(checkEmpty(about)==false)
		{
		alert("Enter About Yourself");
		return false;
		}
 	else if(checkEmpty(address)==false)
 	{alert("Enter Address");

	return false;
	}	
 	else if(checkGender(gender)==false)
	{alert("select gender");
	return false;}
 	else if(checkLength(ph,10)==false)
	{alert("Ph no requires 10 characters");
	return false;}
	return true;



}
</script>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<% String m,f;
String info=request.getParameter("msg1");
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
if(info!=null)
{%>
	<div style="background-color:black; ">
<p >HELLO&nbsp;&nbsp;&nbsp;<font ><%=uid %></font></p>
<p align="right">Date:&nbsp;<b><%=new java.util.Date() %></b></p>
</div>
	<div style="position: absolute;top: 20%;width: 90%;left: 5%">
	<p class="pdecor"><%=info %></p></div>
	<%
}
else
{
Connection con =null;PreparedStatement ps =null;ResultSet rs =null;

if(uid==null)
{
	response.sendRedirect("/Augmented/jsp/index.jsp?msg=Invalid Login");
}
else
{
  String sql="select * from profile where userid=?";
  con=CrudOperation.createConnection();
    try
    {
    	ps=con.prepareStatement(sql);
    	ps.setString(1, uid);
    	rs=ps.executeQuery();
    	if(rs.next())
    	{%>
 <div id="divmenu" style="position:absolute;top:5%;left:2%;width:100%;height:100%;">
<div class="wrap">
			<!---start-top-nav---->
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
		 	<!-- start top-nav-->
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
 

<div style="position: absolute;top: 30%;left:20%" class="menu">
<form method="post" action="/Augmented/UpdateProfile" onsubmit="return Main()">
<table>
  
			<tr><td>NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th>
<div class="input-box-grid input-box-grid-white">
<input type="text" value="<%=rs.getString("name") %>" id="txtname" name="txtname"></div></th></tr>
			
			
			<tr><td>EMAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th>
<div class="input-box-grid input-box-grid-white">
<input type="text" value="<%=rs.getString("email") %>" id="txtmail" name="txtmail"></div></th></tr>
			<tr><td>PHONE NO.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th>
<div class="input-box-grid input-box-grid-white">
<input type="text" value="<%=rs.getLong("phone") %>" id="txtphn" name="txtphn"></div></th></tr>
			<tr><td>GENDER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<%
			if(rs.getString("gender").equalsIgnoreCase("male"))
			{
				m="checked";f="unchecked";
			}
			else
			{
				m="unchecked";f="checked";
				
			} %>
			<td>MALE<input type="radio" name="gender" value="Male" checked=<%=m %>>FEMALE<input type="radio" name="gender" value="Female" checked=<%=f %>> </td></tr>
			<tr><td>ADDRESS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th><textarea id="txtaddress" name="txtaddress"><%=rs.getString("address") %></textarea></th></tr>
			<tr><td>DESIGNATION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th><textarea id="txtdesig" name="txtdesig"><%=rs.getString("designation") %></textarea></th></tr>
			<tr><td>ABOUT YOU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><th><textarea rows=12 cols=15 id="txtaboutme" name="txtaboutme"><%=rs.getString("aboutme") %></textarea></th></tr>
			
		 <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
       <div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="EDIT" /></li>
							
						</ul>
					</div></td></tr>
	

</table>

</form>
</div>
<!-- </div>
</div>
</div> -->
<%
}
}
    catch(SQLException se)
    {
    System.out.println(se);
    }
   
}
}
%>
</body>
</html>