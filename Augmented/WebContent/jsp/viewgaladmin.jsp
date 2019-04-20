<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,googie.dbinfo.*,java.util.*,javax.servlet.*,googie.beans.*,javax.servlet.http.HttpServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-image: url('/Augmented/images/header.jpg');">
<%ArrayList<String> reglist=new ArrayList<String>();

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
<span><img src="<%=reglist.get(j)%>" id="img1" style="psition:absolute;top:25%;width: 33%;height:33%"></img>

<%
}
     %>

</body>
</html>