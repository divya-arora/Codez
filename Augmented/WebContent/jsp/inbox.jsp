<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,java.sql.*,googie.dbinfo.*,googie.beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function showmsg(mgid)
{
	document.getElementById(mgid).style.display="block";
	}
function hidemsg(mgid)
{document.getElementById(mgid).style.display="none";
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
<title>INBOX</title>
<!-- <style>
p,font,table,h1
{
font-size:1.2em;
	color:#FFF;
	font-family: 'caviar_dreamsregular';
	margin:15px 15px;
	display:block;
    -webkit-transition: all .9s;
	-moz-transition: all .9s;
	-o-transition: all .9s;
	-ms-transition: all .9s;
	transition: all .9s;display:inline-block;
	align:right;
	}



</style>

 -->
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<%
Connection con=null;
ResultSet rs=null;PreparedStatement ps=null;
con=CrudOperation.createConnection();
String st="select * from message where receiverid=?";
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
if(uid==null)
{
	response.sendRedirect("Augmented/jsp/index.jsp?msg=Invalid Login");
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
					   </ul>			</div>
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
<h1 class="msgdecor" style="text-align: center;font-size:xx-large; ;font-family:'Lucida Calligraphy';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;INBOX</h1>
<form action="/Augmented/DeleteMsgInbox" autocomplete="on" method="post">
<table class="tabledecor" cellspacing="5%" style="left: 0%;width: 100%;position: absolute;" >
<tr><td class="msghead" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select</td><td class="msghead" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subject</td><td class="msghead" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sender</td><td class="msghead">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date</td></tr>
<%
for(int i=0;i<msglist.size();i++)
{
	m=msglist.get(i);

if(m.getRstatus()==1)
{
%>
<tr>
<td >
<input type="checkbox" name="chkdel" value=<%=m.getMsgid()%> required="required"></td>
<td class="msgfont"><a href="javascript:showmsg(<%=m.getMsgid()%>)" ><%=m.getSubject() %></a><p id=<%=m.getMsgid() %> style="background-color:silver;display: none;"><%=m.getMessage() %><br><a href="javascript:hidemsg(<%=m.getMsgid()%>)">Hide</a></p></td>
<td class="msgfont"><%=m.getSenderid() %></td>
<td class="msgfont"><%=m.getDate() %></td>
</tr>
<tr></tr>
<%
		  }
	}
	

%>
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

</form>
</div>

<%} %>
</body>
</html>