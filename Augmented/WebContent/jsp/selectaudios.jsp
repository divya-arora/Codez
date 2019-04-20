<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,javax.servlet.*,googie.dbinfo.*,java.util.*,googie.beans.*"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
		
		<%
		
		Images i=null;
		int flag=0;
		ArrayList<Images> reglist=new ArrayList<Images>();
		ArrayList<String> imglist=new ArrayList<String>();
		PreparedStatement ps =null;ResultSet rs =null;
		HttpSession hs=request.getSession(false);
		String uid=(String)hs.getAttribute("userinfo");
		String srcimg=null;String actimage=null;
		Connection con=null;
		ResultSet rsfin=null;PreparedStatement psfin=null;
		System.out.print("img"+uid);
		int imageid=0;
System.out.print("img"+uid);
String eid=request.getParameter("evid");
con=CrudOperation.createConnection();
String path = request.getContextPath();

String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String sfin="select * from audios where userid=?";
try
{
psfin=con.prepareStatement(sfin);
psfin.setString(1,uid);
rsfin=psfin.executeQuery();

while(rsfin.next())

{
	flag++;
i=new Images();
srcimg=rsfin.getString("name");
i.setImageid(rsfin.getInt("aid"));
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
			
<%if(flag>0)
{
   
     for(int j=0;j<reglist.size();j++)
{ 
    	 
    i=reglist.get(j);	
	%>
	<form action="/Augmented/jsp/selectaudios1.jsp" method="post">
	<input type="checkbox" value=<%=i.getImagename()%> id="imgid" name="imgid">
	<input type="hidden" value="<%=uid %>" id="userid" name="userid"> 
	<input type="hidden" value="<%=eid%>" id="evid" name="evid">
	<video controls src="<%=imglist.get(j)%>" id="img1" style="psition:absolute;top:25%;width: 31%;height:31%" type="video/mp4"></video>
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
     
     <div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="SELECT AUDIOS" /></li>
							
						</ul>
					</div>
</form>
	<%}
else
{%>
	<h3>NO AUDIOS ARE PRESENT</h3>
<%} %>


		</body>
</html>