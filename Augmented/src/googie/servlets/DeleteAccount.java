package googie.servlets;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import googie.dbinfo.CrudOperation;


/**
 * Servlet implementation class DeleteAccount
 */
@WebServlet("/DeleteAccount")
public class DeleteAccount extends HttpServlet {
	
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
Connection con =null;
   PreparedStatement ps=null;
   ResultSet rs=null;
   
   
   public DeleteAccount()
   {
       super();
       // TODO Auto-generated constructor stub
   }
	
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
   {
		// TODO Auto-generated method stub
	}
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String strdel="insert into friends(userid,friendid) values(?,?)";
		con=CrudOperation.createConnection();
		try
		{
			String [] deluserid=request.getParameterValues("chkaccdel");
			ps=con.prepareStatement(strdel);
			con.setAutoCommit(false);
			for(int i=0;i<deluserid.length;i++)
			{
				ps.setString(1, deluserid[i]);
				ps.addBatch();
			}
				int[] ru=ps.executeBatch();
				con.commit();
				response.sendRedirect("/Augmented/jsp/delevents.jsp");
				con.setAutoCommit(true);
		}
				catch(SQLException se)
				{
					System.out.println(se);
				}
			}
	
		
	}


