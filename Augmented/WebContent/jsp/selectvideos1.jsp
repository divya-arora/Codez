<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,javax.servlet.*,googie.dbinfo.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<%
Connection con=null;
String [] id=request.getParameterValues("imgid");
String uid=request.getParameter("userid");
String eid=request.getParameter("evid");
con=CrudOperation.createConnection();
String sqlstr="insert into eventvideos values(?,?,?)";
try
{
	PreparedStatement ps=con.prepareStatement(sqlstr);
	con.setAutoCommit(false);
	for(int i=0;i<id.length;i++)
	{
		ps.setString(1,eid);
		ps.setString(2,uid);
		ps.setString(3,id[i]);
		ps.addBatch();
	}
	int[] rw=ps.executeBatch();
	con.commit();
	response.sendRedirect("/Augmented/notify/selected.html");
	con.setAutoCommit(true);
}
catch (SQLException e) {
	System.out.println(e);
}
%>
</body>
</html>