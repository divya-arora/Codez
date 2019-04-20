<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.util.*,java.sql.*,googie.dbinfo.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<link href='/Augmented/css/style.css' rel='stylesheet' type='text/css'>
	<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
	
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<div id="divmenu" style="position:absolute;top:5%;left:2%;width:100%;height:100%;">
<div class="wrap">
			<!---start-top-nav---->
	


<div class="logo">
					 <a href="/Augmented/jsp/adminprofile.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>







<%
ArrayList<String> reglist=new ArrayList<String>();
Connection con=null;int flag=0;String srcimg=null;String actimage=null;
ResultSet rsfin=null;PreparedStatement psfin=null;int t=0,c=0,count=0;
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String sfin="select * from eventss";
con=CrudOperation.createConnection();
try
{
psfin=con.prepareStatement(sfin);
rsfin=psfin.executeQuery();
while(rsfin.next())
{
	String uid=rsfin.getString("date");
	srcimg=rsfin.getString("snap");
	String newpath=basepath+"uploads"+"eve";
	actimage=newpath+"/"+srcimg;%>
<%-- <div style="position:relative;top:30%;width:90%;height:40%;left:7%;">
<img src="<%=actimage %>">
 --%>
 
 <div class="main" style="position:relative;top:30%;width:90%;height:40%;left:7%;">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			
	        			<div class="section group">
 <div class="grid_1_of_3 events_1_of_3">
							  
							     <div class="event-img">
								    <a href="#"><img src="<%=actimage %>" alt=""></a>
							   </div>
							
							
							
 
	  <form action="/Augmented/jsp/detailsevents.jsp" method="post">
	 <div class="big-buttons-col1">
						<ul>
							<li><input type="submit" value="<%=uid%>" id="othersid" name="othersid" class="b-btnblue"></li>
							
						</ul>
					</div>
					
							
	  </form>
	  </div>
	  </div>
							
							</div>
							</div>
							</div>
							
	  </div >
	<% 
}
}
	catch(SQLException s)
	{
	System.out.println(s);
}
%>

       
    
     
</body>
</html>