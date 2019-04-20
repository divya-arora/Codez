package googie.servlets;

import googie.dbinfo.CrudOperation;

import java.io.*;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class JoinEvents
 */
@WebServlet("/JoinEvents")
public class JoinEvents extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con =null;
	private HttpSession hs=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinEvents() {
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
		String etype=request.getParameter("type");
		String edate=request.getParameter("date");
		String evenid=request.getParameter("evid");
		PrintWriter pw=response.getWriter();
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
			
					pw.print("You have already joined");
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
				pw.print("inserted");
				response.sendRedirect("/Augmented/jsp/joined.jsp");
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


		/*try
		{
			ps=con.prepareStatement(str);
			ps.setString(1,evenid);
			ps.setString(2, uid);
			ps.setString(3,edate);
			ps.setString(4,etype);
			
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				System.out.println("1 row inserted");
				response.sendRedirect("/Augmented/jsp/uploadentries.jsp");
			}
		}
		catch (SQLException se) {
			System.out.println(se);
		}
	
	}

}

*/