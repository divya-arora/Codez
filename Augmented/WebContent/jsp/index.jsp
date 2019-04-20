<%@ page import="java.util.*,java.io.*,java.sql.*,googie.dbinfo.*,java.util.*,java.text.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>index</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/Augmented/css/style.css" rel="stylesheet" type="text/css" media="all"/>
 <link href="/Augmented/css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="/Augmented/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="/Augmented/js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    
    </script>
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
					 <a href="/Augmented/events_club-web/web/index.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>
				  <div class="menu">
					<ul>
						<li><a href="/Augmented/html/index1.html">HOME</a></li>
				    	<li><a href="/Augmented/jsp/latestevents.jsp">EVENTS</a></li>
				    	<li><a href="/Augmented/jsp/latestphotos.jsp">GALLERY</a></li>
				    	
				    	<li><a href="/Augmented/jsp/userprofile.jsp">PANEL</a></li>
				    	
				    </ul>				    
				 </div>
			     <div class="clear"></div>
		      </div>		   
		  </div>
		<!------ Slider ------------>
		<div class="wrap">
		  <div class="slider">
	      	<div class="slider-wrapper theme-default">
	            <div id="slider" class="nivoSlider">
	                <img  src="/Augmented/images/1.jpg" data-thumb="/Augmented/images/1.jpg" alt="" />
	                <img  src="/Augmented/images/3.jpg" data-thumb="/Augmented/images/3.jpg" alt="" />
	            </div>
	        </div>
   		</div>
   	  </div>
		<!------End Slider ------------>
  </div>
  		    
  	<%
   int x1=0,c1=0;int starts1=0;int t1=0;String montht=null;String [] ct=null;int fs1=0;	String [] todayu=null;
   ArrayList<String> datelist=new ArrayList<String>();
   ArrayList<String> monthlist=new ArrayList<String>();
   ArrayList<String> snaplist=new ArrayList<String>();String dates=null;
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
			if(ct[0].equals("1"))
			{
			ct[0]="01";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("2"))
			{
			ct[0]="02";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("3"))
			{
			ct[0]="03";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("4"))
			{
			ct[0]="04";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("5"))
			{
			ct[0]="05";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("6"))
			{
			ct[0]="06";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("7"))
			{
			ct[0]="07";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("8"))
			{
			ct[0]="08";
			System.out.println("present"+ct[0]);
			}
			if(ct[0].equals("9"))
			{
			ct[0]="09";
			System.out.println("present"+ct[0]);
			}


			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
	
		%>

					
										
  
      <div class="main">
     	<div class="wrap">
     	   <div class="section group">
				<div class="listview_1_of_3 images_1_of_3 event_grid">
					<a href="/Augmented/jsp/latestevents.jsp">
					<div class="listimg listimg_1_of_2">
						  <img src="<%=snaplist.get(0) %>" alt="" />
					</div>
					<div class="text list_1_of_2">
						<div class="date">
							<figure><span><%=datelist.get(0) %></span><%=monthlist.get(0) %></figure>
						</div>
					</div></a>
				</div>				
							</div>
					<%}}
   
					else if(x1!=0 && fs1==2)
		{
						if(ct[0].equals("1"))
						{
						ct[0]="01";
						System.out.println("present"+ct[0]);
						}
						
						if(ct[0].equals("2"))
						{
						ct[0]="02";
						System.out.println("present"+ct[0]);
						}
						
						if(ct[0].equals("3"))
						{
						ct[0]="03";
						System.out.println("present"+ct[0]);
						}
						
						if(ct[0].equals("4"))
						{
						ct[0]="04";
						System.out.println("present"+ct[0]);
						}
						
						if(ct[0].equals("5"))
						{
						ct[0]="05";
						System.out.println("present"+ct[0]);
						}
						
						if(ct[0].equals("6"))
						{
						ct[0]="06";
						System.out.println("present"+ct[0]);
						}
						
						if(ct[0].equals("7"))
						{
						ct[0]="07";
						System.out.println("present"+ct[0]);
						}
						
						if(ct[0].equals("8"))
						{
						ct[0]="08";
						System.out.println("present"+ct[0]);
						}
						if(ct[0].equals("9"))
						{
						ct[0]="09";
						System.out.println("present"+ct[0]);
						}
			
			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
	
		%>

					
										
  
        <div class="main">
     	<div class="wrap">
     	   <div class="section group">
				<div class="listview_1_of_3 images_1_of_3 event_grid">
					<a href="/Augmented/jsp/latestevents.jsp">
					<div class="listimg listimg_1_of_2">
						  <img src="<%=snaplist.get(0) %>" alt="" />
					</div>
					<div class="text list_1_of_2">
						<div class="date">
							<figure><span><%=datelist.get(0) %></span><%=monthlist.get(0) %></figure>
						</div>
					</div></a>
				</div>				
				<div class="listview_1_of_3 images_1_of_3 event_grid">
					<a href="/Augmented/jsp/latestevents.jsp">
					<div class="listimg listimg_1_of_2">
						  <img src="<%=snaplist.get(1) %>" alt="" />
					</div>
					<div class="text list_1_of_2">
						<div class="date">
							<figure><span><%=datelist.get(1) %></span><%=monthlist.get(1) %></figure>
						</div>
				     </div>
				     </a>
				</div>				
						
			</div>
					<%}}
				else if(x1!=0 && fs1==3)
		{
					if(ct[0].equals("1"))
					{
					ct[0]="01";
					System.out.println("present"+ct[0]);
					}
					
					if(ct[0].equals("2"))
					{
					ct[0]="02";
					System.out.println("present"+ct[0]);
					}
					
					if(ct[0].equals("3"))
					{
					ct[0]="03";
					System.out.println("present"+ct[0]);
					}
					
					if(ct[0].equals("4"))
					{
					ct[0]="04";
					System.out.println("present"+ct[0]);
					}
					
					if(ct[0].equals("5"))
					{
					ct[0]="05";
					System.out.println("present"+ct[0]);
					}
					
					if(ct[0].equals("6"))
					{
					ct[0]="06";
					System.out.println("present"+ct[0]);
					}
					
					if(ct[0].equals("7"))
					{
					ct[0]="07";
					System.out.println("present"+ct[0]);
					}
					
					if(ct[0].equals("8"))
					{
					ct[0]="08";
					System.out.println("present"+ct[0]);
					}
					if(ct[0].equals("9"))
					{
					ct[0]="09";
					System.out.println("present"+ct[0]);
					}
		

			if(!(ct[0].equals(todayu[2])&& montht.equals(todayu[1]) && ct[2].equals(todayu[5])))
			{
			System.out.println("h"+fs1);
			System.out.println("hhj"+x1);
	
		%>

					
										
  
    <div class="main">
     	<div class="wrap">
     	   <div class="section group">
				<div class="listview_1_of_3 images_1_of_3 event_grid">
					<a href="/Augmented/jsp/latestevents.jsp">
					<div class="listimg listimg_1_of_2">
						  <img src="<%=snaplist.get(0) %>" alt="" />
					</div>
					<div class="text list_1_of_2">
						<div class="date">
							<figure><span><%=datelist.get(0) %></span><%=monthlist.get(0) %></figure>
						</div>
					</div></a>
				</div>				
				<div class="listview_1_of_3 images_1_of_3 event_grid">
					<a href="/Augmented/jsp/latestevents.jsp">
					<div class="listimg listimg_1_of_2">
						  <img src="<%=snaplist.get(1) %>" alt="" />
					</div>
					<div class="text list_1_of_2">
						<div class="date">
							<figure><span><%=datelist.get(1) %></span><%=monthlist.get(1) %></figure>
						</div>
				     </div>
				     </a>
				</div>				
				<div class="listview_1_of_3 images_1_of_3 event_grid">
					<a href="/Augmented/jsp/latestevents.jsp">
					<div class="listimg listimg_1_of_2">
						  <img src="<%=snaplist.get(2) %>" alt="" />
					</div>
					<div class="text list_1_of_2">
						<div class="date">
							<figure><span><%=datelist.get(2) %></span><%=monthlist.get(2) %></figure>
						</div>
				    </div>
				    </a>
				</div>				
			</div>
						<%}}
	 else if(x1!=0 && fs1>3)
		{
		 if(ct[0].equals("1"))
			{
			ct[0]="01";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("2"))
			{
			ct[0]="02";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("3"))
			{
			ct[0]="03";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("4"))
			{
			ct[0]="04";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("5"))
			{
			ct[0]="05";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("6"))
			{
			ct[0]="06";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("7"))
			{
			ct[0]="07";
			System.out.println("present"+ct[0]);
			}
			
			if(ct[0].equals("8"))
			{
			ct[0]="08";
			System.out.println("present"+ct[0]);
			}
			if(ct[0].equals("9"))
			{
			ct[0]="09";
			System.out.println("present"+ct[0]);
			}


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
				if(xx!=0 && xx>=3)
				{
			   for(int i=0;i<datelistt.size();i++)
			   {
				 
				   starrayy[startss++]=datelistt.get(i);
			   }%>
				  <%System.out.print(startss); %>
				   <%
				   tt=startss-3;
			for(int j=startss-1;j>=0;j--)
				   {
					 
			%>
			     	   
					
			     	
			     	   <div>
							<div class="listview_1_of_3 images_1_of_3 event_grid">
								<a href="/Augmented/jsp/latestevents.jsp">
								<div class="listimg listimg_1_of_2">
									  <img src="<%=snaplistt.get(j) %>" alt="" />
								</div>
								<div class="text list_1_of_2">
									<div class="date">
								<figure><span><%=datelistt.get(j)%></span><%=monthlistt.get(j)%></figure>
									</div></a>
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

	 
	 
	 
	 
	 <div class="content_bottom">
			 <div class="section group">
				<div class="col_1_of_3 span_1_of_3 today_show">
					<h3>Today's Show</h3>
					
	 <%int fs=0;
String strtoday1="select * from eventss";
con=CrudOperation.createConnection();
 String [] months1={"Jan","Feb,","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
try
{
	
	java.util.Date d=new java.util.Date();	
	String f1=d.toString();
	String [] today1=f1.split(" ");
	 System.out.print("hhjhj"+today1[2]);
	System.out.println(today1[1]);
	System.out.println(today1[5]); 
	PreparedStatement pstoday1=con.prepareStatement(strtoday1);
	ResultSet rstoday1=pstoday1.executeQuery();
	while(rstoday1.next())
	{
		String srcsnap1=rstoday1.getString("snap");

		String newpath1=basepath+"uploads"+"eve";

		String actsnap1=newpath1+"/"+srcsnap1;
String about=rstoday1.getString("eventname");
		String datee1=rstoday1.getString("date");
		String [] ct1=datee1.split("-");
		/* System.out.print("hhjhj"+ct[0]);
		System.out.print(ct[1]);
		System.out.print(ct[2]); */
		String month=null;
		int m1=Integer.parseInt(ct1[1]);
		switch(m1)
		{
		
			case 1:month=months1[0];break;
			case 2:month=months1[1];break;
			case 3:month=months1[2];break;
			case 4:month=months1[3];break;
			case 5:month=months1[4];break;
			case 6:month=months1[5];break;
			case 7:month=months1[6];break;
			case 8:month=months1[7];break;
			case 9:month=months1[8];break;
			case 10:month=months1[9];break;
			case 11:month=months1[10];break;
			case 12:month=months1[11];break;
		}%>
					<%
System.out.println("date"+month+ct1[0]+ct1[2]);
					if(ct1[0].equals("1"))
					{
					ct1[0]="01";
					System.out.println("present"+ct1[0]);
					}
					
					if(ct1[0].equals("2"))
					{
					ct1[0]="02";
					System.out.println("present"+ct1[0]);
					}
					
					if(ct1[0].equals("3"))
					{
					ct1[0]="03";
					System.out.println("present"+ct1[0]);
					}
					
					if(ct1[0].equals("4"))
					{
					ct1[0]="04";
					System.out.println("present"+ct1[0]);
					}
					
					if(ct1[0].equals("5"))
					{
					ct1[0]="05";
					System.out.println("present"+ct1[0]);
					}
					
					if(ct1[0].equals("6"))
					{
					ct1[0]="06";
					System.out.println("present"+ct1[0]);
					}
					
					if(ct1[0].equals("7"))
					{
					ct1[0]="07";
					System.out.println("present"+ct1[0]);
					}
					
					if(ct1[0].equals("8"))
					{
					ct1[0]="08";
					System.out.println("present"+ct1[0]);
					}
					if(ct1[0].equals("9"))
					{
					ct1[0]="09";
					System.out.println("present"+ct1[0]);
					}
				
if(ct1[0].equals(today1[2]) && month.equals(today1[1]) && ct1[2].equals(today1[5]))
		{
		fs=1;
	System.out.print("equal");%>
	<img src="<%=actsnap1%>" alt="" />
	<h5><span><%=ct1[0]+" "+month%></span></h5>
	<h5><%=about %></h5>
	<a href="#" class="button">View More</a>
	<% break;
	}

	}
	if(fs==0)
	{%>
		<h5>No Show Today</h5>
	<%}
	
}

catch(SQLException de)
{
	System.out.print(de);
}

%> 
					
										
					
				</div>
					<div class="col_1_of_3 span_1_of_3">
						<h3>New Tracks</h3>
					            <div class="track_list">
					           
 

<%ArrayList<String> reglist=new ArrayList<String>();int fa=0;
 ArrayList<String> namelist=new ArrayList<String>();int count=0;int xa=0;
int flag=0;String srcimg=null;String actimage=null;int ca=0;int fsa=0;
ResultSet rsfin=null;PreparedStatement psfin=null;


String sfin="select * from audios";
con=CrudOperation.createConnection();
	try
	{
	psfin=con.prepareStatement(sfin);
	rsfin=psfin.executeQuery();
	while(rsfin.next())

	{
		fa=1;
		fsa++;
srcimg=rsfin.getString("name");
 ca=rsfin.getInt("aid");

String uid=rsfin.getString("userid");
		String newpath=basepath+"uploads"+uid;

		actimage=newpath+"/"+srcimg;
		reglist.add(actimage);
		
		namelist.add(srcimg);
		
		
		
	}
		xa=ca;
		
		
		
	}
	catch(SQLException s)
	{
	System.out.println(s);
	
	}
	
	
%>
 
    <%  if(xa==0)
		{%>
			<div class="wrap">
     	    <div class="content_top">
     	     <div class="gallery">
           	  	
           	   <!--  <a href="/Augmented/jsp/latestaudios.jsp"><img src="/Augmented/images/videos.jpg" alt="" /></a>
 -->           	   </div>
           	   </div>
           	   </div>
		<% }
		else if(xa!=0 && fsa==1)
		{
			System.out.println("h"+fs1);
			System.out.println("hhj"+xa);
			System.out.print(reglist.get(0));
		%>
      <div class="col_1_of_3 span_1_of_3">
						
					            <div class="track_list">
					  	              <ul>
										<li><h5><%=namelist.get(0)%></h5></li>
									
									</ul>
					            </div>
							</div>
				<%}else if(xa!=0 && fsa==2)
				{
					System.out.println("h"+fsa);
					System.out.println("hhj"+xa);
					System.out.print(reglist.get(0));
				%>
			  <div class="col_1_of_3 span_1_of_3">
						
					            <div class="track_list">
					  	              <ul>
										<li><h5><%=namelist.get(0)%></h5></li>
									<li><h5><%=namelist.get(1)%></h5></li>
									</ul>
					            </div>
							</div>
					  
			<%}
		else if(xa!=0 && fsa==3)
		{
			
			System.out.print(reglist.get(0));
		%>
		 <div class="col_1_of_3 span_1_of_3">
						
					            <div class="track_list">
					  	              <ul>
										<li><h5><%=namelist.get(0)%></h5></li>
									<li><h5><%=namelist.get(1)%></h5></li>
									<li><h5><%=namelist.get(2)%></h5></li>
									</ul>
					            </div>
							</div>
				<%}
		     else if(xa!=0 && fsa==4)
		{
			
			System.out.print(reglist.get(0));
		%>
		 <div class="col_1_of_3 span_1_of_3">
						
					            <div class="track_list">
					  	              <ul>
										<li><h5><%=namelist.get(0)%></h5></li>
									<li><h5><%=namelist.get(1)%></h5></li>
									<li><h5><%=namelist.get(2)%></h5></li>
										<li><h5><%=namelist.get(3)%></h5></li>
									</ul>
					            </div>
							</div>
				<%}
		     else if(xa!=0 && fsa==5)
		{
			
			System.out.print(reglist.get(0));
		%>
		 <div class="col_1_of_3 span_1_of_3">
						
					            <div class="track_list">
					  	              <ul>
										<li><h5><%=namelist.get(0)%></h5></li>
									<li><h5><%=namelist.get(1)%></h5></li>
									<li><h5><%=namelist.get(2)%></h5></li>
										<li><h5><%=namelist.get(3)%></h5></li>
										<li><h5><%=namelist.get(4)%></h5></li>
									</ul>
					            </div>
							</div>
				<%}
				 else if(xa!=0 && fsa==6)
		{
			System.out.println("h"+fsa);
			System.out.println("hhj"+xa);
			System.out.print(reglist.get(0));
		%>
		<div class="col_1_of_3 span_1_of_3">
						
					            <div class="track_list">
					  	              <ul>
										<li><h5><%=namelist.get(0)%></h5></li>
									<li><h5><%=namelist.get(1)%></h5></li>
									<li><h5><%=namelist.get(2)%></h5></li>
										<li><h5><%=namelist.get(3)%></h5></li>
										<li><h5><%=namelist.get(4)%></h5></li>
										<li><h5><%=namelist.get(5)%></h5></li>
									</ul>
					            </div>
							</div>
				<%}
				 else if(xa!=0 && fsa==7)
		{
			System.out.println("h"+fsa);
			System.out.println("hhj"+xa);
			System.out.print(reglist.get(0));
		%>

			<div class="col_1_of_3 span_1_of_3">
						
					            <div class="track_list">
					  	              <ul>
										<li><h5><%=namelist.get(0)%></h5></li>
									<li><h5><%=namelist.get(1)%></h5></li>
									<li><h5><%=namelist.get(2)%></h5></li>
										<li><h5><%=namelist.get(3)%></h5></li>
										<li><h5><%=namelist.get(4)%></h5></li>
										<li><h5><%=namelist.get(5)%></h5></li>
										<li><h5><%=namelist.get(6)%></h5></li>
									</ul>
					            </div>
							</div>
				<%}
				 else if(xa!=0 && fsa==8)
		{
			System.out.println("h"+fsa);
			System.out.println("hhj"+xa);
			System.out.print(reglist.get(0));
		%>

		<div class="col_1_of_3 span_1_of_3">
						
					            <div class="track_list">
					  	              <ul>
										<li><%=namelist.get(0)%></li>
									<li><%=namelist.get(1)%></li>
									<li><%=namelist.get(2)%></li>
										<li><%=namelist.get(3)%></li>
										<li><%=namelist.get(4)%></li>
										<li><%=namelist.get(5)%></li>
										<li><%=namelist.get(6)%></li>
										<li><%=namelist.get(7)%></li>
									</ul>
					            </div>
							</div>
				<%}%>
				
				
				
				
		<a href="/Augmented/jsp/latestaudios.jsp" class="button">Play</a>
																	     
					            </div>
							</div>
				<div class="col_1_of_3 span_1_of_3">
					<h3>Latest Videos</h3>
					  <a href="/Augmented/jsp/latestvideos.jsp"><img src="/Augmented/images/videos.jpg" alt="" /></a>
					<p>These are the latest videos uploaded by our users</p>
					<a href="/Augmented/jsp/latestvideos.jsp" class="button">See All</a>
				</div>
			</div>
		 </div>
		</div>
     </div>
     <div class="footer">
       <div class="wrap">
    	<div class="half-footer" style="margin-left:0">
    	<video controls src="/Augmented/animation.mp4" type="videos/mp4" width=100% height=100% autoplay></video>
        <div class="footer-pic"><img src="/Augmented/images/f-icon.png" alt=""></div>
        <div class="clear"></div>
        </div>
        <div class="half-footer" style="border:none;position:absolute;height:35%;width:33%;left:50%">
     <iframe src="/Augmented/tic-tac-toe/f.html" width=100% height=100%></iframe>
         </div>
    	<div class="clear"></div>        
      </div>
    </div>
    <div class="copy">
    	<p>© 2014 EVENTS CLUB</p>
    </div>
</body>
</html>

