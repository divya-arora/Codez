package googie.servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import googie.dbinfo.CrudOperation;

/**
 * Servlet implementation class DeleteMsg
 */
@WebServlet("/DeleteMsg")
public class DeleteMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	ResultSet rs=null;PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMsg() {
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
		String[] mesgid=request.getParameterValues("chkdel");
		con=CrudOperation.createConnection();
		String sqlstr="update message set sstatus=? where msgid=?";
		try
		{
			ps=con.prepareStatement(sqlstr);
			con.setAutoCommit(false);
			for(int i=0;i<mesgid.length;i++)
			{
				ps.setInt(1, 0);
				ps.setInt(2, Integer.parseInt(mesgid[i]));
				ps.addBatch();
			}
			int[] rw=ps.executeBatch();
			con.commit();
			response.sendRedirect("/Augmented/jsp/sentitem.jsp");
			con.setAutoCommit(true);
		}
		catch (SQLException e) {
			System.out.println(e);
		}
	}

}
