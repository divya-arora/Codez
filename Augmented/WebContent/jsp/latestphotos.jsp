<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,java.sql.*,googie.dbinfo.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>play</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/Augmented/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="/Augmented/js/jquery-1.9.0.min.js"></script>
<link rel="stylesheet" href="/Augmented/css/swipebox.css">
<script src="/Augmented/js/jquery.swipebox.min.js"></script> 
<script type="text/javascript">
		jQuery(function($) {
			$(".swipebox").swipebox();
		});
	</script>
	
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
      <div class="header">
		     <div class="header_top">
		     	<div class="wrap">
				 <div class="logo">
					 <a href="/Augmented/jsp/index.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>
				  <div class="menu">
					<ul>
						<li><a href="/Augmented/jsp/index.jsp">HOME</a></li>
				    	<li><a href="/Augmented/jsp/latestevents.jsp">EVENTS</a></li>
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
    
     
     ArrayList<String> reglist=new ArrayList<String>();int fs=0;
 ArrayList<String> namelist=new ArrayList<String>();int count=0;int x=0;
 Connection con=null;int flag=0;String srcimg=null;String actimage=null;int c=0;int fs1=0;
ResultSet rsfin=null;PreparedStatement psfin=null;
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String sfin="select * from images";
/* String[] stArray=new String[3]; */
con=CrudOperation.createConnection();
	try
	{
	psfin=con.prepareStatement(sfin);
	rsfin=psfin.executeQuery();
	while(rsfin.next())

	{
		fs=1;
		fs1++;
srcimg=rsfin.getString("name");
 c=rsfin.getInt("imgid");

String uid=rsfin.getString("userid");
		String newpath=basepath+"uploads"+uid;

		actimage=newpath+"/"+srcimg;
		reglist.add(actimage);
		
		namelist.add(srcimg);
		
		
		
	}
		x=c;
		
		
		
	}
	catch(SQLException s)
	{
	System.out.println(s);
	
	}
	
	
%>
		<% 
		if(x==0)
		{%>
			<div class="wrap">
     	    <div class="content_top">
     	     <div class="gallery">
           	   <h3>No Latest Gallery Updated</h3>
           	   </div>
           	   </div>
           	   </div>
		<% }
		else if(x!=0 && fs1==1)
		{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x);
			System.out.print(reglist.get(0));
		%>
	  <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	     <div class="gallery">
           	   <h3 style="color:pink">Latest Photos</h3>
	           <div class="section group">
				<div class="grid_1_of_4 images_1_of_4">
					<a href="<%=reglist.get(0) %>" class="swipebox" title="<%=namelist.get(0)%>"> <img  width=100% height=100% src="<%=reglist.get(0) %>" alt=""> <span class="zoom-icon"></span></a>
				</div>
				</div>
				</div></div></div></div>
				  
	<%} 
else if(x!=0 && fs1==2)
		{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x);
			System.out.print(reglist.get(0));
		%>
	  <div class="main">
     	<div class="wrap">
     	    <div class="content_top">
     	     <div class="gallery">
           	   <h3 style="color:pink">Latest Photos</h3>
	           <div class="section group">
	           <div class="grid_1_of_4 images_1_of_4">
					<a href="<%=reglist.get(0) %>" class="swipebox" title="<%=namelist.get(0)%>"> <img  width=100% height=100% src="<%=reglist.get(0) %>" alt=""> <span class="zoom-icon"></span></a>
				</div>
				<div class="grid_1_of_4 images_1_of_4">
					<a href="<%=reglist.get(1) %>" class="swipebox" title="<%=namelist.get(1)%>"> <img  width=100% height=100% src="<%=reglist.get(1) %>" alt=""> <span class="zoom-icon"></span></a>
				</div>
				</div>
				</div></div></div></div>
				  
	<%}
else if(x!=0 && fs1==3)
{
	System.out.println("h"+fs1);
	System.out.println("hhj"+x);
	System.out.print(reglist.get(0));
%>
<div class="main">
	<div class="wrap">
	    <div class="content_top">
	     <div class="gallery">
   	   <h3 style="color:pink">Latest Photos</h3>
       <div class="section group">
       <div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(0) %>" class="swipebox" title="<%=namelist.get(0)%>"> <img  width=100% height=100% src="<%=reglist.get(0) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(1) %>" class="swipebox" title="<%=namelist.get(1)%>"> <img  width=100% height=100% src="<%=reglist.get(1) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
					<a href="<%=reglist.get(2) %>" class="swipebox" title="<%=namelist.get(2)%>"> <img  width=100% height=100% src="<%=reglist.get(2) %>" alt=""> <span class="zoom-icon"></span></a>
				</div>
		</div>
		</div></div></div></div>
		<%}
     else if(x!=0 && fs1==4)
{
	System.out.println("h"+fs1);
	System.out.println("hhj"+x);
	System.out.print(reglist.get(0));
%>
<div class="main">
	<div class="wrap">
	    <div class="content_top">
	     <div class="gallery">
   	   <h3 style="color:pink">Latest Photos</h3>
       <div class="section group">
       <div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(0) %>" class="swipebox" title="<%=namelist.get(0)%>"> <img  width=100% height=100% src="<%=reglist.get(0) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(1) %>" class="swipebox" title="<%=namelist.get(1)%>"> <img  width=100% height=100% src="<%=reglist.get(1) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(2) %>" class="swipebox" title="<%=namelist.get(2)%>"> <img  width=100% height=100% src="<%=reglist.get(2) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(3) %>" class="swipebox" title="<%=namelist.get(3)%>"> <img  width=100% height=100% src="<%=reglist.get(3) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		</div>
		</div></div></div></div>
		<%}
     else if(x!=0 && fs1==5)
{
	System.out.println("h"+fs1);
	System.out.println("hhj"+x);
	System.out.print(reglist.get(0));
%>
<div class="main">
	<div class="wrap">
	    <div class="content_top">
	     <div class="gallery">
   	   <h3 style="color:pink">Latest Photos</h3>
       <div class="section group">
       <div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(0) %>" class="swipebox" title="<%=namelist.get(0)%>"> <img  width=100% height=100% src="<%=reglist.get(0) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(1) %>" class="swipebox" title="<%=namelist.get(1)%>"> <img  width=100% height=100% src="<%=reglist.get(1) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(2) %>" class="swipebox" title="<%=namelist.get(2)%>"> <img  width=100% height=100% src="<%=reglist.get(2) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(3) %>" class="swipebox" title="<%=namelist.get(3)%>"> <img  width=100% height=100% src="<%=reglist.get(3) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(4) %>" class="swipebox" title="<%=namelist.get(4)%>"> <img  width=100% height=100% src="<%=reglist.get(4) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		</div>
		</div></div></div></div>
		<%}
		 else if(x!=0 && fs1==6)
{
	System.out.println("h"+fs1);
	System.out.println("hhj"+x);
	System.out.print(reglist.get(0));
%>
<div class="main">
	<div class="wrap">
	    <div class="content_top">
	     <div class="gallery">
   	   <h3 style="color:pink">Latest Photos</h3>
       <div class="section group">
       <div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(0) %>" class="swipebox" title="<%=namelist.get(0)%>"> <img  width=100% height=100% src="<%=reglist.get(0) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(1) %>" class="swipebox" title="<%=namelist.get(1)%>"> <img  width=100% height=100% src="<%=reglist.get(1) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(2) %>" class="swipebox" title="<%=namelist.get(2)%>"> <img  width=100% height=100% src="<%=reglist.get(2) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(3) %>" class="swipebox" title="<%=namelist.get(3)%>"> <img  width=100% height=100% src="<%=reglist.get(3) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(4) %>" class="swipebox" title="<%=namelist.get(4)%>"> <img  width=100% height=100% src="<%=reglist.get(4) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(5) %>" class="swipebox" title="<%=namelist.get(5)%>"> <img  width=100% height=100% src="<%=reglist.get(5) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		</div>
		</div></div></div></div>
		<%}
		 else if(x!=0 && fs1==7)
{
	System.out.println("h"+fs1);
	System.out.println("hhj"+x);
	System.out.print(reglist.get(0));
%>

<div class="main">
	<div class="wrap">
	    <div class="content_top">
	     <div class="gallery">
   	   <h3 style="color:pink">Latest Photos</h3>
       <div class="section group">
       <div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(0) %>" class="swipebox" title="<%=namelist.get(0)%>"> <img  width=100% height=100% src="<%=reglist.get(0) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(1) %>" class="swipebox" title="<%=namelist.get(1)%>"> <img  width=100% height=100% src="<%=reglist.get(1) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(2) %>" class="swipebox" title="<%=namelist.get(2)%>"> <img  width=100% height=100% src="<%=reglist.get(2) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(3) %>" class="swipebox" title="<%=namelist.get(3)%>"> <img  width=100% height=100% src="<%=reglist.get(3) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(4) %>" class="swipebox" title="<%=namelist.get(4)%>"> <img  width=100% height=100% src="<%=reglist.get(4) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(5) %>" class="swipebox" title="<%=namelist.get(5)%>"> <img  width=100% height=100% src="<%=reglist.get(5) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(6) %>" class="swipebox" title="<%=namelist.get(6)%>"> <img  width=100% height=100% src="<%=reglist.get(6) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		</div>
		</div></div></div></div>
		<%}
		 else if(x!=0 && fs1==8)
{
	System.out.println("h"+fs1);
	System.out.println("hhj"+x);
	System.out.print(reglist.get(0));
%>

<div class="main">
	<div class="wrap">
	    <div class="content_top">
	     <div class="gallery">
   	   <h3 style="color:pink">Latest Photos</h3>
       <div class="section group">
       <div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(0) %>" class="swipebox" title="<%=namelist.get(0)%>"> <img  width=100% height=100% src="<%=reglist.get(0) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(1) %>" class="swipebox" title="<%=namelist.get(1)%>"> <img  width=100% height=100% src="<%=reglist.get(1) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(2) %>" class="swipebox" title="<%=namelist.get(2)%>"> <img  width=100% height=100% src="<%=reglist.get(2) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(3) %>" class="swipebox" title="<%=namelist.get(3)%>"> <img  width=100% height=100% src="<%=reglist.get(3) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(4) %>" class="swipebox" title="<%=namelist.get(4)%>"> <img  width=100% height=100% src="<%=reglist.get(4) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(5) %>" class="swipebox" title="<%=namelist.get(5)%>"> <img  width=100% height=100% src="<%=reglist.get(5) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(6) %>" class="swipebox" title="<%=namelist.get(6)%>"> <img  width=100% height=100% src="<%=reglist.get(6) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		<div class="grid_1_of_4 images_1_of_4">
			<a href="<%=reglist.get(7) %>" class="swipebox" title="<%=namelist.get(7)%>"> <img  width=100% height=100% src="<%=reglist.get(7) %>" alt=""> <span class="zoom-icon"></span></a>
		</div>
		</div>
		</div></div></div></div>
		<%}
	else if(x!=0 && fs1>8)
		 {

ArrayList<String> reglist1=new ArrayList<String>();
 ArrayList<String> namelist1=new ArrayList<String>();int count1=0;int x1=0;int starts=0,starts1=0;
 int flag1=0;String srcimg1=null;String actimage1=null;int c1=0;int t1=0;
ResultSet rsfin1=null;PreparedStatement psfin1=null;
String sfin1="select * from images";
con=CrudOperation.createConnection();
	try
	{
	psfin1=con.prepareStatement(sfin1);
	rsfin1=psfin1.executeQuery();
	
	while(rsfin1.next())

	{
		
srcimg1=rsfin1.getString("name");
 c1=rsfin1.getInt("imgid");

String uid=rsfin1.getString("userid");
		String newpath=basepath+"uploads"+uid;

		actimage1=newpath+"/"+srcimg1;
		reglist1.add(actimage1);
		System.out.print(reglist1);
		namelist1.add(srcimg1);
		 }
	
		x1=c1;
		String [] starray=new String[x1];
		String [] starray1=new String[x1];
		System.out.println("hhj"+x1);
		if(x1!=0 && x1>8)
		{
       for(int i=0;i<reglist1.size();i++)
       {
    	 
    	   starray[starts++]=reglist1.get(i);
       }
       
       %>
		  <%System.out.print("array"+starts); %>
		   <%
		   t1=starts-8;
for(int j=starts-1;j>=0;j--)
		   {
			 
	%>
		 
		<a href="<%=starray[j] %>" class="swipebox"  title="<%=namelist1.get(j)%>">
		<img src="<%=starray[j]%>" style="position:relative;top:25%;width:20%;height:30%;left:7%">
		<span class="zoom-icon"></span> </a>

	<%
	if(j==t1)
	{
		break;
	}
		   }
		   }
		   }

	catch(SQLException s)
	{
	System.out.println(s);
	}
	
}
		
%> 	
	
   
    <div class="copy" style="position: absolute;top:100%;width:100%">
    	<p>© 2014  <a href="">EVENTS CLUB</a></p>
    </div>
   
</body>
</html>

