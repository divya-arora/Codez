package googie.servlets;

import googie.dbinfo.CrudOperation;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class Uploadsnap
 */
@WebServlet("/Uploadsnap")
public class Uploadsnap extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MultipartRequest mpt=null;
	PreparedStatement ps=null;
	PreparedStatement psid=null;
	int rgid;
	ResultSet rsid=null;
	
	Connection con=null; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uploadsnap() {
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
		// TODO Auto-generated method stub
		HttpSession hs=request.getSession(false);
		String uid=(String)hs.getAttribute("userinfo");
		String pt=getServletContext().getRealPath("/");
		String newpath=pt+"uploads"+"eve";
		PrintWriter out=response.getWriter();
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
	String sql="select max(eventid) from eventss";
	  con=CrudOperation.createConnection();
	 try
	    {
	    	PreparedStatement psid=con.prepareStatement(sql);
	    	ResultSet rsid=psid.executeQuery();
	    	rsid.next();
		int	rgid=rsid.getInt(1);
			System.out.println(rgid);


	String sf="update eventss set snap=? where eventid=?";
	
	try
	{
	ps=con.prepareStatement(sf);
	ps.setString(1,actname);
	ps.setInt(2, rgid);
	int rw=ps.executeUpdate();
	if(rw>0)
	{
		
	PreparedStatement psins=null;ResultSet rs=null;
		String strsql ="Select * from eventss";
		try
		{
			psins=con.prepareStatement(strsql);
			rs=psins.executeQuery();
			if(rs.next())
			{
			String utype =	rs.getString("userid");
			if(utype.equals("admin"))
			{
				response.sendRedirect("/Augmented/notify/eventcreated.html?ms1=EVENT HAS BEEN CREATED!!!");
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
	    }
	 catch(SQLException seee)
	 {
	 	System.out.print(seee);
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
