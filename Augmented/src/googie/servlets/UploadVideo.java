package googie.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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

import googie.dbinfo.CrudOperation;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UploadVideo
 */
@WebServlet("/UploadVideo")
public class UploadVideo extends HttpServlet {
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
    public UploadVideo() {
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
		String newpath=pt+"uploads"+uid;
		File f=new File(newpath);
		
		if(!f.exists())
		{
			f.mkdir();
		}
	mpt=new MultipartRequest(request, newpath,50*1024*1024);
	String ctrlnm=null;
	File fobby=null;
	String actname=null;
	Enumeration e=mpt.getFileNames();
	while(e.hasMoreElements())
	{
		ctrlnm=(String)e.nextElement();
		fobby=mpt.getFile(ctrlnm);
		actname=fobby.getName();
	/*}*/
	}
	con=CrudOperation.createConnection();
	String sf="insert into videos(userid,name) values(?,?)";
	
	try
	{
		
	ps=con.prepareStatement(sf);
	ps.setString(1,uid);
	ps.setString(2,actname);
	int rw=ps.executeUpdate();
		if(rw>0)
		{
			System.out.println("1 row inserted");
			response.sendRedirect("/Augmented/jsp/upvideo.jsp");
			
			/*String sql="select max(vid) from videos";
			  con=CrudOperation.createConnection();
			    try
			    {
			    	psid=con.prepareStatement(sql);
			    	rsid=psid.executeQuery();
			    	rsid.next();
					rgid=rsid.getInt(1);
					System.out.println(rgid);
			    
			    String strs="select name fron videos where vid=?";
			    try
			    {
			    		ps=con.prepareStatement(strs);
			    		ps.setInt(1,rgid);
			    		ResultSet rsname=ps.executeQuery();
			    		if(rsname.next())
			    		{
			    			response.sendRedirect("/Augmented/jsp/upvideo.jsp");
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
			    
		}
	
*/	}
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

