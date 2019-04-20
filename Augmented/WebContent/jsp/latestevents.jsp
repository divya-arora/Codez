<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,java.sql.*,googie.dbinfo.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<title>EVENTS</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/Augmented/css/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<%
Connection con=null;
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
      <div class="header">
		     <div class="header_top">
		     	<div class="wrap">
				 <div class="logo">
					 <a href="/Augmented/jsp/index.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>
				  <div class="menu">
					<ul>
						<li><a href="/Augmented/jsp/index.jsp">HOME</a></li>
				    	<li ><a href="/Augmented/jsp/latestevents.jsp">EVENTS</a></li>
				    	<li><a href="/Augmented/jsp/latestphotos.jsp">GALLERY</a></li>
				    	
				    	<li><a href="/Augmented/jsp/userprofile.jsp">PANEL</a></li>
				    	<div class="clear"></div>
				    </ul>				    
				 </div>
			     <div class="clear"></div>
		      </div>		   
		  </div>
  </div>
  <%
   int x1=0,c1=0;int starts1=0;int t1=0;String montht=null;String [] ct=null;int fs1=0;	String [] todayu=null;
   ArrayList<String> datelist=new ArrayList<String>();
   ArrayList<String> namelist=new ArrayList<String>();
   ArrayList<String> typelist=new ArrayList<String>();
   ArrayList<String> monthlist=new ArrayList<String>();
   ArrayList<String> snaplist=new ArrayList<String>();String dates=null;String ename,etype=null;
String strtoday="select * from eventss";
con=CrudOperation.createConnection();
 String [] monthsl={"Jan","Feb,","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
try
{
	java.util.Date d=new java.util.Date();	
	String ud=d.toString();
 todayu=ud.split(" ");
	 System.out.print("hhjhj"+todayu[2]);
	System.out.println(todayu[1]);
	System.out.println(todayu[5]); 
	PreparedStatement pstoday=con.prepareStatement(strtoday);
	ResultSet rstoday=pstoday.executeQuery();
	while(rstoday.next())
	{
	
		fs1++;
	 c1=rstoday.getInt("eventid");
	 ename=rstoday.getString("eventname");
	 etype=rstoday.getString("eventtype");
	 typelist.add(etype);
	 System.out.print("type"+typelist);
	namelist.add(ename);
	System.out.print("name"+namelist);
		String srcsnap=rstoday.getString("snap");
		String newpathp=basepath+"uploads"+"eve";

		String actsnap=newpathp+"/"+srcsnap;
		snaplist.add(actsnap);
		String datee=rstoday.getString("date");
		ct=datee.split("-");
		
		int m=Integer.parseInt(ct[1]);
		switch(m)
		{
		
			case 1:montht=monthsl[0];break;
			case 2:montht=monthsl[1];break;
			case 3:montht=monthsl[2];break;
			case 4:montht=monthsl[3];break;
			case 5:montht=monthsl[4];break;
			case 6:montht=monthsl[5];break;
			case 7:montht=monthsl[6];break;
			case 8:montht=monthsl[7];break;
			case 9:montht=monthsl[8];break;
			case 10:montht=monthsl[9];break;
			case 11:montht=monthsl[10];break;
			case 12:montht=monthsl[11];break;
		}
			
System.out.println("yoyo"+"date"+montht+ct[0]);
dates=montht+ct[0];
datelist.add(ct[0]);
monthlist.add(montht);
System.out.println("datelist"+datelist);
	}
	
	x1=c1;
}
catch(SQLException s)
{
System.out.println(s);

}%>
 <%  if(x1==0)
		{%>
			<div class="wrap">
     	    <div class="content_top">
     	     <div class="gallery">
           	   <h3>No Upcoming Events</h3>
           	   </div>
           	   </div>
           	   </div>
		<% }
		else if(x1!=0 && fs1==1)
		{
			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
	
		%>
     <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			<h2>Upcoming Events</h2>
	        			<div class="section group">
							<div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(0) %></span></h4>
								  <h4><%=datelist.get(0)+monthlist.get(0)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(0) %>" alt=""><span><%=namelist.get(0) %></span></a>
							   </div>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
							<%}}
					else if(x1!=0 && fs1==2)
		{
			if(!((ct[0].equals(todayu[2]))&& (montht.equals(todayu[1])) && (ct[2].equals(todayu[5]))))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
		%>
		 <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			<h2>Upcoming Events</h2>
	        			<div class="section group">
	        			 <div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(0) %></span></h4>
								  <h4><%=datelist.get(0)+monthlist.get(0)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(0) %>" alt=""><span><%=namelist.get(0) %></span></a>
							   </div>
							   </div>
							<div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(1) %></span></h4>
								  <h4><%=datelist.get(1)+monthlist.get(1)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(1) %>" alt=""><span><%=namelist.get(1) %></span></a>
							   </div>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
							<%}}
					else if(x1!=0 && fs1==3)
		{
			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
		%>
		 <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			<h2>Upcoming Events</h2>
	        			<div class="section group">
	        			<div class="grid_1_of_3 events_1_of_3">
	        			 <div class="event-time">
								<h4><span><%=typelist.get(0) %></span></h4>
								  <h4><%=datelist.get(0)+monthlist.get(0)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(0) %>" alt=""><span><%=namelist.get(0) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(1) %></span></h4>
								  <h4><%=datelist.get(1)+monthlist.get(1)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(1) %>" alt=""><span><%=namelist.get(1) %></span></a>
							   </div>
							   </div>
							<div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(2) %></span></h4>
								  <h4><%=datelist.get(2)+monthlist.get(2)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(2) %>" alt=""><span><%=namelist.get(2) %></span></a>
							   </div>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>			<%}}
					else if(x1!=0 && fs1==4)
		{
			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("hsd"+fs1);
			System.out.println("hhjdss"+x1);
		%>
		 <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			<h2>Upcoming Events</h2>
	        			<div class="section group">
	        			<div class="grid_1_of_3 events_1_of_3">
	        			 <div class="event-time">
								<h4><span><%=typelist.get(0) %></span></h4>
								  <h4><%=datelist.get(0)+monthlist.get(0)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(0) %>" alt=""><span><%=namelist.get(0) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(1) %></span></h4>
								  <h4><%=datelist.get(1)+monthlist.get(1) %></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(1) %>" alt=""><span><%=namelist.get(1) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(2) %></span></h4>
								  <h4><%=datelist.get(2) + monthlist.get(2)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(2) %>" alt=""><span><%=namelist.get(2) %></span></a>
							   </div>
							   </div>
							<div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(3) %></span></h4>
								  <h4><%=datelist.get(3)  +monthlist.get(3)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(3) %>" alt=""><span><%=namelist.get(3) %></span></a>
							   </div>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
							<% }}
							else if(x1!=0 && fs1==5)
		{
			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
		%>
		 <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			<h2>Upcoming Events</h2>
	        			<div class="section group">
	        			<div class="grid_1_of_3 events_1_of_3">
	        			
	        			 <div class="event-time">
								<h4><span><%=typelist.get(0) %></span></h4>
								  <h4><%=datelist.get(0)+ monthlist.get(0)%></h4>
							  
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(0) %>" alt=""><span><%=namelist.get(0)%></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							   <div class="event-time">
								<h4><span><%=typelist.get(1) %></span></h4>
								  <h4><%=datelist.get(1)+ monthlist.get(1)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(1) %>" alt=""><span><%=namelist.get(1) %></span></a>
							   </div>
							  </div>
							  <div class="grid_1_of_3 events_1_of_3">
							   <div class="event-time">
								<h4><span><%=typelist.get(2) %></span></h4>
								  <h4><%=datelist.get(2)+ monthlist.get(1)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(2) %>" alt=""><span><%=namelist.get(2) %></span></a>
							   </div>
							  </div>
							  <div class="grid_1_of_3 events_1_of_3">
							   <div class="event-time">
								<h4><span><%=typelist.get(3) %></span></h4>
								  <h4><%=datelist.get(3) + monthlist.get(3)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(3) %>"  alt=""><span><%=namelist.get(3) %></span></a>
							   </div>
							   </div>
							<div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(4) %></span></h4>
								  <h4><%=datelist.get(4) + monthlist.get(4)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(4) %>" alt=""><span><%=namelist.get(4) %></span></a>
							   </div>
							</div>
							   </div>
							  </div>
							  </div>
							  </div>
							  </div>
							  
							   
							   
							    
							
		 				<% }}
							else if(x1!=0 && fs1==6)
		{
			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
		%>
		 <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			<h2>Upcoming Events</h2>
	        			<div class="section group">
	        			<div class="grid_1_of_3 events_1_of_3">
	        			 <div class="event-time">
								<h4><span><%=typelist.get(0) %></span></h4>
								  <h4><%=datelist.get(0)  +monthlist.get(0)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(0) %>" alt=""><span><%=namelist.get(0) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(1) %></span></h4>
								  <h4><%=datelist.get(1) + monthlist.get(1)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(1) %>" alt=""><span><%=namelist.get(1) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(2) %>/span></h4>
								  <h4><%=datelist.get(2) + monthlist.get(2)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(2) %>" alt=""><span><%=namelist.get(2) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(3) %></span></h4>
								  <h4><%=datelist.get(3)  +monthlist.get(3)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(3) %>" alt=""><span><%=namelist.get(3) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(4) %></span></h4>
								  <h4><%=datelist.get(4) + monthlist.get(4)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(4) %>" alt=""><span><%=namelist.get(4) %></span></a>
							   </div>
							   </div>
							<div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(5) %></span></h4>
								  <h4><%=datelist.get(5)  +monthlist.get(5)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(5) %>" alt=""><span><%=namelist.get(5) %></span></a>
							   </div>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
							<%}}
							else if(x1!=0 && fs1==7)
		{
			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
		%>
		 <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			<h2>Upcoming Events</h2>
	        			<div class="section group">
	        			<div class="grid_1_of_3 events_1_of_3">
	        			 <div class="event-time">
								<h4><span><%=typelist.get(0) %></span></h4>
								  <h4><%=datelist.get(0) + monthlist.get(0)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(0) %>" alt=""><span><%=namelist.get(0) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(1) %></span></h4>
								  <h4><%=datelist.get(1) +monthlist.get(1) %></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(1) %>" alt=""><span><%=namelist.get(1) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(2) %></span></h4>
								  <h4><%=datelist.get(2) + monthlist.get(2)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(2) %>" alt=""><span><%=namelist.get(2) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(3) %></span></h4>
								  <h4><%=datelist.get(3) + monthlist.get(3)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(3) %>" alt=""><span><%=namelist.get(3) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(4) %></span></h4>
								  <h4><%=datelist.get(4)  +monthlist.get(4)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(4) %>" alt=""><span><%=namelist.get(4) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(5) %></span></h4>
								  <h4><%=datelist.get(5) + monthlist.get(5)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(5) %>" alt=""><span><%=namelist.get(5) %></span></a>
							   </div>
							   </div>
							<div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(6) %></span></h4>
								  <h4><%=datelist.get(6) +monthlist.get(6)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(6) %>" alt=""><span><%=namelist.get(6) %></span></a>
							   </div>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div><%}}
							else if(x1!=0 && fs1==8)
		{
			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
		%>
		 <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			<h2>Upcoming Events</h2>
	        			<div class="section group">
	        			<div class="grid_1_of_3 events_1_of_3">
	        			 <div class="event-time">
								<h4><span><%=typelist.get(0) %></span></h4>
								  <h4><%=datelist.get(0)+ monthlist.get(0)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(0) %>" alt=""><span><%=namelist.get(0) %></span></a>
							   </div> 
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							   <div class="event-time">
								<h4><span><%=typelist.get(1) %></span></h4>
								  <h4><%=datelist.get(1) +monthlist.get(2)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(1) %>" alt=""><span><%=namelist.get(1) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(2) %></span></h4>
								  <h4><%=datelist.get(2) +monthlist.get(2)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(2) %>" alt=""><span><%=namelist.get(2) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(3) %></span></h4>
								  <h4><%=datelist.get(3) +monthlist.get(3)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(3) %>" alt=""><span><%=namelist.get(3) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(4) %></span></h4>
								  <h4><%=datelist.get(4)+ monthlist.get(4)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(4) %>" alt=""><span><%=namelist.get(4) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(5) %></span></h4>
								  <h4><%=datelist.get(5)+ monthlist.get(5)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(5) %>" alt=""><span><%=namelist.get(5) %></span></a>
							   </div>
							   </div>
							   <div class="grid_1_of_3 events_1_of_3">
							    <div class="event-time">
								<h4><span><%=typelist.get(6) %></span></h4>
								  <h4><%=datelist.get(6)+ monthlist.get(6)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(6) %>" alt=""><span><%=namelist.get(6) %></span></a>
							   </div>
							   </div>
							<div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(7) %></span></h4>
								  <h4><%=datelist.get(7) +monthlist.get(7)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(7) %>" alt=""><span><%=namelist.get(7) %></span></a>
							   </div>
							</div>
							</div>
							
							</div>
							</div>
							</div>
							</div>
								<%}}
							else if(x1!=0 && fs1>8)
		{
			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
			int xx=0,cc=0;int startss=0;int tt=0;String monthh=null;String [] ctt=null;
			   ArrayList<String> datelistt=new ArrayList<String>();
			   ArrayList<String> monthlistt=new ArrayList<String>();
			   ArrayList<String> snaplistt=new ArrayList<String>();String datess=null;
			String strtodayy="select * from eventss";
			con=CrudOperation.createConnection();
			 String [] monthss={"Jan","Feb,","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
			try
			{
				PreparedStatement pstodayy=con.prepareStatement(strtoday);
				ResultSet rstodayy=pstodayy.executeQuery();
				while(rstodayy.next())
				{
				 cc=rstodayy.getInt("eventid");
					String srcsnapp=rstodayy.getString("snap");
					String newpaths=basepath+"uploads"+"eve";

					String actsnapf=newpaths+"/"+srcsnapp;
					snaplistt.add(actsnapf);
					String dateee=rstodayy.getString("date");
					ctt=dateee.split("-");
					
					int mm=Integer.parseInt(ctt[1]);
					switch(mm)
					{
					
						case 1:monthh=monthss[0];break;
						case 2:monthh=monthss[1];break;
						case 3:monthh=monthss[2];break;
						case 4:monthh=monthss[3];break;
						case 5:monthh=monthss[4];break;
						case 6:monthh=monthss[5];break;
						case 7:monthh=monthss[6];break;
						case 8:monthh=monthss[7];break;
						case 9:monthh=monthss[8];break;
						case 10:monthh=monthss[9];break;
						case 11:monthh=monthss[10];break;
						case 12:monthh=monthss[11];break;
					}%>
								<%
			System.out.println("yoyo"+"date"+monthh+ctt[0]);
			datess=monthh+ctt[0];
			datelistt.add(ctt[0]);
			monthlistt.add(monthh);
			System.out.println("datelist"+datelistt);
				}
				
				xx=cc;
				String [] starrayy=new String[xx];
				System.out.println("finals"+xx);
				if(xx!=0 && xx>8)
				{
			   for(int i=0;i<datelistt.size();i++)
			   {
				 
				   starrayy[startss++]=datelistt.get(i);
			   }%>
				  <%System.out.print(startss); %>
				   <%
				   tt=startss-8;%>
				   <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	    	<div class="events">
	        			<h2>Upcoming Events</h2>
	        			<div class="section group">
	        			
				   
				   <%
				   
			for(int j=startss-1;j>=0;j--)
				   {
					 
			%>
			     	   
					
			     	
			     	   
     	    	 
	        			
							<div class="grid_1_of_3 events_1_of_3">
							  <div class="event-time">
								<h4><span><%=typelist.get(j) %></span></h4> 
								  <h4><%=datelist.get(j)+monthlist.get(j)%></h4>
							  </div>
							     <div class="event-img">
								    <a href="#"><img src="<%=snaplist.get(j) %>" alt=""><span><%=namelist.get(j) %></span></a>
							   </div>
							</div>
							</div>
							</div>
							</div>
							</div>
							</div>
							
							
							
							

				
			<%
				if(j==tt)
				{
					break;
				}
					   }
					   }	
			}
			catch(SQLException dee)
			{
				System.out.print(dee);
			}
			}
		}
			%> 

	
</body>
</html>

					
</body>
</html>