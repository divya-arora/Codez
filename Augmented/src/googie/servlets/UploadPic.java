package googie.servlets;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import googie.dbinfo.CrudOperation;
import java.sql.*;
import java.util.Enumeration;

import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class UploadPic
 */
@WebServlet("/UploadPic")
public class UploadPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MultipartRequest mpt=null;
	PreparedStatement ps=null;
	Connection con=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		String uid=(String)hs.getAttribute("userinfo");
		String pt=getServletContext().getRealPath("/");
		String newpath=pt+"uploads"+uid;
	PrintWriter out=response.getWriter();
	out.print("upload"+uid);
		File f=new File(newpath);
		
		if(!f.exists())
		{
			f.mkdir();
		}
	mpt=new MultipartRequest(request, newpath,5*1024*1024);
	
	String ctrlnm=null;
	File fobby=null;
	String actname=null;
	Enumeration e=mpt.getFileNames();
	while(e.hasMoreElements())
	{
		ctrlnm=(String)e.nextElement();
		fobby=mpt.getFile(ctrlnm);
		actname=fobby.getName();
	}
	
	con=CrudOperation.createConnection();
	String sf="update profile set pic=? where userid=?";
	
	try
	{
	ps=con.prepareStatement(sf);
	ps.setString(1,actname);
	ps.setString(2,uid);
	int rw=ps.executeUpdate();
	if(rw>0)
	{
		
	PreparedStatement psins=null;ResultSet rs=null;
		String strsql ="Select * from logindetail where userid = ? ";
		try
		{
			psins=con.prepareStatement(strsql);
			psins.setString(1,uid);
			rs=psins.executeQuery();
			if(rs.next())
			{
			String utype =	rs.getString("type");
			if(utype.equals("admin"))
			{
				response.sendRedirect("/Augmented/jsp/adminprofile.jsp");
			}
			
			else if(utype.equalsIgnoreCase("user"))
			{
				response.sendRedirect("/Augmented/jsp/userprofile.jsp");
			}
			}
		}
		catch (SQLException se) {
System.out.println(se);
		}
	}
	
	}
	catch (SQLException ef) {
		System.out.println(ef);
	
	}
	finally
	{
		try
		{
			if(ps!=null)
				ps.close();
			
			if(con!=null)
				con.close();
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
	}
	}

}
