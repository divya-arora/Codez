<%@page import="java.sql.*,googie.dbinfo.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
<script>
function check()
{
var i=document.getElementById("delete");
if(i==false)
	{
	alert("check item");
	return false;
	}
	return true;
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
					   <li  class="has-sub"><a href="#"><span>VIEW</span></a>
					   	<ul>
					         <li class="has-sub"><a href="#"><span>GALLERY</span></a></li>
					         <li class="has-sub"><a href="#"><span>AUDIO</span></a></li>
					         <li class="has-sub"><a href="#"><span>VIDEO</span></a></li>
					      </ul>
					   </li>
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










 <div  style="position: absolute;top:35%;left:20%">
<form action="/Augmented/DeleteEvents" method="post" onsubmit="check()">
<table>
<tr><td>&nbsp;&nbsp;&nbsp;</td>
<td>&nbsp;EVENTNAME</td>
<td>&nbsp;EVENTTYPE</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DATE</td></tr>
<%
String str="select * from eventss";
Connection con=CrudOperation.createConnection();
try
{
PreparedStatement ps=con.prepareStatement(str);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
%>
<tr><td><input type="checkbox" name="chkaccdel" value="<%=rs.getInt("eventid") %>"s></td>
<td><%=rs.getString("eventname") %>
<td><%=rs.getString("eventtype") %>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("date") %></td></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      
<%
}%>

 <td><div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="DELETE" name="delete" id="delete" /></li>
							
						</ul>
					</div></td></tr>
</table>
</form>
</div>
<%
}
catch(SQLException se)
{
	System.out.print(se);
}

%>




<%} %>
</body>
</html>