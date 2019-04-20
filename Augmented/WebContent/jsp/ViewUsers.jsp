<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*,java.sql.*,googie.dbinfo.*,javax.servlet.*,googie.beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href='/Augmented/css/external.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/Augmented/css/styleuser.css" media="screen" type="text/css" />
</head>
<body style="background-image:url('/Augmented/images/header.jpg')">
 <% Connection con =null;PreparedStatement ps =null; ResultSet rs =null;
 String srcimg=null;String actimage=null;int ex=0,gd=0,bd=0;
 int flag=0;
 ResultSet rsfin=null;PreparedStatement psfin=null;
 String path = request.getContextPath();
 String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String uid=request.getParameter("txtuserid");
Reg r =new Reg();
r.setUserid(uid);
 System.out.print(uid);
 HttpSession hs=request.getSession(false);
	String likeid=(String)hs.getAttribute("userinfo");
	con=CrudOperation.createConnection();

	String strrate="select * from rating where userid=?";
       
try
{
	PreparedStatement psrate=con.prepareStatement(strrate);
	psrate.setString(1,uid);
	ResultSet rsrate=psrate.executeQuery();
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
catch(SQLException ee)
{
	System.out.println(ee);
}
	

 String str="select * from profile where userid=?";
 try
 {
	 ps=con.prepareStatement(str);
	 ps.setString(1,uid);
		rs=ps.executeQuery();
		if(rs.next())
		{
				srcimg=rs.getString("pic");
	    		String newpath=basepath+"uploads"+uid;
	    		actimage=newpath+"/"+srcimg;
	    		
                  
                  
                  %>

	

				
			
			<header class="block">
			<div class="profile-menu">
                    <p><%=rs.getString("name") %> <a href="#26"><span class="entypo-down-open scnd-font-color"></span></a></p>
                </div>	
                </header>
			 <div style="position:absolute;top:20%;width:75%;height:40%;left:12%;">
<img src="<%=actimage %>" width=100% height=100%>
</div >
		 
	<div class="profile block" style="position:absolute;left:12%;top:65%;width:25%;height:52%;"> <!-- PROFILE (MIDDLE-CONTAINER) -->
                                <div class="profile-picture big-profile-picture clear">
                        <img width="150px" src="<%=actimage%>">
                    </div>
                    <h1 class="user-name"><%=rs.getString("userid") %></h1>
                    <div class="profile-description">
                        <p class="scnd-font-color"><%=rs.getString("designation") %></p>
                         
                       
                    </div>
                    
                    <ul class="profile-options horizontal-list">
                        <li><a class="comments" href="#40"><p><span class="icon fontawesome-comment-alt scnd-font-color"></span><%=ex %></li></p></a>
                        <li><a class="views" href="#41"><p><span class="icon fontawesome-eye-open scnd-font-color"></span><%=gd %></li></p></a>
                        <li><a class="likes" href="#42"><p><span class="icon fontawesome-heart-empty scnd-font-color"></span><%=bd %></li></p></a>
                    </ul>

                </div>
    <div class="profile block" style="position:absolute;left:35%;">
    </div>
    
    <%
  
  
  %>
                                     
                 <div class="menu-box block" style="position:absolute;left:40%;top:65%;width:25%;height:35%;">             
           <form action="/Augmented/RateUsers" method="post">
           <table>
                 <tr><td><h1 class="header-menu-tab">excellent</h1><input type="radio" name="gender" value="excellent"></td>
<td> <h1 class="header-menu-tab">good</h1><input type="radio" name="gender" value="good"></td>
 <td> <h1 class="header-menu-tab">bad</h1><input type="radio" name="gender" value="bad"></td></tr>
  </table>
  <input type="hidden" name="txtuid" value="<%=uid %>">
  <input type="submit" class="button" value="rate">
      </form>                        
           
                </div>
  
                <div class="menu-box block" style="position:absolute;left:68%;top:65%;width:25%;height:52%;"> <!-- MENU BOX (LEFT-CONTAINER) -->
                    <h2 class="titular">ABOUT PERSON</h2>
                    <ul class="menu-box-menu">
                    <p><span class="icon fontawesome-cloud-download scnd-font-color"></span><%=rs.getString("aboutme") %></p>                 
                    </ul>
                </div>
                <div class="join-newsletter block" style="position:absolute;left:12%;top:130%;width:25%;height:40%;" > <!-- JOIN NEWSLETTER (RIGHT-CONTAINER) -->
                    <h2 class="titular">VIEW IMAGE GALLERY</h2>
                    <div class="input-container">
                    <img src="/Augmented/images/footer2.jpg" width=100% height=100%>
             <form action="/Augmented/jsp/ViewGallery.jsp" method="post">
                    <input type="hidden" value="<%=uid %>" name="txtimgid">
                     <input type="submit" value="view" class="button">
                    </form>
                  </div>
                
                </div>
                <div class="join-newsletter block" 
                style="position:absolute;left:68%;top:130%;width:25%;height:40%;"
                
                 > <!-- MEDIA (LEFT-CONTAINER) -->
                 <h2 class="titular">VIEW VIDEO GALLERY</h2>
                    <div class="input-container">
                    <img src="/Augmented/images/footer2.jpg" width=100% height=100%>
                     <form action="/Augmented/jsp/ViewVideos.jsp" method="post">
                     <input type="hidden" value="<%=uid %>" name="txtvid">
                     <input type="submit" value="view" class="button">
                     
                     </form> 
                    </div>
                   
                    <div class="media-control-bar">
                        
				
                     
                   		      </div>
                   		      
						 </div>
                <div class="media block" style="position:absolute;left:40%;top:130%;width:25%;height:40%;" > <!-- MEDIA (LEFT-CONTAINER) -->
                 <h2 class="titular">VIEW AUDIO GALLERY</h2>
                    <div id="media-display">
                     <form action="/Augmented/jsp/ViewAudios.jsp" method="post">
                     <input type="hidden" value="<%=uid %>" name="txtvid">
                     <input type="submit" value="play" class="media-btn play" style="background_color:black">
                     
                     </form> 
                    </div>
                   
                    <div class="media-control-bar">
                        
				
                     
                   		      </div>
                   		      
						 </div>
           
	<div style="position:absolute;left:10%;top:180%;">	
<form method="post" action="/Augmented/Comments" autocomplete="on">
<input type="hidden" value="<%=uid %>" name="user" id="user">
<input type="hidden" value="<%=likeid %>" name="like" id="like">

<table>

<tr><td><textarea rows="10" cols="95" id="txtcomment" name="txtcomment" placeholder="want to comment....." required="required"></textarea></td>
 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
       <div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="POST" /></li>
							
						</ul>
					</div></td></tr>
</table>



</form>		
</div>							
			
			
			
			
		 <% 	
		}
		
		else
			{
				response.sendRedirect("/Augmented/notify/searchuser.html");	
			}
		 }
	

		catch(SQLException se)
		{
			System.out.println(se);
		}
	
%>

		
</body>
</html>