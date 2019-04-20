<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,java.sql.*,googie.dbinfo.*,googie.beans.Message"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function showmsg(mgid)
{
	document.getElementById(mgid).style.display="block";
	
	}
function hidemsg(mgid)
{
	document.getElementById(mgid).style.display="none";
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
<title>Insert title here</title>
</head>
<body>
<%
Connection con=null;
ResultSet rs=null;PreparedStatement ps=null;
con=CrudOperation.createConnection();
String st="select * from message where senderid=?";
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
if(uid==null)
{
	response.sendRedirect("/Augmnented/html/index.html?msg=Invalid Login");
}
else
{
	Message m=null;
	ArrayList <Message>msglist=new ArrayList<Message>();
	try
	{
		ps=con.prepareStatement(st);
		ps.setString(1, uid);
		rs=ps.executeQuery();
		while(rs.next())
		{
			m=new Message();
			m.setMsgid(rs.getInt("msgid"));
			m.setSenderid(rs.getString("senderid"));
			m.setReceiverid(rs.getString("receiverid"));
			m.setDate(rs.getDate("date"));
			m.setMessage(rs.getString("message"));
			m.setSubject(rs.getString("subject"));
			m.setRstatus(rs.getInt("rstatus"));
			m.setSstatus(rs.getInt("sstatus"));
			msglist.add(m);
		}
			
	}
	catch(SQLException se)
	{
		System.out.println(se);
	}	
			
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
</div>








<div class="logo">
					 <a href="/Augmented/jsp/userprofile.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>











<div style="position: absolute;top: 30%;left: 5%;width: 95%">
<h1 class="msgdecor" style="text-align: center;font-size:xx-large;font-family:'Lucida Calligraphy';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SENT ITEMS</h1>
<form action="/Augmented/DeleteMsg" method="post">
<table class="tabledecor" cellspacing="5%" style="left: 0%;width: 100%;position: absolute;">
<tr><td class="msghead">Select</td><td class="msghead">Subject</td><td class="msghead">
Reciever</td><td class="msghead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date</td></tr>
<!-- 
for(int i=0;i<msglist.size();i++)
{
	MsgInfo us=msglist.get(i);
%> --%> -->
<%

		for(int i=0;i<msglist.size();i++)
		{
			m=msglist.get(i);
		
	  if(m.getSstatus()==1)
	  {
%>
<tr>
<td>

<input type="checkbox" name="chkdel" value=<%=m.getMsgid()%>></td>
<td class="msgfont"><a href="javascript:showmsg(<%=m.getMsgid() %>)"><%=m.getSubject() %></a><p id=<%=m.getMsgid() %> style="background-color: silver;display: none;"><%=m.getMessage() %><br>
<a href="javascript:hidemsg(<%=m.getMsgid()%>)">Hide</a></p></td>
<td class="msgfont"><%=m.getReceiverid() %></td>
<td class="msgfont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=m.getDate() %></td>
</tr>
<%
	  }
	}
	

%>
<tr></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
       <div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="DELETE" /></li>
							
						</ul>
					</div></td></tr>
</table>
</form></div>
<%} %>

</body>
</html>