package googie.servlets;

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

import googie.dbinfo.CrudOperation;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con =null;
	private HttpSession hs=null;
	private PreparedStatement ps =null;
	private ResultSet rs =null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String ui=request.getParameter("username");
		String upass=request.getParameter("password");
		con=CrudOperation.createConnection();
		String strsql ="Select * from logindetail where pass = ? and userid = ? ";
		try
		{
			ps=con.prepareStatement(strsql);
			ps.setString(1,upass);
			ps.setString(2,ui);
			rs=ps.executeQuery();
			if(rs.next())
			{
				hs=request.getSession();
				hs.setAttribute("userinfo", ui);
			String utype =	rs.getString("type");
			if(utype.equals("admin"))
			{
				response.sendRedirect("/Augmented/jsp/adminprofile.jsp");
			}
			 if(utype.equalsIgnoreCase("user"))
			{
				response.sendRedirect("/Augmented/jsp/index.jsp");
			}
			
			}
			else
			{
				response.sendRedirect("/Augmented/html/index1.html?msg=Invalid UserId or Password");
			}
			
			
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
			
	
	
	}

}
