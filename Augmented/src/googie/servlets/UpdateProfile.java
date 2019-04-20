package googie.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import googie.dbinfo.CrudOperation;

import java.sql.*;
/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con =null;PreparedStatement ps =null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
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
		String name=request.getParameter("txtname");
		String address=request.getParameter("txtaddress");
		String email=request.getParameter("txtmail");
		String phn=request.getParameter("txtphn");
		String gender=request.getParameter("gender");
		String desig=request.getParameter("txtdesig");
		String about=request.getParameter("txtaboutme");
		String strupdate="update profile set name=?,gender=?,phone=?,address=?,email=?,designation=?,aboutme=? where userid=?";
		con=CrudOperation.createConnection();
	    try
	    {
	    	ps=con.prepareStatement(strupdate);
	    	ps.setString(1, name);
	    	ps.setString(2, gender);
	    	ps.setLong(3, Long.parseLong(phn));
	    	ps.setString(4, address);
	    	ps.setString(5, email);
	    	ps.setString(6, desig);
	    	ps.setString(7, about);
	    	ps.setString(8, uid);
		    int rw=ps.executeUpdate();
		    if(rw>0)
		    {
		    	response.sendRedirect("/Augmented/notify/profileedit.html?msg1=Your profile has been updated successfully!!!");
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
