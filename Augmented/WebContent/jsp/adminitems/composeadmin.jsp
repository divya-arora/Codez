<%@page import="java.util.Date,java.sql.*,googie.dbinfo.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/littleangelscreche/js/validation.js"></script>
<title></title>
<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript">
function Main()
{
	var subject=document.getElementById("sub").value.trim();
	var rcid=document.getElementsById("rid");
	var msg=document.getElementById("msgtxt").value.trim();
 	if(checkEmpty(subject)==false)
	{alert("Enter Subject");

	return false;
	}	
 	else if(checkEmpty(msg)==false)
 	{alert("Enter Message");

	return false;
	}
 	else if(checkCity(rcid)==false)
	{
 		alert("Select Receiver");
 		return false;
	}
	return true;

}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


</head>
<body>
<%
java.util.Date date=new java.util.Date();
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
if(uid==null)
{
	response.sendRedirect("/Augmented/html/index.html?msg=Invalid Login");
}
else
{
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
					    <li><a href="/Augmented/jsp/adminprofile.jsp"><span>HOME</span></a></li>
					    <li  class="has-sub"><a href="/Augmented/jsp/adminprofile.jsp"><span>EVENTS</span></a>
					   	<ul>
					   	<li class="has-sub">
	
					   	
					   	 <a href="/Augmented/html/addevents.jsp" target="targetframe"><span>ADD</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/editprofile.jsp"><span>DELETE</span></a></li>
					      </ul>
					   </li>
					   <!-- <li  class="has-sub"><a href="#"><span>VIEW</span></a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/jsp/uploadgallery.jsp"><span>GALLERY</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/uploadaudios.jsp"><span>AUDIO</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/upvideo.jsp"><span>VIDEO</span></a></li>
					      </ul>
					   </li> -->
					   <li  class="has-sub"><a href="#"><span>MESSAGING</span></a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/composeadmin.jsp" ><span>COMPOSE</span></a></li>
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
</div>








<div class="logo">
					 <a href="/Augmented/jsp/adminprofile.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>









<div style="position:absolute;top:30%;left:15%;width:70%">
<h1 class="msgdecor" style="text-align: center;font-size:xx-large; ;font-family:'Lucida Calligraphy';">COMPOSE MESSAGE</h1>
<form  action="/Augmented/WriteMsg" autocomplete="on" method="post">

<table class="msgcompose" cellspacing="10%">
<tr><th >Sender&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td>
<div class="input-box-grid input-box-grid-white">
<input type="text" value="<%=uid %>" readonly="readonly"></div></td></tr>
<tr><th >Receiver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>

<td>
<select name="rid" id="rid" required="required">
<option value="default">Select Receiver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
<%
Connection con=null;
ResultSet rs=null;PreparedStatement ps=null;
con=CrudOperation.createConnection();
String st="select userid from logindetail";
try
{
ps=con.prepareStatement(st);
rs=ps.executeQuery();
   while(rs.next())
   {
	   %>
	   <option value="<%=rs.getString("userid") %>"><%=rs.getString("userid") %></option>
	   <%
   }
}
catch(SQLException s)
{
System.out.println(s);
}

%>
</select>
</td></tr>
<tr><th >Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td>
<div class="input-box-grid input-box-grid-white">
<input type="text" name="sub" id="sub" required="required"></div></td></tr>
<tr><th >Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th><td>
<%

java.sql.Date dt=new java.sql.Date(date.getTime());
%>
<div class="input-box-grid input-box-grid-white">
<input type="text" name="date" value="<%=dt%>" readonly="readonly"></div></td></tr>
<tr></tr>

<tr><th >Message&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
<td><textarea rows="5" cols="30" name="msgtxt" id="msgtxt" required="required"></textarea></td>
</tr>
 <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
       <div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="COMPOSE" /></li>
							
						</ul>
					</div></td></tr>
</table>
</form>
</div>
<%} %>
</body>
</html>