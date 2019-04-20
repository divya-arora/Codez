<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,googie.dbinfo.*,java.util.*,javax.servlet.*,googie.beans.*,javax.servlet.http.HttpServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/Augmented/css/style1.css" media="screen" type="text/css" />
</head>
<style>
.container {
  width: 650px;
  position:absolute;
  left:20%;
  margin: 25px auto;
  padding: 10px;
  background: rgba(255,255,255,.3);
  overflow: hidden;
  border-radius: 10px;
}

.signup {
  float: left;
  width: 300px;
  height:300px;
  padding: 30px 20px;
  background-color: white;
  text-align: center;
  border-radius: 5px 0 0 5px;
}

.sub {
  margin-top: 25px;
  width: 80%;
  border: 0;
  background: #3498db;
  border-radius: 5px;
  height: 50px;
  color: white;
  font-weight: 400;
  font-size: 1em;
}
.fill{
  margin-top: 25px;
  width: 80%;
  border: 0;
  background: #3498db;
  border-radius: 5px;
  height: 50px;
  color: white;
  font-weight: 400;
  font-size: 1em;
}
select
{
	
	 display: block;
  margin: 0 auto;
  width: 80%;
  border: 0;
  border-bottom: 1px solid rgba(0,0,0,.2);
  height: 45px;
  line-height: 45px;  
  margin-bottom: 10px;
  font-size: 1em;
  color: rgba(0,0,0,.4);
  transition: all ease-in-out 1s;
	
	
}
select:focus {
  outline: none;
  border-color: #3498db;
}


.display {
  float: left;
  margin: 0;
  padding: 0;
  border-radius: 0 5px 5px 0;
  background: rgba(0,0,0,1);
  height: 367px;
}


  



</style>
</head>

<body style="background-image: url('/Augmented/images/header.jpg');">
<% Connection con =null;PreparedStatement ps =null;ResultSet rs =null;
String srcimg=null;String actimage=null;
ResultSet rsfin=null;PreparedStatement psid=null;
 PreparedStatement psfin=null;

java.sql.ResultSet rsid=null;
int rgid;
String path = request.getContextPath();
String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
%>
  
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
  
  
  <div class='container' style="position: absolute;top: 30%;">
  <div class='signup'>
     <form action="/Augmented/UploadAudio" method="post" enctype="Multipart/form-data">
         <input type="file" placeholder='CHOOSE' class="fill" name="uservideo">
        
     
       
       <input type='submit' placeholder='SUBMIT'class="sub" />
     </form>
  </div>
  
 <%  String sql="select max(aid) from audios";
  con=CrudOperation.createConnection();
    try
    {
    	psid=con.prepareStatement(sql);
    	rsid=psid.executeQuery();
    	rsid.next();
		rgid=rsid.getInt(1);
		System.out.println(rgid);
		 String strs="select name from audios where aid=?";
		    try
		    {
		    		ps=con.prepareStatement(strs);
		    		ps.setInt(1,rgid);
		    		ResultSet rsname=ps.executeQuery();
		    		if(rsname.next())
		    		{
		    			srcimg=rsname.getString("name");
		    			String newpath=basepath+"uploads"+uid;
		    			actimage=newpath+"/"+srcimg;	
		    			System.out.println(actimage);
		    		}
		    }
		    catch(SQLException see)
	    	{
	    		System.out.print(see);
	    	}
		    }

		    	catch(SQLException seee)
		    	{
		    		System.out.print(seee);
		    	}
		    
	

    	%>
  
  <audio  class="display" id='my_video_1' class='video-js vjs-default-skin' controls
 preload='auto' width='640' height='367' poster='gg.jpg'
 data-setup='{}'>
  <source src='<%=actimage %>' type='video/mp4'>
 </video>
</div>

  <script src='http://codepen.io/assets/libs/fullpage/none.js'></script>

</body>


</html>