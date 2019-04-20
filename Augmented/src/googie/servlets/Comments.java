package googie.servlets;

import googie.dbinfo.CrudOperation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Comments
 */
@WebServlet("/Comments")
public class Comments extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection con=null;
	private java.sql.PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comments() {
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
	
	String us=request.getParameter("user");
	String likes=request.getParameter("like");
	String comms=request.getParameter("txtcomment");
	PrintWriter pw=response.getWriter();
	pw.print(us+likes+comms);
	String strup="update rating set comments=? where userid=?";
	con=CrudOperation.createConnection();
    try
    {
    	ps=con.prepareStatement(strup);
    	ps.setString(1, comms);
    	ps.setString(2, us);
	    int rw=ps.executeUpdate();
	    if(rw>0)
	    {
	    	response.sendRedirect("/Augmented/notify/commented.html");
	    }
    }
    catch (SQLException se) {
    System.out.println(se);
    }
    finally
    {
    	try
		{
			
			if(ps!=null)
			{ps.close();}
			if(con!=null)
			{con.close();}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
    }


	
	
	
	
	}

}
