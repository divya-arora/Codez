<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,googie.dbinfo.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
 <link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css">
 <link href="/Augmented/css/styleuser.css" rel="stylesheet" type="text/css">
 <!-- <style>
 .container {
		float: left;
		width: 300px;
	}
		.block {
			margin-bottom: 25px;
			background: #394264;
			border-radius: 5px;
		}
 .profile-picture {
	border-radius: 100%;
	overflow: hidden;
	-webkit-box-sizing: content-box;
  	-moz-box-sizing: content-box;
  	box-sizing: content-box;	
}
	.big-profile-picture {
		margin: 0 auto;		
		border: 5px solid #50597b;
		width: 150px;
		height: 150px;
	}
 .middle-container {
			margin: 0 25px;			
		}
			.profile {
				height: 410px;
			}
				.user-name {
					margin: 25px 0 16px;
					text-align: center;
				}
				.profile-description {
					width: 210px;
					margin: 0 auto;
					text-align: center;
				}
				.profile-options {
					padding-top: 23px;
				}
					.profile-options li {
						border-left: 1px solid #1f253d;
					}
						.profile-options p {
							margin: 0;
						}
						.profile-options a {
							display: block;					
							width: 99px;
							line-height: 60px;
							text-align: center;
							-webkit-transition: background .3s;
							transition: background .3s;				
						}
							.profile-options a:hover {
								text-decoration: none;
								background: #50597b;
							}
							.profile-options a:hover.comments .icon {
								color: #fcb150;
							}
							.profile-options a:hover.views .icon {
								color: #11a8ab;
							}
							.profile-options a:hover.likes .icon {
								color: #e64c65;
							}
							.profile-options .icon {
								padding-right: 10px;
							}
							.profile-options .comments {
								border-top: 4px solid #fcb150;
							}
							.profile-options .views {
								border-top: 4px solid #11a8ab;
							}
							.profile-options .likes {
								border-top: 4px solid #e64c65;
							}
		
 </style>
 --></head>
<body style="background-image:url('/Augmented/images/header.jpg')">
 <%Connection con=null;int flag=0;String srcimg=null;String actimage=null;
ResultSet rsfin=null;PreparedStatement psfin=null;
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String sfin="select * from profile where userid=?";
con=CrudOperation.createConnection();
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
System.out.println(uid);
if(uid==null)
{
	response.sendRedirect("/Augmented/jsp/index.jsp?msg1=invalid login");
}
else
{
	
	try
	{
	psfin=con.prepareStatement(sfin);
	psfin.setString(1, uid);
	rsfin=psfin.executeQuery();
	if(rsfin.next())
	{
		flag=1;
		srcimg=rsfin.getString("pic");
		if(!srcimg.equals("null"))
		{
		String newpath=basepath+"uploads"+uid;
		actimage=newpath+"/"+srcimg;
		System.out.println(actimage);
		}
		else
		{
			actimage="/Augmented/images/defaultpic.jpg";
		}
	}
	/* else
	{ 
		actimage="/Augmented/images/defaultpic.jpg";
	}
	}
	catch(SQLException s)
	{
	System.out.println(s);
	
	actimage="/Augmented/images/defaultpic.jpg";
	} */
	
	
%>

 <div style="position:absolute;left:30%;width:100%;height: 10%;background-image: url('/Augmented/images/header.jpg')">
<p >WELCOME TO YOUR PROFILE&nbsp;&nbsp;&nbsp;<font >&nbsp;&nbsp;&nbsp;<%=uid %></font></p>
<p align="right">Date:&nbsp;<b><%=new java.util.Date() %></b></p>
</div>        
<div id="divmenu" style="position:absolute;top:5%;left:2%;width:100%;height:100%;">
<div class="wrap">
			
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
		 	
			<div class="cssmenu">
					<ul>
					   <li><a href="/Augmented/jsp/userprofile.jsp"><span>Home</span></a></li>
					    <li  class="has-sub"><a href="/Augmented/jsp/userprofile.jsp"><span>PROFILE</span></a>
					   	<ul>
					   	<li class="has-sub">
					 

	<%if(flag==0)
		{%>
                   <a href="/Augmented/jsp/createprofile.jsp"><span>CREATE</span></a>
		<%} %>
	
					   	
					   
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
				 	<form action="/Augmented/jsp/ViewUsers.jsp" method="post">
                        <input type="text" placeholder="username" name="txtuserid" class="email text-input">
                        
                
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
<div style="position:absolute;top:30%;width:70%;height:40%;left:7%;">

<img src="<%=actimage %>" width=100% height=100%>
</div >
 <%int ex=0,gd=0,bd=0;
                    String strrate="select * from rating where userid=?";
                    
                    try
                    {
                    	PreparedStatement psrate=con.prepareStatement(strrate);
                    	psrate.setString(1,uid);
                    	ResultSet rsrate=psrate.executeQuery();
                    	if(rsrate!=null)
                    	{
                    	while(rsrate.next())
                    	{
                    		String grades=rsrate.getString("rate");
                    		if(grades.equals("excellent"))
                    		{
                    			ex++;
                    		}
                    		
                    		else if(grades.equals("good"))
                    		{
                    		gd++;	
                    		}
                    		else
                    		{
                    			bd++;
                    			
                    		}
                    		
                    		
                    	}
                    }
                    }
                    catch(SQLException ee)
                    {
                    	System.out.println(ee);
                    }

                    
                    
                    %>
  <div class="profile block" style="position:absolute;left:12%;top:72%;width:25%;height:54%;"> <!-- PROFILE (MIDDLE-CONTAINER) -->
                                <div class="profile-picture big-profile-picture clear">
                        <img width="150px" src="<%=actimage%>">
                    </div>
                    <h1 class="user-name"><%=rsfin.getString("userid") %></h1>
                    <div class="profile-description">
                        <p class="scnd-font-color"><%=rsfin.getString("designation") %></p>
                         
                       
                    </div>
                    
                    <ul class="profile-options horizontal-list">
                        <li><a class="comments" href="#40"><p><span class="icon fontawesome-comment-alt scnd-font-color"></span><%=ex %></li></p></a>
                        <li><a class="views" href="#41"><p><span class="icon fontawesome-eye-open scnd-font-color"></span><%=gd %></li></p></a>
                        <li><a class="likes" href="#42"><p><span class="icon fontawesome-heart-empty scnd-font-color"></span><%=bd %></li></p></a>
                    </ul>

                </div>
    <div class="profile block" style="position:absolute;left:35%;">
    </div>

<iframe style="position:absolute;left:71%;top:30%;width:25%;height:100%;" src="/Augmented/jsp/viewcomments.jsp"></iframe>









<%
	}
	catch(SQLException s)
	{
	System.out.println(s);
	
	actimage="/Augmented/images/defaultpic.jpg";
	}
	}
	%>

</body>
</html>