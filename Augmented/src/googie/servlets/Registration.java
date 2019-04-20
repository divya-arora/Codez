package googie.servlets;

import googie.dbinfo.CrudOperation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con =null;
	private HttpSession hs=null;
	private PreparedStatement ps =null;
	private ResultSet rs =null;
    
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
	String userid=request.getParameter("usernamesignup");
	String pass=request.getParameter("passwordsignup");
	String str="insert into logindetail values(?,?,?)";
	con=CrudOperation.createConnection();
	try
	{
		ps=con.prepareStatement(str);
		ps.setString(1,userid);
		ps.setString(2,pass);
		ps.setString(3,"user");
		int rw=ps.executeUpdate();
		if(rw>0)
		{
			System.out.println("1 row inserted");
			response.sendRedirect("/Augmented/notify/registered.html?ms2=Welcome!!You Have Been Registered!!");
		}
		/*else
		{
			response.sendRedirect("/Augmented/notify/alreadyreg.html?ms1=Get Away!!You Have Already Registered!!");
		}*/
	}
	catch (SQLException se) {
		System.out.println(se);
		response.sendRedirect("/Augmented/notify/alreadyreg.html?ms1=Get Away!!You Have Already Registered!!");
		
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



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	