package googie.servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import googie.dbinfo.CrudOperation;

/**
 * Servlet implementation class createProfile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
    private PreparedStatement ps=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
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
		String des=request.getParameter("txtdesig");
		String about=request.getParameter("txtaboutme");
		con= CrudOperation.createConnection();
		String str="insert into profile values(?,?,?,?,?,?,?,?,?)"; 
		
		try
		{
			ps=con.prepareStatement(str);
			ps.setString(1, uid);
			ps.setString(2, name);
			ps.setString(3, gender);
			ps.setLong(4, Long.parseLong(phn));
			ps.setString(5, address);
			ps.setString(6, email);
			ps.setString(7, "null");
			ps.setString(8, des);
			ps.setString(9, about);
			int rw=ps.executeUpdate();
			
			if(rw>0)
			{
				System.out.println("1 row inserted");
				response.sendRedirect("/Augmented/notify/profilecreated.html?ms2=Welcome!!Profile has been created!!");
			}
		}
		catch (SQLException se) {
			System.out.println(se);
		}
	
	}

}
