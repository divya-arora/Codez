package googie.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import googie.dbinfo.CrudOperation;

/**
 * Servlet implementation class WriteMsg
 */
@WebServlet("/WriteMsg")
public class WriteMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
    private PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteMsg() {
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
		String rid=request.getParameter("rid");
		String subject=request.getParameter("sub");
		String date=request.getParameter("date");
		String msg=request.getParameter("msgtxt");
		String str="insert into message (senderid,receiverid,message,date,rstatus,sstatus,subject) values (?,?,?,?,?,?,?)";
		con= CrudOperation.createConnection();
		try
		{
			ps=con.prepareStatement(str);
	
			ps.setString(1,uid);
			ps.setString(2, rid);
			ps.setString(3, msg);
			ps.setDate(4, Date.valueOf(date));
			ps.setInt(5,1);
			ps.setInt(6, 1);
			ps.setString(7,subject);
			int rw=ps.executeUpdate();
			
			if(rw>0)
			{
				System.out.println("1 row inserted");
				response.sendRedirect("/Augmented/notify/sent.html?msg3=Message has been sent!");
			}
			
			
			
		}
		catch(SQLException se)
		{
			System.out.println(se);
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
