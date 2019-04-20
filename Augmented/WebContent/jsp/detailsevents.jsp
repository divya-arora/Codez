<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*,javax.servlet.*,googie.dbinfo.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<% Connection con =null;PreparedStatement ps =null;ResultSet rs =null;
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
String eid=request.getParameter("othersid");
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String srcimg=null;String actimage=null;



if(uid==null)
{
	response.sendRedirect("/Augmented/jsp/index.jsp?msg=Invalid Login");
}
else
{

  String sql="select * from eventss where date=?";
  con=CrudOperation.createConnection();
    try
    {
    	ps=con.prepareStatement(sql);
    	ps.setString(1,eid);
    	rs=ps.executeQuery();
    	if(rs.next())
    	{
    	srcimg=rs.getString("snap");

	String newpath=basepath+"uploads"+"eve";

	actimage=newpath+"/"+srcimg;
	%>

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
					         <li class="has-sub"><a href="/Augmented/jsp/userviewevents.jsp"><span>VIEW</span></a></li>
					         <li class="has-sub"><a href="#"><span>EDIT</span></a></li>
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
					 
			   <div style="position:absolute;top:30%;width:90%;height:40%;left:7%;">
<img src="<%=actimage %>" width=100% height=100%>
</div>
<div style="position:absolute;top:70%;left:30%;">
					<table class="active">
			<tr><td>NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("eventname") %></td></tr>
			
			<tr><td>EVENT TYPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("eventtype") %></td></tr>
			<tr><td>DETAILS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("details") %></td></tr>
			<tr><td>DATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><%=rs.getString("date") %></td></tr>
			

</table>
				<form action="/Augmented/jsp/joinevents.jsp" method="post">
				
 <input type="hidden" value="<%=rs.getString("eventtype") %>" id="type" name="type">
  <input type="hidden" value="<%=rs.getString("date") %>" id="date" name="date">
 <input type="hidden" value="<%=rs.getInt("eventid") %>" id="evid" name="evid">

 <input type="hidden" value="<%=uid %>" id="joinid" name="joinid">
  <div class="big-buttons-col1" style="position:absolute;top:150%;left:40%;">
						<ul>
							<li><input class="b-btnblue" type="submit" value="JOIN" /></li>
							
						</ul>
					</div>
 </form>
	</div>				
				   
		  
 
 
 
 
  
 
 
 
 
 <%
}
}
    catch(SQLException se)
    {
    System.out.println(se);
    }
    
}
%>
</body>
</html>