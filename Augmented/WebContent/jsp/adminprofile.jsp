<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
    <%@ page import="java.sql.*,googie.dbinfo.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
 <link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css">
 <link href="/Augmented/css/styleuser.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function showDiv()
{
	document.getElementById("divupload").style.display="none";
	document.getElementById("divshowupload").style.display="block";
	}
function upload()
{
	document.getElementById("divshowupload").style.display="none";
	document.getElementById("divupload").style.display="block";
	}
function showViewMenu()
{
	document.getElementById("divview").style.display="block";
	}
function hideViewMenu()
{
	document.getElementById("divview").style.display="none";
	}	
</script>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
    <%HttpSession hs=request.getSession(false);
    String uid=(String)hs.getAttribute("userinfo");
    System.out.println(uid);
    if(uid==null)
    {
    	response.sendRedirect("/Augmented/jsp/index.jsp?msg1=invalid login");
    }
    else
    {

    %>    
<div id="divmenu" style="position:absolute;top:5%;left:2%;width:100%;height:100%;">
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
					    <li  class="has-sub"><a href=""><span></span>EVENTS</a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/html/addevents.jsp"><span>ADD</span></a></li>
					      	 <li class="has-sub"><a href="/Augmented/jsp/deleteevents.jsp"><span>DELETE</span></a></li>
					         
					      </ul>
					   </li>
					  <!--  <li  class="has-sub"><a href="#"><span>VIEW</span></a>
					   	<ul>
					         <li class="has-sub"><a href="#"><span>GALLERY</span></a></li>
					         <li class="has-sub"><a href="#"><span>AUDIO</span></a></li>
					         <li class="has-sub"><a href="#"><span>VIDEO</span></a></li>
					      </ul>
					   </li> -->
					   <li  class="has-sub"><a href="#"><span>MESSAGING</span></a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/composeadmin.jsp"><span>COMPOSE</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/inboxadmin.jsp"><span></span>INBOX</a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/sentitemadmin.jsp"><span>SENTBOX</span></a></li>
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





<div class="logo">
					 <a href="/Augmented/jsp/adminprofile.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>









<%} %>

</body>
</html>