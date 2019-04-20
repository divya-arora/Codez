package googie.servlets;

import googie.dbinfo.CrudOperation;

import java.io.*;
import java.sql.*;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AddEventsRandom
 */
@WebServlet("/AddEventsRandom")
public class AddEventsRandom extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MultipartRequest mpt=null;
	private Connection con =null;
	private HttpSession hs=null;
	private PreparedStatement ps =null;
	private PreparedStatement psevent =null;
	private ResultSet rs =null;
       
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEventsRandom() {
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
		int flag=0;
		HttpSession hs=request.getSession(false);
		String uid=(String)hs.getAttribute("userinfo");
		String upass=(String)request.getParameter("txtename");
		String ty=request.getParameter("type");
		String det=request.getParameter("details");
		String dt=request.getParameter("sel");
		PrintWriter pw=response.getWriter();
		/*pw.print(upass+dt+det+ty+uid);*/
		    con=CrudOperation.createConnection();
	    String strsql ="insert into eventss(eventname,eventtype,details,date,snap,userid) values(?,?,?,?,?,?) ";
	    String str="select * from eventss";
		try
		{
			psevent=con.prepareStatement(strsql);
			psevent.setString(1,upass);
			psevent.setString(2,ty);
			psevent.setString(3,det);
			psevent.setString(4,dt);
			psevent.setString(5,"null");
			psevent.setString(6,uid);
			try
			{
				ps=con.prepareStatement(str);
				rs=ps.executeQuery();
				if(rs!=null)
				{
			while(rs.next())
					
				{
				String dtt=rs.getString("date");
				if(dtt.equals(dt))
				{
		
				pw.print("alreay exists");
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
			int rw=psevent.executeUpdate();
			if(rw>0)
			{
			pw.print("inserted");
			response.sendRedirect("/Augmented/jsp/uploadsnap.jsp");
			}
			else
				pw.print("not inserted");
				}
				}
			
			
		
			catch(SQLException se)
			{
				System.out.print(se);
			}
			}
			
			
			
			
				}

