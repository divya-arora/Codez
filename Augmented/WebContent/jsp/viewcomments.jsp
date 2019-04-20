<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,googie.dbinfo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="background-image: url('/Augmented/images/header.jpg')">
<%
Connection con=null;PreparedStatement ps=null;ResultSet rs=null;
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("userinfo");
System.out.println(uid);
con=CrudOperation.createConnection();
String strcom="select * from rating where userid=?";
try
{
	ps=con.prepareStatement(strcom);
	ps.setString(1,uid);
	rs=ps.executeQuery();
while(rs.next())
{
	

%>
<marquee behavior="scroll" direction="up">
<h1>YOU HAVE BEEN RATED<%=rs.getString("rate") %> BY <%=rs.getString("likeid") %></h1>

<%if(!(rs.getString("comments").equals("null")))
	{%>
	<h1><%=rs.getString("likeid") %> COMMENTED ON YOUR PROFILE</h1>
<h1><%=rs.getString("comments") %></h1>
<%} %>
</marquee>
<% 


}
}

catch(SQLException se)
{
	System.out.print(se);
}

%>
</body>
</html>