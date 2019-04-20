<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,googie.dbinfo.*,java.util.*,javax.servlet.*,googie.beans.*,javax.servlet.http.HttpServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<div id="divmenu" style="position:absolute;top:5%;left:2%;width:100%;height:100%;">
<div class="wrap">
			
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
					    <li><a href="/Augmented/jsp/adminprofile.jsp"><span>HOME</span></a></li>
					    <li  class="has-sub"><a href="/Augmented/jsp/adminprofile.jsp"><span>EVENTS</span></a>
					   	<ul>
					   	<li class="has-sub">
	
					   	
					   	 <a href="/Augmented/html/addevents.jsp"><span>ADD</span></a></li>
 					         <li class="has-sub"><a href="/Augmented/jsp/viewprofile.jsp"><span>VIEW</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/editprofile.jsp"><span>DELETE</span></a></li>
					      </ul>
					   </li>
					   <li  class="has-sub"><a href="#"><span>VIEW</span></a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/jsp/uploadgallery.jsp"><span>GALLERY</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/uploadaudios.jsp"><span>AUDIO</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/upvideo.jsp"><span>VIDEO</span></a></li>
					      </ul>
					   </li>
					   <li  class="has-sub"><a href="#"><span>MESSAGING</span></a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/composeadmin.jsp" target="targetframe"S><span>COMPOSE</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/inboxadmin.jsp" target="targetframe"><span></span>INBOX</a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/sentitemadmin.jsp" target="targetframe"><span>SENTBOX</span></a></li>
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
					 <a href="/Augmented/jsp/adminprofile.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>
<div style="position:absolute;top:30%">
 <form action="/Augmented/Uploadsnap" method="post" enctype="Multipart/form-data">
	<table>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SNAPSHOT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><div class="input-box-grid input-box-grid-white">
 	
						<input type="file" class="focused-input-white" name="upsnap">
	</div></td></tr>
	
	 <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
       <div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="UPLOAD" /></li>
							
						</ul>
					</div></td></tr>
	</table>
	</form>
	</div>
</body>
</html>