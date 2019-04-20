<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,javax.servlet.*,googie.dbinfo.*,java.util.*,googie.beans.*"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
<link href="/Augmented/css/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<%


Images i=null;
ArrayList<Images> reglist=new ArrayList<Images>();
ArrayList<String> imglist=new ArrayList<String>();
PreparedStatement ps =null;ResultSet rs =null;
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
int flag=0;String srcimg=null;String actimage=null;
Connection con=null;
ResultSet rsfin=null;PreparedStatement psfin=null;
System.out.print("img"+uid);
int imageid=0;
String etype=request.getParameter("type");
String edate=request.getParameter("date");
String evenid=request.getParameter("evid");
int eid=Integer.parseInt(evenid);
con= CrudOperation.createConnection();
String str="insert into eventusers values(?,?,?,?)"; 
 String str1="select * from eventusers";
 try
	{
	 PreparedStatement psinsert=con.prepareStatement(str);
	 psinsert.setString(1,evenid);
		psinsert.setString(2, uid);
		psinsert.setString(3,edate);
		psinsert.setString(4,etype);
		try
		{
			PreparedStatement  psselect=con.prepareStatement(str1);
			 ResultSet rsselect=psselect.executeQuery();
			if(rsselect!=null)
			{
		while(rsselect.next())
				
			{
			int dtt=rsselect.getInt("eventid");
			String user=rsselect.getString("userid");
			if((dtt==eid) && user.equalsIgnoreCase(uid))
			{
	%>
			<p>You have already joined</p>
			
			<%
			response.sendRedirect("/Augmented/notify/alreadyjoined.html");
			flag=1;
			
			}
			}
		}
			
		}
		catch(SQLException see)
		{
			System.out.print(see);
		}
		if(flag==0)
			{
		int rw=psinsert.executeUpdate();
		if(rw>0)
		{
			%>
		<%
System.out.print("img"+uid);
con=CrudOperation.createConnection();
String path = request.getContextPath();

String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int t=0;
String sfin="select * from images where userid=?";
try
{
psfin=con.prepareStatement(sfin);
psfin.setString(1,uid);
rsfin=psfin.executeQuery();

while(rsfin.next())

{
	t++;
i=new Images();
srcimg=rsfin.getString("name");
i.setImageid(rsfin.getInt("imgid"));
	i.setImagename(rsfin.getString("name"));
String newpath=basepath+"uploads"+uid;

	actimage=newpath+"/"+srcimg;
	reglist.add(i);
	imglist.add(actimage);
	System.out.println(imglist);
	}

	}

		catch(SQLException s)

		{

		System.out.println(s);

		}

%>
			
<%
   if(t>0)
   {
     for(int j=0;j<reglist.size();j++)
{ 
    	 
    i=reglist.get(j);	
	%>
	<form action="/Augmented/jsp/selectimages.jsp" method="post">
	<input type="checkbox" value=<%=i.getImagename()%> id="imgid" name="imgid">
	<input type="hidden" value="<%=uid %>" id="userid" name="userid"> 
	<input type="hidden" value="<%=evenid%>" id="evid" name="evid">
	<img src="<%=imglist.get(j)%>" id="img1" style="psition:absolute;top:25%;width: 31%;height:31%">
<%
}


     %>
   <%--  
    <%for(int t=0;t<imglist.size();t++)
{ 
    	 	
	%>
	<img src="<%=imglist.get(t)%>" id="img1" style="psition:absolute;top:25%;width: 33%;height:33%">
     <%} %>
     --%>
     
    <!--  <input type="submit" value="select"> -->
     <div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="SELECT" /></li>
							
						</ul>
					</div>
</form>
<%
   }
   else
   {

%>
<div class="wrap">
     	    <div class="content_top">
     	     <div class="gallery">
           	   <h3>FIRST UPLOAD GALLERY</h3>
           	   </div>
           	   </div>
           	   </div>
						<%}
		System.out.print("inserted");
			}
		else
			out.print("not inserted");
			}
			}
		
		
	
		catch(SQLException se)
		{
			System.out.print(se);
		}
	
				
		
		
		
		%>
		
		</body>
</html>