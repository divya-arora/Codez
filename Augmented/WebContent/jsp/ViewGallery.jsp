<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*,googie.dbinfo.*,java.util.*,javax.servlet.*,googie.beans.*,javax.servlet.http.HttpServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<body style="background-image:url('/Augmented/images/header.jpg')">
<%ArrayList<String> reglist=new ArrayList<String>();
ArrayList<String> namelist=new ArrayList<String>();
Connection con=null;int flag=0;String srcimg=null;String actimage=null;

ResultSet rsfin=null;PreparedStatement psfin=null;
String uid=request.getParameter("txtimgid");
System.out.print("img"+uid);
 
String path = request.getContextPath();

String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String sfin="select * from images where userid=?";
con=CrudOperation.createConnection();
try
{
psfin=con.prepareStatement(sfin);
psfin.setString(1,uid);
rsfin=psfin.executeQuery();
while(rsfin.next())

{

	srcimg=rsfin.getString("name");

	String newpath=basepath+"uploads"+uid;

	actimage=newpath+"/"+srcimg;
namelist.add(srcimg);
	reglist.add(actimage+" ");
	System.out.println(reglist);

	}

}

	catch(SQLException s)

	{

	System.out.println(s);

	}


	


%>
 <%
   
     for(int j=0;j<reglist.size();j++)
{ 
    	
	%> 
	<a href="<%=reglist.get(j) %>" class="swipebox" title="<%=namelist.get(j)%>"> 
	<img src="<%=reglist.get(j) %>" style="position:relative;top:25%;width:20%;height:30%;left:7%" alt=""> 
	<span class="zoom-icon"></span></a>

<%
}
     %>

</body>
</html>